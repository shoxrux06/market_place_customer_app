import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../../core/constants/constants.dart';
import '../../../../../../../core/handlers/handlers.dart';
import '../../../../../../../core/utils/utils.dart';
import '../../../../../../../models/models.dart';
import '../../../../../../../repository/repository.dart';
import '../state/viewed_products_state.dart';

class ViewedProductsNotifier extends StateNotifier<ViewedProductsState> {
  final ProductsRepository _productsRepository;
  final CategoriesRepository _categoriesRepository;
  final BrandsRepository _brandsRepository;
  Timer? _timer;

  ViewedProductsNotifier(
    this._productsRepository,
    this._categoriesRepository,
    this._brandsRepository,
  ) : super(const ViewedProductsState());

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
        query: state.query,
        categoryId: state.selectedSearchCategoryId == 0
            ? null
            : state.selectedSearchCategoryId,
        brandId: state.selectedSearchBrandId == 0
            ? null
            : state.selectedSearchBrandId,
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
            brands: data.data ?? [],
            isBrandsLoading: false,
          );
        },
        failure: (failure) {
          state = state.copyWith(isBrandsLoading: false);
          debugPrint('==> get brands failure: $failure');
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

  Future<void> fetchViewedProducts(BuildContext context) async {
    final List<int> ids = LocalStorage.instance.getViewedProductsList();
    if (ids.isEmpty) {
      fetchCategories(context);
      fetchBrands(context);
      return;
    }
    final connected = await AppConnectivity.connectivity();
    if (connected) {
      state = state.copyWith(isViewedProductsLoading: true, viewedProducts: []);
      final response = await _productsRepository.getProductsByIds(ids);
      response.when(
        success: (data) async {
          final List<ProductData> viewedProducts = data.data ?? [];
          final List<ProductData> filtered = [];
          for (final productId in ids) {
            for (final viewedProduct in viewedProducts) {
              if (productId == viewedProduct.id) {
                filtered.add(viewedProduct);
              }
            }
          }
          state = state.copyWith(
            viewedProducts: filtered,
            filteredProducts: filtered,
            isViewedProductsLoading: false,
          );
          checkViewedProductIds();
          fetchCategories(context);
          fetchBrands(context);
        },
        failure: (failure) {
          state = state.copyWith(isViewedProductsLoading: false);
          if (failure == const NetworkExceptions.internalServerError()) {
            AppHelpers.showCheckFlash(
              context,
              AppHelpers.getTranslation(TrKeys.somethingWentWrongWithTheServer),
            );
          }
          debugPrint('==> get viewed products failure: $failure');
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

  Future<void> filterProducts() async {
    state = state.copyWith(isViewedProductsLoading: true);
    List<ProductData> filtered = [];
    for (final product in state.viewedProducts) {
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
      isViewedProductsLoading: false,
    );
  }

  void setSelectedCategoryId(int? id) {
    state = state.copyWith(selectedCategoryId: id ?? 0);
  }

  void setListAlignment(ListAlignment alignment) {
    state = state.copyWith(listAlignment: alignment);
  }

  void clearSearchFilters() {
    state =
        state.copyWith(selectedSearchCategoryId: 0, selectedSearchBrandId: 0);
  }

  void clearFilters() {
    state = state.copyWith(selectedCategoryId: 0, selectedBrandId: 0);
  }

  void setSelectedSearchCategoryId(int? id) {
    state = state.copyWith(selectedSearchCategoryId: id ?? 0);
  }

  void setSelectedSearchBrandId(int? id) {
    state = state.copyWith(selectedSearchBrandId: id ?? 0);
  }

  void setSelectedBrandId(int? id) {
    state = state.copyWith(selectedBrandId: id ?? 0);
  }

  void checkViewedProductIds() {
    final List<int> productIds = LocalStorage.instance.getViewedProductsList();
    final List<int> newProductIds = [];
    for (final product in state.viewedProducts) {
      for (final id in productIds) {
        if (id == product.id) {
          newProductIds.add(id);
          break;
        }
      }
    }
    LocalStorage.instance.setViewedProductsList(newProductIds);
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
}
