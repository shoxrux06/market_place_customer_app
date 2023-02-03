import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../../core/constants/constants.dart';
import '../../../../../../../core/utils/utils.dart';
import '../../../../../../../repository/repository.dart';
import '../state/shop_details_state.dart';

class ShopDetailsNotifier extends StateNotifier<ShopDetailsState> {
  final BrandsRepository _brandsRepository;
  final ProductsRepository _productsRepository;
  final CategoriesRepository _categoriesRepository;
  final BannersRepository _bannersRepository;
  Timer? _timer;

  ShopDetailsNotifier(
    this._brandsRepository,
    this._productsRepository,
    this._categoriesRepository,
    this._bannersRepository,
  ) : super(const ShopDetailsState());

  void setIndex(int index) {
    state = state.copyWith(bannerIndex: index);
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
          print('Brands List *****${data.data?.toList()}*****');
          print('Brands List Length *****${data.data?.toList().length}*****');
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

  List<String> getDeliveryHours(String openTime, String closeTime) {
    List<String> hours = [];
    final int openHour = int.parse(openTime.substring(3, 5)) == 0
        ? int.parse(openTime.substring(0, 2))
        : int.parse(openTime.substring(0, 2)) + 1;
    final int closeHour = int.parse(closeTime.substring(0, 2));
    for (int i = openHour; i < closeHour; i++) {
      hours.add('$i:00 - ${i + 1}:00');
    }
    return hours;
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
        shopId: state.shopData?.id ?? 0,
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
        },
        failure: (failure) {
          state = state.copyWith(isSearchLoading: false);
          debugPrint('==> search products by shop id failure: $failure');
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

  void setSelectedCategory(int categoryId) {
    final selected =
        state.categories.firstWhere((element) => element.id == categoryId);
    state = state.copyWith(
      selectedCategory: selected,
      subCategories: selected.children ?? [],
    );
  }

  Future<void> fetchMostSoldProducts({VoidCallback? checkYourNetwork}) async {
    final connected = await AppConnectivity.connectivity();
    if (connected) {
      state = state.copyWith(
        isMostSoldProductsLoading: true,
        mostSoldProducts: [],
      );
      final response = await _productsRepository.getMostSoldProducts(
        shopId: state.shopData?.id,
      );
      response.when(
        success: (data) async {
          state = state.copyWith(
            isMostSoldProductsLoading: false,
            mostSoldProducts: data.data ?? [],
          );
        },
        failure: (failure) {
          state = state.copyWith(isMostSoldProductsLoading: false);
          debugPrint('==> fetch most sold products failure: $failure');
        },
      );
    } else {
      checkYourNetwork?.call();
    }
  }

  Future<void> fetchDiscountProducts({VoidCallback? checkYourNetwork}) async {
    final connected = await AppConnectivity.connectivity();
    if (connected) {
      state = state.copyWith(
        isDiscountProductsLoading: true,
        discountProducts: [],
      );
      final response = await _productsRepository.getDiscountProducts(
          shopId: state.shopData?.id);
      response.when(
        success: (data) async {
          state = state.copyWith(
            discountProducts: data.data ?? [],
            isDiscountProductsLoading: false,
          );
        },
        failure: (failure) {
          state = state.copyWith(isDiscountProductsLoading: false);
          debugPrint('==> fetch discount products failure: $failure');
        },
      );
    } else {
      checkYourNetwork?.call();
    }
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
    state = state.copyWith(
      selectedCategoryId: 0,
      selectedBrandId: 0,
    );
  }

  void setSelectedCategoryId(int id) {
    state = state.copyWith(selectedCategoryId: id);
  }

  void setSelectedBrandId(int? id) {
    state = state.copyWith(selectedBrandId: id ?? 0);
  }

  Future<void> fetchBanners({VoidCallback? checkYourNetwork}) async {
    final connected = await AppConnectivity.connectivity();
    if (connected) {
      state = state.copyWith(isBannersLoading: true);
      final response =
          await _bannersRepository.getBannersPaginate(BannerType.banner);
      response.when(
        success: (data) {
          state = state.copyWith(
            banners: data.data ?? [],
            isBannersLoading: false,
          );
        },
        failure: (failure) {
          state = state.copyWith(isBannersLoading: false);
          debugPrint('==> get banners failure: $failure');
        },
      );
    } else {
      checkYourNetwork?.call();
    }
  }

  void setActiveBanner(int index) {
    state = state.copyWith(bannerIndex: index);
  }

  Future<void> fetchCategories({VoidCallback? checkYourNetwork}) async {
    final connected = await AppConnectivity.connectivity();
    if (connected) {
      state = state.copyWith(isCategoriesLoading: true);
      final response = await _categoriesRepository.getAllCategories();
      response.when(
        success: (data) {
          state = state.copyWith(
            categories: data.data ?? [],
            isCategoriesLoading: false,
          );
        },
        failure: (failure) {
          state = state.copyWith(isCategoriesLoading: false);
          debugPrint('==> get categories failure: $failure');
        },
      );
    } else {
      checkYourNetwork?.call();
    }
  }
}
