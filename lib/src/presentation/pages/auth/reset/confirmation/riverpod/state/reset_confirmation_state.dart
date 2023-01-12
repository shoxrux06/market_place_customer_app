import 'package:freezed_annotation/freezed_annotation.dart';

part 'reset_confirmation_state.freezed.dart';

@freezed
class ResetConfirmationState with _$ResetConfirmationState {
  const factory ResetConfirmationState({
    @Default(false) bool isLoading,
    @Default(false) bool isTimeExpired,
    @Default(false) bool isResending,
    @Default(false) bool isConfirmCodeError,
    @Default('') String confirmCode,
    @Default('') String timerText,
  }) = _ResetConfirmationState;

  const ResetConfirmationState._();
}