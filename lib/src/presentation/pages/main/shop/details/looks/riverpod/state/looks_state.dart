import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../../../../models/models.dart';

part 'looks_state.freezed.dart';

@freezed
class LooksState with _$LooksState {
  const factory LooksState({
    @Default(false) bool isLoading,
    @Default(false) bool isMoreLoading,
    @Default([]) List<BannerData> looks,
    @Default([]) List<LookLikeData> lookLikes,
  }) = _LooksState;

  const LooksState._();
}
