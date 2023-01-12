import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../../../models/models.dart';

part 'blogs_state.freezed.dart';

@freezed
class BlogsState with _$BlogsState {
  const factory BlogsState({
    @Default(false) bool isLoading,
    @Default(false) bool isMoreLoading,
    @Default([]) List<BlogData> blogs,
  }) = _BlogsState;

  const BlogsState._();
}