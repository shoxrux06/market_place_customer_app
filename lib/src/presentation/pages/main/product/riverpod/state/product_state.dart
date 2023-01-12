import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../../models/models.dart';

part 'product_state.freezed.dart';

@freezed
class ProductState with _$ProductState {
  const factory ProductState({
    @Default(false) bool isLoading,
    @Default(false) bool isRelatedProductsLoading,
    @Default(false) bool isViewedProductsLoading,
    @Default(false) bool isReviewing,
    @Default('') String activeImageUrl,
    @Default('') String reviewText,
    @Default([]) List<TypedExtra> typedExtras,
    @Default([]) List<Stocks> initialStocks,
    @Default([]) List<int> selectedIndexes,
    @Default([]) List<ProductData> relatedProducts,
    @Default([]) List<ProductData> viewedProducts,
    @Default([]) List<ReviewData> reviews,
    @Default(0) int stockCount,
    @Default(4.0) double rating,
    ProductData? product,
    Stocks? selectedStock,
    XFile? reviewFile,
  }) = _ProductState;

  const ProductState._();
}