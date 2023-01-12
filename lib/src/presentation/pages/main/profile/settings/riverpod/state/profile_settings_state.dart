import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../../../models/models.dart';

part 'profile_settings_state.freezed.dart';

@freezed
class ProfileSettingsState with _$ProfileSettingsState {
  const factory ProfileSettingsState({
    @Default(false) bool isLoading,
    @Default(false) bool isSaving,
    @Default(false) bool isUpdatingImage,
    @Default(false) bool isVisibleNew,
    @Default(false) bool isVisibleConfirm,
    @Default(false) bool isPhoneEditable,
    @Default('') String male,
    @Default('') String firstName,
    @Default('') String lastName,
    @Default('') String dob,
    @Default('') String phone,
    @Default('') String email,
    @Default('') String newPassword,
    @Default('') String confirmPassword,
    ProfileResponse? userResponse,
    String? imageUrl,
  }) = _ProfileSettingsState;

  const ProfileSettingsState._();
}
