import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../../core/constants/constants.dart';
import '../../../../../../../core/handlers/handlers.dart';
import '../../../../../../../core/utils/utils.dart';
import '../../../../../../../models/data/blog_data.dart';
import '../../../../../../../repository/repository.dart';
import '../state/blogs_state.dart';

class BlogsNotifier extends StateNotifier<BlogsState> {
  final BlogsRepository _blogsRepository;
  int _page = 0;
  bool _hasMore = true;

  BlogsNotifier(this._blogsRepository) : super(const BlogsState());

  Future<void> fetchBlogs(BuildContext context) async {
    if (!_hasMore) {
      return;
    }
    final connected = await AppConnectivity.connectivity();
    if (connected) {
      if (_page == 0) {
        state = state.copyWith(isLoading: true, blogs: []);
        final response = await _blogsRepository.getBlogs(++_page, 'blog');
        response.when(
          success: (data) {
            state = state.copyWith(blogs: data.data ?? [], isLoading: false);
            if ((data.data?.length ?? 0) < 15) {
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
            debugPrint('==> get blogs failure: $failure');
          },
        );
      } else {
        state = state.copyWith(isMoreLoading: true);
        final response = await _blogsRepository.getBlogs(++_page, 'blog');
        response.when(
          success: (data) async {
            final List<BlogData> newList = List.from(state.blogs);
            newList.addAll(data.data ?? []);
            state = state.copyWith(
              blogs: newList,
              isMoreLoading: false,
            );
            if ((data.data?.length ?? 0) < 15) {
              _hasMore = false;
            }
          },
          failure: (failure) {
            state = state.copyWith(isMoreLoading: false);
            debugPrint('==> get blogs failure: $failure');
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
}
