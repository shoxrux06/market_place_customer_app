import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../../../models/models.dart';

part 'saved_stores_state.freezed.dart';

@freezed
class SavedStoresState with _$SavedStoresState {
  const factory SavedStoresState({
    @Default(false) bool isLoading,
    @Default(false) bool isSearching,
    @Default(false) bool isSearchLoading,
    @Default('') String query,
    @Default([]) List<ShopData> searchedShops,
    @Default([]) List<ShopData> shops,
  }) = _SavedStoresState;

  const SavedStoresState._();
}