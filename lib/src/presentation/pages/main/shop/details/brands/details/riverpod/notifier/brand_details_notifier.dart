import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../../../../core/constants/constants.dart';
import '../../../../../../../../../core/utils/utils.dart';
import '../../../../../../../../../models/models.dart';
import '../../../../../../../../../repository/repository.dart';
import '../state/brand_details_state.dart';

class BrandDetailsNotifier extends StateNotifier<BrandDetailsState> {
  final BrandsRepository _brandsRepository;
  final ProductsRepository _productsRepository;
  final CategoriesRepository _categoriesRepository;
  int _page = 0;
  bool hasMore = true;
  Timer? _timer;

  BrandDetailsNotifier(
    this._brandsRepository,
    this._productsRepository,
    this._categoriesRepository,
  ) : super(const BrandDetailsState());

  Future<void> fetchBrandDetails(BuildContext context, int id) async {
    final connected = await AppConnectivity.connectivity();
    if (connected) {
      state = state.copyWith(
        isLoading: true,
        productsCount: 0,
        products: [],
        brand: null,
      );
      final response = await _brandsRepository.getSingleBrand(id);
      response.when(
        success: (data) {
          state = state.copyWith(brand: data.data, isLoading: false);
          fetchProducts(context);
          fetchCategories(context);
        },
        failure: (failure) {
          state = state.copyWith(isLoading: false);
          debugPrint('==> get single brand failure: $failure');
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

  Future<void> fetchProducts(BuildContext context) async {
    if (!hasMore || state.isMoreLoading) {
      return;
    }
    final connected = await AppConnectivity.connectivity();
    if (connected) {
      if (_page == 0) {
        state = state.copyWith(isProductsLoading: true);
        final response = await _productsRepository.getProductsPaginate(
          brandId: state.brand?.id ?? 0,
          categoryId:
              state.selectedCategoryId == 0 ? null : state.selectedCategoryId,
          page: ++_page,
        );
        response.when(
          success: (data) {
            state = state.copyWith(
              products: data.data ?? [],
              isProductsLoading: false,
              productsCount: data.meta?.total ?? 0,
            );
            if ((data.data?.length ?? 0) < 15) {
              hasMore = false;
            }
          },
          failure: (failure) {
            state = state.copyWith(isProductsLoading: false);
            debugPrint('==> get products by brand id failure: $failure');
          },
        );
      } else {
        state = state.copyWith(isMoreLoading: true);
        final response = await _productsRepository.getProductsPaginate(
          brandId: state.brand?.id ?? 0,
          page: ++_page,
        );
        response.when(
          success: (data) async {
            final List<ProductData> newList = List.from(state.products);
            newList.addAll(data.data ?? []);
            state = state.copyWith(isMoreLoading: false, products: newList);
            if ((data.data?.length ?? 0) < 15) {
              hasMore = false;
            }
          },
          failure: (activeFailure) {
            state = state.copyWith(isMoreLoading: false);
            debugPrint('==> get products by brand id failure: $activeFailure');
          },
        );
      }
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
        brandId: state.brand?.id ?? 0,
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
          debugPrint('==> search products by brand id failure: $activeFailure');
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

  void setSelectedCategoryId(int? id) {
    state = state.copyWith(selectedCategoryId: id ?? 0);
  }

  Future<void> filterProducts(BuildContext context) async {
    hasMore = true;
    _page = 0;
    fetchProducts(context);
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
}
