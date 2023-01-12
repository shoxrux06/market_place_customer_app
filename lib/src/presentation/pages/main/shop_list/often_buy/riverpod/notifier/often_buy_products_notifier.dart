import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../../core/constants/constants.dart';
import '../../../../../../../core/utils/utils.dart';
import '../../../../../../../repository/repository.dart';
import '../state/often_buy_products_state.dart';

class OftenBuyProductsNotifier extends StateNotifier<OftenBuyProductsState> {
  final BrandsRepository _brandsRepository;
  final ProductsRepository _productsRepository;
  final CategoriesRepository _categoriesRepository;
  Timer? _timer;

  OftenBuyProductsNotifier(
    this._brandsRepository,
    this._productsRepository,
    this._categoriesRepository,
  ) : super(const OftenBuyProductsState());

  Future<void> fetchProducts(BuildContext context) async {
    final connected = await AppConnectivity.connectivity();
    if (connected) {
      state = state.copyWith(isLoading: true);
      final response = await _productsRepository.getMostSoldProducts(
        brandId: state.selectedBrandId == 0 ? null : state.selectedBrandId,
        categoryId:
            state.selectedCategoryId == 0 ? null : state.selectedCategoryId,
      );
      response.when(
        success: (data) {
          state = state.copyWith(products: data.data ?? [], isLoading: false);
        },
        failure: (failure) {
          state = state.copyWith(isLoading: false);
          debugPrint('==> get often buy products failure: $failure');
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
        categoryId: state.selectedSearchCategoryId == 0
            ? null
            : state.selectedSearchCategoryId,
        brandId: state.selectedSearchBrandId == 0
            ? null
            : state.selectedSearchBrandId,
        query: state.query,
      );
      response.when(
        success: (data) async {
          state = state.copyWith(
            isSearchLoading: false,
            searchedProducts: data.data ?? [],
          );
        },
        failure: (failure) {
          state = state.copyWith(isSearchLoading: false);
          debugPrint('==> search products failure: $failure');
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
    state = state.copyWith(selectedCategoryId: 0, selectedBrandId: 0);
  }

  void clearSearchFilters() {
    state = state.copyWith(
      selectedSearchCategoryId: 0,
      selectedSearchBrandId: 0,
    );
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
        failure: (failure) {
          state = state.copyWith(isBrandsLoading: false);
          debugPrint('==> get categories failure: $failure');
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
