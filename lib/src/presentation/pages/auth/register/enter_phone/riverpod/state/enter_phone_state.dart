import 'package:freezed_annotation/freezed_annotation.dart';

part 'enter_phone_state.freezed.dart';

@freezed
class EnterPhoneState with _$EnterPhoneState {
  const factory EnterPhoneState({
    @Default(false) bool isLoading,
    @Default(false) bool agreedToPrivacy,
    @Default(false) bool isGoogleLoading,
    @Default(false) bool isCurrenciesLoading,
    @Default('') String phone,
    @Default('') String verifyId,
  }) = _EnterPhoneState;

  const EnterPhoneState._();
}