import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_confirmation_state.freezed.dart';

@freezed
class RegisterConfirmationState with _$RegisterConfirmationState {
  const factory RegisterConfirmationState({
    @Default(false) bool isLoading,
    @Default(false) bool isResending,
    @Default(false) bool isTimeExpired,
    @Default(false) bool isCodeError,
    @Default(false) bool isInitializing,
    @Default('') String confirmCode,
    @Default('') String timerText,
  }) = _RegisterConfirmationState;

  const RegisterConfirmationState._();
}