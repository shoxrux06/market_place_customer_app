import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../../../core/constants/constants.dart';
import '../../../../../../../../core/utils/utils.dart';
import '../../../../../../../../models/models.dart';
import '../../../../../../../../repository/repository.dart';
import '../state/category_products_state.dart';

class CategoryProductsNotifier extends StateNotifier<CategoryProductsState> {
  final ProductsRepository _productsRepository;
  final BrandsRepository _brandsRepository;
  int _page = 0;
  bool hasMore = true;
  Timer? _timer;

  CategoryProductsNotifier(this._productsRepository, this._brandsRepository)
      : super(const CategoryProductsState());

  Future<void> fetchProducts(BuildContext context, int? categoryId) async {
    if (!hasMore || state.isMoreLoading) {
      return;
    }
    final connected = await AppConnectivity.connectivity();
    if (connected) {
      if (_page == 0) {
        state = state.copyWith(isLoading: true, products: []);
        final response = await _productsRepository.getProductsPaginate(
          categoryId: categoryId,
          brandId: state.selectedBrandId == 0 ? null : state.selectedBrandId,
          page: ++_page,
        );
        response.when(
          success: (data) {
            state = state.copyWith(
              products: data.data ?? [],
              isLoading: false,
              productsCount: data.meta?.total ?? 0,
            );
            if ((data.data?.length ?? 0) < 14) {
              hasMore = false;
            }
          },
          failure: (failure) {
            state = state.copyWith(isLoading: false);
            debugPrint('==> get products by category id failure: $failure');
          },
        );
      } else {
        state = state.copyWith(isMoreLoading: true);
        final response = await _productsRepository.getProductsPaginate(
          categoryId: categoryId,
          page: ++_page,
          brandId: state.selectedBrandId == 0 ? null : state.selectedBrandId,
        );
        response.when(
          success: (data) async {
            final List<ProductData> newList = List.from(state.products);
            newList.addAll(data.data ?? []);
            state = state.copyWith(isMoreLoading: false, products: newList);
            if ((data.data?.length ?? 0) < 14) {
              hasMore = false;
            }
          },
          failure: (activeFailure) {
            state = state.copyWith(isMoreLoading: false);
            debugPrint(
                '==> get products by category id failure: $activeFailure');
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

  void setQuery(BuildContext context, String query, int? categoryId) {
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
          searchProducts(context, categoryId);
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

  Future<void> searchProducts(BuildContext context, int? categoryId) async {
    final connected = await AppConnectivity.connectivity();
    if (connected) {
      state = state.copyWith(isSearchLoading: true, isSearching: true);
      final response = await _productsRepository.searchProducts(
        categoryId: categoryId,
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
        failure: (activeFailure) {
          state = state.copyWith(isSearchLoading: false);
          debugPrint(
              '==> search products by category id failure: $activeFailure');
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
    state = state.copyWith(selectedBrandId: 0);
  }

  void clearSearchFilters() {
    state = state.copyWith(selectedSearchBrandId: 0);
  }

  void setSelectedSearchBrandId(int? id) {
    state = state.copyWith(selectedSearchBrandId: id ?? 0);
  }

  void setSelectedBrandId(int? id) {
    state = state.copyWith(selectedBrandId: id ?? 0);
  }

  Future<void> filterProducts(BuildContext context, int? categoryId) async {
    hasMore = true;
    _page = 0;
    fetchProducts(context, categoryId);
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
