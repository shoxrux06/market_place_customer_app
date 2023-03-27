import 'package:freezed_annotation/freezed_annotation.dart';

part 'card_state.freezed.dart';

@freezed
class CardState with _$CardState {
  const factory CardState({
    @Default(false) bool isLoading,
    @Default(false) bool isResending,
    @Default(false) bool isTimeExpired,
    @Default(false) bool isCodeError,
    @Default(false) bool isInitializing,
    @Default('') String confirmCode,
    @Default('') String timerText,
  }) = _CardState;

  const CardState._();
}