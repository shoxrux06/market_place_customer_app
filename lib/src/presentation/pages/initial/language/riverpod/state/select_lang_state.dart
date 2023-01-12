import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../../models/models.dart';

part 'select_lang_state.freezed.dart';

@freezed
class SelectLangState with _$SelectLangState {
  const factory SelectLangState({
    @Default(false) bool isLoading,
    @Default(false) bool isSaving,
    @Default([]) List<LanguageData> languages,
    @Default(0) int selectedIndex,
  }) = _SelectLangState;

  const SelectLangState._();
}
