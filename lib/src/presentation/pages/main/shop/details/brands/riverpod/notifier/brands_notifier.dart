import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../../../core/constants/constants.dart';
import '../../../../../../../../core/utils/utils.dart';
import '../../../../../../../../models/models.dart';
import '../../../../../../../../repository/repository.dart';
import '../state/brands_state.dart';

class BrandsNotifier extends StateNotifier<BrandsState> {
  final BrandsRepository _brandsRepository;
  int _page = 0;
  bool _hasMore = true;
  Timer? _timer;

  BrandsNotifier(this._brandsRepository) : super(const BrandsState());

  Future<void> fetchBrands(BuildContext context) async {
    if (!_hasMore || state.isMoreLoading) {
      return;
    }
    final connected = await AppConnectivity.connectivity();
    if (connected) {
      if (_page == 0) {
        state = state.copyWith(isLoading: true, brands: []);
        final response = await _brandsRepository.getBrandsPaginate(++_page);
        response.when(
          success: (data) {
            state = state.copyWith(
              brands: data.data ?? [],
              isLoading: false,
            );
            if ((data.data?.length ?? 0) < 18) {
              _hasMore = false;
            }
            print('==> Brands ---> ${data.data}');
          },
          failure: (failure) {
            state = state.copyWith(isLoading: false);
            debugPrint('==> get brands paginate failure: $failure');
          },
        );
      } else {
        state = state.copyWith(isMoreLoading: true);
        final response = await _brandsRepository.getBrandsPaginate(++_page);
        response.when(
          success: (data) async {
            final List<BrandData> newList = List.from(state.brands);
            newList.addAll(data.data ?? []);
            state = state.copyWith(isMoreLoading: false, brands: newList);
            if ((data.data?.length ?? 0) < 18) {
              _hasMore = false;
            }
          },
          failure: (failure) {
            state = state.copyWith(isMoreLoading: false);
            debugPrint('==> get brands failure: $failure');
          },
        );
      }
    } else {
      if (mounted) {
        AppHelpers.showNoConnectionSnackBar(context);
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
          searchBrands(context);
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

  Future<void> searchBrands(BuildContext context) async {
    final connected = await AppConnectivity.connectivity();
    if (connected) {
      state = state.copyWith(isSearchLoading: true, isSearching: true);
      final response = await _brandsRepository.searchBrands(state.query);
      response.when(
        success: (data) async {
          state = state.copyWith(
            isSearchLoading: false,
            searchedBrands: data.data ?? [],
          );
        },
        failure: (failure) {
          state = state.copyWith(isSearchLoading: false);
          debugPrint('==> search brands failure: $failure');
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
