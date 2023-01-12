import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../../../../models/models.dart';

part 'brands_state.freezed.dart';

@freezed
class BrandsState with _$BrandsState {
  const factory BrandsState({
    @Default(false) bool isLoading,
    @Default(false) bool isSearching,
    @Default(false) bool isSearchLoading,
    @Default(false) bool isMoreLoading,
    @Default([]) List<BrandData> brands,
    @Default([]) List<BrandData> searchedBrands,
    @Default('') String query,
  }) = _BrandsState;

  const BrandsState._();
}