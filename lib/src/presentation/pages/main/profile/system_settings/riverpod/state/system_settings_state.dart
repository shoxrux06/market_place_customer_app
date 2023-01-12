import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../../../models/models.dart';

part 'system_settings_state.freezed.dart';

@freezed
class SystemSettingsState with _$SystemSettingsState {
  const factory SystemSettingsState({
    @Default(false) bool isCurrenciesLoading,
    @Default(false) bool isCurrencySaving,
    @Default([]) List<CurrencyData> currencies,
  }) = _SystemSettingsState;

  const SystemSettingsState._();
}