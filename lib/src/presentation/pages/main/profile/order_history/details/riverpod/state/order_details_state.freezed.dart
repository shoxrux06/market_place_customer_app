// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'order_details_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$OrderDetailsState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isReviewing => throw _privateConstructorUsedError;
  bool get isCancelable => throw _privateConstructorUsedError;
  bool get canLeaveFeedback => throw _privateConstructorUsedError;
  List<ShopOrderDetails> get shopOrderDetails =>
      throw _privateConstructorUsedError;
  int get activeShopIndex => throw _privateConstructorUsedError;
  double get totalProductPrice => throw _privateConstructorUsedError;
  double get discount => throw _privateConstructorUsedError;
  double get totalProductTax => throw _privateConstructorUsedError;
  double get totalShopTax => throw _privateConstructorUsedError;
  double get coupon => throw _privateConstructorUsedError;
  double get deliveryFee => throw _privateConstructorUsedError;
  double get totalAmount => throw _privateConstructorUsedError;
  double get rating => throw _privateConstructorUsedError;
  String get reviewText => throw _privateConstructorUsedError;
  SingleOrderResponse? get orderResponse => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OrderDetailsStateCopyWith<OrderDetailsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderDetailsStateCopyWith<$Res> {
  factory $OrderDetailsStateCopyWith(
          OrderDetailsState value, $Res Function(OrderDetailsState) then) =
      _$OrderDetailsStateCopyWithImpl<$Res>;
  $Res call(
      {bool isLoading,
      bool isReviewing,
      bool isCancelable,
      bool canLeaveFeedback,
      List<ShopOrderDetails> shopOrderDetails,
      int activeShopIndex,
      double totalProductPrice,
      double discount,
      double totalProductTax,
      double totalShopTax,
      double coupon,
      double deliveryFee,
      double totalAmount,
      double rating,
      String reviewText,
      SingleOrderResponse? orderResponse});
}

/// @nodoc
class _$OrderDetailsStateCopyWithImpl<$Res>
    implements $OrderDetailsStateCopyWith<$Res> {
  _$OrderDetailsStateCopyWithImpl(this._value, this._then);

  final OrderDetailsState _value;
  // ignore: unused_field
  final $Res Function(OrderDetailsState) _then;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? isReviewing = freezed,
    Object? isCancelable = freezed,
    Object? canLeaveFeedback = freezed,
    Object? shopOrderDetails = freezed,
    Object? activeShopIndex = freezed,
    Object? totalProductPrice = freezed,
    Object? discount = freezed,
    Object? totalProductTax = freezed,
    Object? totalShopTax = freezed,
    Object? coupon = freezed,
    Object? deliveryFee = freezed,
    Object? totalAmount = freezed,
    Object? rating = freezed,
    Object? reviewText = freezed,
    Object? orderResponse = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isReviewing: isReviewing == freezed
          ? _value.isReviewing
          : isReviewing // ignore: cast_nullable_to_non_nullable
              as bool,
      isCancelable: isCancelable == freezed
          ? _value.isCancelable
          : isCancelable // ignore: cast_nullable_to_non_nullable
              as bool,
      canLeaveFeedback: canLeaveFeedback == freezed
          ? _value.canLeaveFeedback
          : canLeaveFeedback // ignore: cast_nullable_to_non_nullable
              as bool,
      shopOrderDetails: shopOrderDetails == freezed
          ? _value.shopOrderDetails
          : shopOrderDetails // ignore: cast_nullable_to_non_nullable
              as List<ShopOrderDetails>,
      activeShopIndex: activeShopIndex == freezed
          ? _value.activeShopIndex
          : activeShopIndex // ignore: cast_nullable_to_non_nullable
              as int,
      totalProductPrice: totalProductPrice == freezed
          ? _value.totalProductPrice
          : totalProductPrice // ignore: cast_nullable_to_non_nullable
              as double,
      discount: discount == freezed
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as double,
      totalProductTax: totalProductTax == freezed
          ? _value.totalProductTax
          : totalProductTax // ignore: cast_nullable_to_non_nullable
              as double,
      totalShopTax: totalShopTax == freezed
          ? _value.totalShopTax
          : totalShopTax // ignore: cast_nullable_to_non_nullable
              as double,
      coupon: coupon == freezed
          ? _value.coupon
          : coupon // ignore: cast_nullable_to_non_nullable
              as double,
      deliveryFee: deliveryFee == freezed
          ? _value.deliveryFee
          : deliveryFee // ignore: cast_nullable_to_non_nullable
              as double,
      totalAmount: totalAmount == freezed
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as double,
      rating: rating == freezed
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      reviewText: reviewText == freezed
          ? _value.reviewText
          : reviewText // ignore: cast_nullable_to_non_nullable
              as String,
      orderResponse: orderResponse == freezed
          ? _value.orderResponse
          : orderResponse // ignore: cast_nullable_to_non_nullable
              as SingleOrderResponse?,
    ));
  }
}

/// @nodoc
abstract class _$$_OrderDetailsStateCopyWith<$Res>
    implements $OrderDetailsStateCopyWith<$Res> {
  factory _$$_OrderDetailsStateCopyWith(_$_OrderDetailsState value,
          $Res Function(_$_OrderDetailsState) then) =
      __$$_OrderDetailsStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool isLoading,
      bool isReviewing,
      bool isCancelable,
      bool canLeaveFeedback,
      List<ShopOrderDetails> shopOrderDetails,
      int activeShopIndex,
      double totalProductPrice,
      double discount,
      double totalProductTax,
      double totalShopTax,
      double coupon,
      double deliveryFee,
      double totalAmount,
      double rating,
      String reviewText,
      SingleOrderResponse? orderResponse});
}

/// @nodoc
class __$$_OrderDetailsStateCopyWithImpl<$Res>
    extends _$OrderDetailsStateCopyWithImpl<$Res>
    implements _$$_OrderDetailsStateCopyWith<$Res> {
  __$$_OrderDetailsStateCopyWithImpl(
      _$_OrderDetailsState _value, $Res Function(_$_OrderDetailsState) _then)
      : super(_value, (v) => _then(v as _$_OrderDetailsState));

  @override
  _$_OrderDetailsState get _value => super._value as _$_OrderDetailsState;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? isReviewing = freezed,
    Object? isCancelable = freezed,
    Object? canLeaveFeedback = freezed,
    Object? shopOrderDetails = freezed,
    Object? activeShopIndex = freezed,
    Object? totalProductPrice = freezed,
    Object? discount = freezed,
    Object? totalProductTax = freezed,
    Object? totalShopTax = freezed,
    Object? coupon = freezed,
    Object? deliveryFee = freezed,
    Object? totalAmount = freezed,
    Object? rating = freezed,
    Object? reviewText = freezed,
    Object? orderResponse = freezed,
  }) {
    return _then(_$_OrderDetailsState(
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isReviewing: isReviewing == freezed
          ? _value.isReviewing
          : isReviewing // ignore: cast_nullable_to_non_nullable
              as bool,
      isCancelable: isCancelable == freezed
          ? _value.isCancelable
          : isCancelable // ignore: cast_nullable_to_non_nullable
              as bool,
      canLeaveFeedback: canLeaveFeedback == freezed
          ? _value.canLeaveFeedback
          : canLeaveFeedback // ignore: cast_nullable_to_non_nullable
              as bool,
      shopOrderDetails: shopOrderDetails == freezed
          ? _value._shopOrderDetails
          : shopOrderDetails // ignore: cast_nullable_to_non_nullable
              as List<ShopOrderDetails>,
      activeShopIndex: activeShopIndex == freezed
          ? _value.activeShopIndex
          : activeShopIndex // ignore: cast_nullable_to_non_nullable
              as int,
      totalProductPrice: totalProductPrice == freezed
          ? _value.totalProductPrice
          : totalProductPrice // ignore: cast_nullable_to_non_nullable
              as double,
      discount: discount == freezed
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as double,
      totalProductTax: totalProductTax == freezed
          ? _value.totalProductTax
          : totalProductTax // ignore: cast_nullable_to_non_nullable
              as double,
      totalShopTax: totalShopTax == freezed
          ? _value.totalShopTax
          : totalShopTax // ignore: cast_nullable_to_non_nullable
              as double,
      coupon: coupon == freezed
          ? _value.coupon
          : coupon // ignore: cast_nullable_to_non_nullable
              as double,
      deliveryFee: deliveryFee == freezed
          ? _value.deliveryFee
          : deliveryFee // ignore: cast_nullable_to_non_nullable
              as double,
      totalAmount: totalAmount == freezed
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as double,
      rating: rating == freezed
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      reviewText: reviewText == freezed
          ? _value.reviewText
          : reviewText // ignore: cast_nullable_to_non_nullable
              as String,
      orderResponse: orderResponse == freezed
          ? _value.orderResponse
          : orderResponse // ignore: cast_nullable_to_non_nullable
              as SingleOrderResponse?,
    ));
  }
}

/// @nodoc

class _$_OrderDetailsState extends _OrderDetailsState {
  const _$_OrderDetailsState(
      {this.isLoading = false,
      this.isReviewing = false,
      this.isCancelable = false,
      this.canLeaveFeedback = false,
      final List<ShopOrderDetails> shopOrderDetails = const [],
      this.activeShopIndex = 0,
      this.totalProductPrice = 0,
      this.discount = 0,
      this.totalProductTax = 0,
      this.totalShopTax = 0,
      this.coupon = 0,
      this.deliveryFee = 0,
      this.totalAmount = 0,
      this.rating = 4.0,
      this.reviewText = '',
      this.orderResponse})
      : _shopOrderDetails = shopOrderDetails,
        super._();

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isReviewing;
  @override
  @JsonKey()
  final bool isCancelable;
  @override
  @JsonKey()
  final bool canLeaveFeedback;
  final List<ShopOrderDetails> _shopOrderDetails;
  @override
  @JsonKey()
  List<ShopOrderDetails> get shopOrderDetails {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_shopOrderDetails);
  }

  @override
  @JsonKey()
  final int activeShopIndex;
  @override
  @JsonKey()
  final double totalProductPrice;
  @override
  @JsonKey()
  final double discount;
  @override
  @JsonKey()
  final double totalProductTax;
  @override
  @JsonKey()
  final double totalShopTax;
  @override
  @JsonKey()
  final double coupon;
  @override
  @JsonKey()
  final double deliveryFee;
  @override
  @JsonKey()
  final double totalAmount;
  @override
  @JsonKey()
  final double rating;
  @override
  @JsonKey()
  final String reviewText;
  @override
  final SingleOrderResponse? orderResponse;

  @override
  String toString() {
    return 'OrderDetailsState(isLoading: $isLoading, isReviewing: $isReviewing, isCancelable: $isCancelable, canLeaveFeedback: $canLeaveFeedback, shopOrderDetails: $shopOrderDetails, activeShopIndex: $activeShopIndex, totalProductPrice: $totalProductPrice, discount: $discount, totalProductTax: $totalProductTax, totalShopTax: $totalShopTax, coupon: $coupon, deliveryFee: $deliveryFee, totalAmount: $totalAmount, rating: $rating, reviewText: $reviewText, orderResponse: $orderResponse)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OrderDetailsState &&
            const DeepCollectionEquality().equals(other.isLoading, isLoading) &&
            const DeepCollectionEquality()
                .equals(other.isReviewing, isReviewing) &&
            const DeepCollectionEquality()
                .equals(other.isCancelable, isCancelable) &&
            const DeepCollectionEquality()
                .equals(other.canLeaveFeedback, canLeaveFeedback) &&
            const DeepCollectionEquality()
                .equals(other._shopOrderDetails, _shopOrderDetails) &&
            const DeepCollectionEquality()
                .equals(other.activeShopIndex, activeShopIndex) &&
            const DeepCollectionEquality()
                .equals(other.totalProductPrice, totalProductPrice) &&
            const DeepCollectionEquality().equals(other.discount, discount) &&
            const DeepCollectionEquality()
                .equals(other.totalProductTax, totalProductTax) &&
            const DeepCollectionEquality()
                .equals(other.totalShopTax, totalShopTax) &&
            const DeepCollectionEquality().equals(other.coupon, coupon) &&
            const DeepCollectionEquality()
                .equals(other.deliveryFee, deliveryFee) &&
            const DeepCollectionEquality()
                .equals(other.totalAmount, totalAmount) &&
            const DeepCollectionEquality().equals(other.rating, rating) &&
            const DeepCollectionEquality()
                .equals(other.reviewText, reviewText) &&
            const DeepCollectionEquality()
                .equals(other.orderResponse, orderResponse));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(isLoading),
      const DeepCollectionEquality().hash(isReviewing),
      const DeepCollectionEquality().hash(isCancelable),
      const DeepCollectionEquality().hash(canLeaveFeedback),
      const DeepCollectionEquality().hash(_shopOrderDetails),
      const DeepCollectionEquality().hash(activeShopIndex),
      const DeepCollectionEquality().hash(totalProductPrice),
      const DeepCollectionEquality().hash(discount),
      const DeepCollectionEquality().hash(totalProductTax),
      const DeepCollectionEquality().hash(totalShopTax),
      const DeepCollectionEquality().hash(coupon),
      const DeepCollectionEquality().hash(deliveryFee),
      const DeepCollectionEquality().hash(totalAmount),
      const DeepCollectionEquality().hash(rating),
      const DeepCollectionEquality().hash(reviewText),
      const DeepCollectionEquality().hash(orderResponse));

  @JsonKey(ignore: true)
  @override
  _$$_OrderDetailsStateCopyWith<_$_OrderDetailsState> get copyWith =>
      __$$_OrderDetailsStateCopyWithImpl<_$_OrderDetailsState>(
          this, _$identity);
}

abstract class _OrderDetailsState extends OrderDetailsState {
  const factory _OrderDetailsState(
      {final bool isLoading,
      final bool isReviewing,
      final bool isCancelable,
      final bool canLeaveFeedback,
      final List<ShopOrderDetails> shopOrderDetails,
      final int activeShopIndex,
      final double totalProductPrice,
      final double discount,
      final double totalProductTax,
      final double totalShopTax,
      final double coupon,
      final double deliveryFee,
      final double totalAmount,
      final double rating,
      final String reviewText,
      final SingleOrderResponse? orderResponse}) = _$_OrderDetailsState;
  const _OrderDetailsState._() : super._();

  @override
  bool get isLoading;
  @override
  bool get isReviewing;
  @override
  bool get isCancelable;
  @override
  bool get canLeaveFeedback;
  @override
  List<ShopOrderDetails> get shopOrderDetails;
  @override
  int get activeShopIndex;
  @override
  double get totalProductPrice;
  @override
  double get discount;
  @override
  double get totalProductTax;
  @override
  double get totalShopTax;
  @override
  double get coupon;
  @override
  double get deliveryFee;
  @override
  double get totalAmount;
  @override
  double get rating;
  @override
  String get reviewText;
  @override
  SingleOrderResponse? get orderResponse;
  @override
  @JsonKey(ignore: true)
  _$$_OrderDetailsStateCopyWith<_$_OrderDetailsState> get copyWith =>
      throw _privateConstructorUsedError;
}
