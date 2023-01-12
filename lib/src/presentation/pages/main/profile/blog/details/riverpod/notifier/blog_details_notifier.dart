import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../../../core/constants/constants.dart';
import '../../../../../../../../core/handlers/handlers.dart';
import '../../../../../../../../core/utils/utils.dart';
import '../../../../../../../../repository/repository.dart';
import '../state/blog_details_state.dart';

class BlogDetailsNotifier extends StateNotifier<BlogDetailsState> {
  final BlogsRepository _blogsRepository;

  BlogDetailsNotifier(this._blogsRepository) : super(const BlogDetailsState());

  Future<void> fetchBlogDetails(BuildContext context, String uuid) async {
    final connected = await AppConnectivity.connectivity();
    if (connected) {
      state = state.copyWith(isLoading: true, blogDetails: null);
      final response = await _blogsRepository.getBlogDetails(uuid);
      response.when(
        success: (data) {
          state = state.copyWith(blogDetails: data, isLoading: false);
        },
        failure: (failure) {
          state = state.copyWith(isLoading: false);
          if (failure == const NetworkExceptions.internalServerError()) {
            AppHelpers.showCheckFlash(
              context,
              AppHelpers.getTranslation(TrKeys.somethingWentWrongWithTheServer),
            );
          }
          debugPrint('==> get blogs failure: $failure');
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
