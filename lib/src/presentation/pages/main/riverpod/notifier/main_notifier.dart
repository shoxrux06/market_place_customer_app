import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/constants/constants.dart';
import '../../../../../core/handlers/handlers.dart';
import '../../../../../core/utils/utils.dart';
import '../../../../../repository/repository.dart';
import '../state/main_state.dart';

class MainNotifier extends StateNotifier<MainState> {
  final ProductsRepository _productsRepository;
  final CategoriesRepository _categoriesRepository;
  final BrandsRepository _brandsRepository;
  Timer? _timer;

  MainNotifier(
    this._productsRepository,
    this._categoriesRepository,
    this._brandsRepository,
  ) : super(const MainState());

  void setQuery(BuildContext context, String query, TabsRouter tabsRouter) {
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
          searchProducts(context, tabsRouter);
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
          tabsRouter.setActiveIndex(state.lastActiveTab);
        },
      );
    }
  }

  Future<void> searchProducts(
    BuildContext context,
    TabsRouter tabsRouter,
  ) async {
    final connected = await AppConnectivity.connectivity();
    if (connected) {
      state = state.copyWith(isSearchLoading: true, isSearching: true);
      tabsRouter.setActiveIndex(2);
      final response = await _productsRepository.searchProducts(
        query: state.query,
        categoryId:
            state.selectedCategoryId == 0 ? null : state.selectedCategoryId,
        brandId: state.selectedBrandId == 0 ? null : state.selectedBrandId,
      );
      response.when(
        success: (data) async {
          state = state.copyWith(
            isSearchLoading: false,
            searchedProducts: data.data ?? [],
          );
          debugPrint('==> search products ${data.data?.length}');
        },
        failure: (activeFailure) {
          state = state.copyWith(isSearchLoading: false);
          debugPrint('==> search products on main failure: $activeFailure');
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
          if (failure == const NetworkExceptions.internalServerError()) {
            AppHelpers.showCheckFlash(
              context,
              AppHelpers.getTranslation(TrKeys.somethingWentWrongWithTheServer),
            );
          }
          debugPrint('==> get all brands failure: $failure');
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

  void setActiveTab(int index) {
    state = state.copyWith(lastActiveTab: index);
  }

  void setSelectedCategoryId(int id) {
    state = state.copyWith(selectedCategoryId: id);
  }

  void setSelectedBrandId(int? id) {
    state = state.copyWith(selectedBrandId: id ?? 0);
  }

  void setPriceFilter(PriceFilter filter) {
    state = state.copyWith(priceFilter: filter);
  }

  void clearFilters() {
    state = state.copyWith(
      selectedCategoryId: 0,
      selectedBrandId: 0,
    );
  }
}
