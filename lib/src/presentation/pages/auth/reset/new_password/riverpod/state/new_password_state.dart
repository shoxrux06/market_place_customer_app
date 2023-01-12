import 'package:freezed_annotation/freezed_annotation.dart';

part 'new_password_state.freezed.dart';

@freezed
class NewPasswordState with _$NewPasswordState {
  const factory NewPasswordState({
    @Default(false) bool isLoading,
    @Default(false) bool showNewPassword,
    @Default(false) bool showConfirmNewPassword,
    @Default(true) bool isConfirmPasswordSame,
    @Default('') String newPassword,
    @Default('') String confirmNewPassword,
  }) = _NewPasswordState;

  const NewPasswordState._();
}