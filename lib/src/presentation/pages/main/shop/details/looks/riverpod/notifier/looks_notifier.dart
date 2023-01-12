import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../../../core/constants/constants.dart';
import '../../../../../../../../core/handlers/handlers.dart';
import '../../../../../../../../core/utils/utils.dart';
import '../../../../../../../../models/models.dart';
import '../../../../../../../../repository/repository.dart';
import '../state/looks_state.dart';

class LooksNotifier extends StateNotifier<LooksState> {
  final BannersRepository _bannersRepository;
  int _page = 0;
  bool _hasMore = true;

  LooksNotifier(this._bannersRepository) : super(const LooksState());

  Future<void> fetchLooks(BuildContext context) async {
    if (!_hasMore) {
      return;
    }
    final connected = await AppConnectivity.connectivity();
    if (connected) {
      if (_page == 0) {
        state = state.copyWith(isLoading: true, looks: []);
        final response = await _bannersRepository
            .getBannersPaginate(BannerType.look, page: ++_page);
        response.when(
          success: (data) {
            final List<BannerData> looks = data.data ?? [];
            final List<LookLikeData> lookLikes = [];
            for (int i = 0; i < looks.length; i++) {
              lookLikes.add(LookLikeData(index: i, isLiking: false));
            }
            state = state.copyWith(
              looks: looks,
              isLoading: false,
              lookLikes: lookLikes,
            );
            if (looks.length < 10) {
              _hasMore = false;
            }
          },
          failure: (failure) {
            state = state.copyWith(isLoading: false);
            if (failure == const NetworkExceptions.internalServerError()) {
              AppHelpers.showCheckFlash(
                context,
                AppHelpers.getTranslation(
                  TrKeys.somethingWentWrongWithTheServer,
                ),
              );
            }
            debugPrint('==> get looks failure: $failure');
          },
        );
      } else {
        state = state.copyWith(isMoreLoading: true);
        final response = await _bannersRepository
            .getBannersPaginate(BannerType.look, page: ++_page);
        response.when(
          success: (data) async {
            final List<BannerData> looks = data.data ?? [];
            final List<LookLikeData> lookLikes = [];
            for (int i = 0; i < looks.length; i++) {
              lookLikes.add(LookLikeData(index: i, isLiking: false));
            }
            final List<BannerData> newLookList = List.from(state.looks);
            final List<LookLikeData> newLookLikeList =
                List.from(state.lookLikes);
            newLookList.addAll(looks);
            newLookLikeList.addAll(lookLikes);
            state = state.copyWith(
              looks: newLookList,
              lookLikes: newLookLikeList,
              isMoreLoading: false,
            );
            if (looks.length < 10) {
              _hasMore = false;
            }
          },
          failure: (failure) {
            state = state.copyWith(isMoreLoading: false);
            debugPrint('==> get looks failure: $failure');
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

  Future<void> likeLook(
    int lookIndex, {
    VoidCallback? checkYourNetwork,
    VoidCallback? youNeedToLoginFirst,
  }) async {
    if (LocalStorage.instance.getToken().isEmpty) {
      youNeedToLoginFirst?.call();
      return;
    }
    final connected = await AppConnectivity.connectivity();
    if (connected) {
      List<LookLikeData> lookLikes = List.from(state.lookLikes);
      lookLikes[lookIndex] = LookLikeData(index: lookIndex, isLiking: true);
      state = state.copyWith(lookLikes: lookLikes);
      final response =
          await _bannersRepository.likeBanner(state.looks[lookIndex].id);
      response.when(
        success: (data) {
          List<LookLikeData> lookLikes = List.from(state.lookLikes);
          lookLikes[lookIndex] =
              LookLikeData(index: lookIndex, isLiking: false);
          state = state.copyWith(lookLikes: lookLikes);
        },
        failure: (failure) {
          List<LookLikeData> lookLikes = List.from(state.lookLikes);
          lookLikes[lookIndex] =
              LookLikeData(index: lookIndex, isLiking: false);
          state = state.copyWith(lookLikes: lookLikes);
          if (failure == const NetworkExceptions.unauthorisedRequest()) {
            youNeedToLoginFirst?.call();
          }
          debugPrint('==> like look failure: $failure');
        },
      );
    } else {
      checkYourNetwork?.call();
    }
  }
}
