import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../../../../../../core/constants/constants.dart';
import '../../../../../../../../../../models/models.dart';

part 'look_products_state.freezed.dart';

@freezed
class LookProductsState with _$LookProductsState {
  const factory LookProductsState({
    @Default(false) bool isLoading,
    @Default([]) List<ProductData> products,
    @Default([]) List<List<TypedExtra>> listOfTypedExtras,
    @Default([]) List<List<Stocks>> listOfInitialStocks,
    @Default([]) List<List<int>> listOfSelectedIndexes,
    @Default([]) List<Stocks?> listOfSelectedStocks,
    @Default([]) List<LookProductStockStatus> productsAddedToCart,
  }) = _LookProductsState;

  const LookProductsState._();
}
