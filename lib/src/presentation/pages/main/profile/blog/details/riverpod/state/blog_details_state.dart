import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../../../../models/models.dart';

part 'blog_details_state.freezed.dart';

@freezed
class BlogDetailsState with _$BlogDetailsState {
  const factory BlogDetailsState({
    @Default(false) bool isLoading,
    BlogDetailsResponse? blogDetails,
  }) = _BlogDetailsState;

  const BlogDetailsState._();
}