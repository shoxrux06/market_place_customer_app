import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../../../core/constants/constants.dart';
import '../../../../../../../../core/utils/utils.dart';
import '../../../../../../../../models/models.dart';
import '../../../../../../../../repository/repository.dart';
import '../state/banner_details_state.dart';

class BannerDetailsNotifier extends StateNotifier<BannerDetailsState> {
  final BannersRepository _bannersRepository;
  final BrandsRepository _brandsRepository;
  final ProductsRepository _productsRepository;
  final CategoriesRepository _categoriesRepository;
  Timer? _timer;

  BannerDetailsNotifier(
    this._bannersRepository,
    this._brandsRepository,
    this._productsRepository,
    this._categoriesRepository,
  ) : super(const BannerDetailsState());

  Future<void> fetchBannerProducts(BuildContext context, int? id) async {
    final connected = await AppConnectivity.connectivity();
    if (connected) {
      state = state.copyWith(
        isLoading: true,
        productsCount: 0,
        products: [],
      );
      final response = await _bannersRepository.getBannerProducts(id);
      response.when(
        success: (data) {
          state = state.copyWith(
            products: data.data ?? [],
            filteredProducts: data.data ?? [],
            productsCount: data.meta?.total ?? 0,
            isLoading: false,
          );
          fetchCategories(context);
          fetchBrands(context);
        },
        failure: (failure) {
          state = state.copyWith(isLoading: false);
          debugPrint('==> get banner products failure: $failure');
        },
      );
    } else {
      if (mounted) {
        AppHelpers.showCheckFlash(
          context,
          AppHelpers.getTranslation(TrKeys.checkYourNetworkConnection),
        );
      }
    }
  }

  void setQuery(BuildContext context, String query) {
    if (state.query == query) {
      return;
    }
    state = state.copyWith(query: query.trim());
    if (state.query.isNotEmpty) {
      if (_timer?.isActive ?? false) {
        _timer?.cancel();
      }
      _timer = Timer(
        const Duration(milliseconds: 500),
        () {
          searchProducts(context);
        },
      );
    } else {
      if (_timer?.isActive ?? false) {
        _timer?.cancel();
      }
      _timer = Timer(
        const Duration(milliseconds: 500),
        () {
          state = state.copyWith(isSearching: false);
        },
      );
    }
  }

  Future<void> searchProducts(BuildContext context) async {
    final connected = await AppConnectivity.connectivity();
    if (connected) {
      state = state.copyWith(isSearchLoading: true, isSearching: true);
      final response = await _productsRepository.searchProducts(
        brandId: state.selectedSearchBrandId == 0
            ? null
            : state.selectedSearchBrandId,
        categoryId: state.selectedSearchCategoryId == 0
            ? null
            : state.selectedSearchCategoryId,
        query: state.query,
      );
      response.when(
        success: (data) async {
          state = state.copyWith(
            isSearchLoading: false,
            searchedProducts: data.data ?? [],
          );
        },
        failure: (activeFailure) {
          state = state.copyWith(isSearchLoading: false);
          debugPrint('==> search products failure: $activeFailure');
        },
      );
    } else {
      if (mounted) {
        AppHelpers.showNoConnectionSnackBar(context);
      }
    }
  }

  void setListAlignment(ListAlignment alignment) {
    state = state.copyWith(listAlignment: alignment);
  }

  Future<void> likeOrUnlikeProduct(int? productId) async {
    final List<int> likedProducts =
        LocalStorage.instance.getLikedProductsList();
    bool alreadyLiked = false;
    int indexLiked = 0;
    for (int i = 0; i < likedProducts.length; i++) {
      if (likedProducts[i] == productId) {
        alreadyLiked = true;
        indexLiked = i;
      }
    }
    if (alreadyLiked) {
      likedProducts.removeAt(indexLiked);
    } else {
      likedProducts.insert(0, productId ?? 0);
    }
    LocalStorage.instance.setLikedProductsList(likedProducts.toSet().toList());
    state = state.copyWith();
  }

  void clearFilters() {
    state = state.copyWith(selectedCategoryId: 0);
  }

  void clearSearchFilters() {
    state = state.copyWith(selectedSearchCategoryId: 0);
  }

  void setSelectedSearchCategoryId(int? id) {
    state = state.copyWith(selectedSearchCategoryId: id ?? 0);
  }

  void setSelectedSearchBrandId(int? id) {
    state = state.copyWith(selectedSearchBrandId: id ?? 0);
  }

  void setSelectedCategoryId(int? id) {
    state = state.copyWith(selectedCategoryId: id ?? 0);
  }

  void setSelectedBrandId(int? id) {
    state = state.copyWith(selectedBrandId: id ?? 0);
  }

  Future<void> filterProducts() async {
    state = state.copyWith(isLoading: true);
    List<ProductData> filtered = [];
    for (final product in state.products) {
      if (state.selectedBrandId != 0 && state.selectedCategoryId != 0) {
        if (product.brandId == state.selectedBrandId &&
            product.categoryId == state.selectedCategoryId) {
          filtered.add(product);
        }
      } else if (state.selectedBrandId != 0) {
        if (product.brandId == state.selectedBrandId) {
          filtered.add(product);
        }
      } else if (state.selectedCategoryId != 0) {
        if (product.categoryId == state.selectedCategoryId) {
          filtered.add(product);
        }
      } else {
        filtered.add(product);
      }
    }
    state = state.copyWith(
      filteredProducts: filtered,
      isLoading: false,
    );
  }

  Future<void> fetchCategories(BuildContext context) async {
    final connected = await AppConnectivity.connectivity();
    if (connected) {
      state = state.copyWith(isCategoriesLoading: true);
      final response = await _categoriesRepository.getAllCategories();
      response.when(
        success: (data) async {
          state = state.copyWith(
            isCategoriesLoading: false,
            categories: data.data ?? [],
          );
        },
        failure: (activeFailure) {
          state = state.copyWith(isCategoriesLoading: false);
          debugPrint('==> get categories failure: $activeFailure');
        },
      );
    } else {
      if (mounted) {
        AppHelpers.showNoConnectionSnackBar(context);
      }
    }
  }

  Future<void> fetchBrands(BuildContext context) async {
    final connected = await AppConnectivity.connectivity();
    if (connected) {
      state = state.copyWith(isBrandsLoading: true);
      final response = await _brandsRepository.getAllBrands();
      response.when(
        success: (data) async {
          state = state.copyWith(
            isBrandsLoading: false,
            brands: data.data ?? [],
          );
        },
        failure: (activeFailure) {
          state = state.copyWith(isBrandsLoading: false);
          debugPrint('==> get all brands failure: $activeFailure');
        },
      );
    } else {
      if (mounted) {
        AppHelpers.showCheckFlash(
          context,
          AppHelpers.getTranslation(TrKeys.checkYourNetworkConnection),
        );
      }
    }
  }
}
