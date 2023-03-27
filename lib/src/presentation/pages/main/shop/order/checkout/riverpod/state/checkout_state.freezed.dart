// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'checkout_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CheckoutState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isCardBinding => throw _privateConstructorUsedError;
  bool get isConfirmLoading => throw _privateConstructorUsedError;
  bool get isResending => throw _privateConstructorUsedError;
  bool get isTimeExpired => throw _privateConstructorUsedError;
  bool get isCodeError => throw _privateConstructorUsedError;
  bool get isInitializing => throw _privateConstructorUsedError;
  bool get isCardListLoading => throw _privateConstructorUsedError;
  bool get isStoreAddressLoading => throw _privateConstructorUsedError;
  bool get isPaymentsLoading => throw _privateConstructorUsedError;
  bool get isShopDeliveriesLoading => throw _privateConstructorUsedError;
  bool get isCreatingOrder => throw _privateConstructorUsedError;
  bool get isContinueEnabled => throw _privateConstructorUsedError;
  bool get isCalculationsLoading => throw _privateConstructorUsedError;
  bool get isCheckingCoupon => throw _privateConstructorUsedError;
  bool get isPaymentValid => throw _privateConstructorUsedError;
  bool get isAddressCreating => throw _privateConstructorUsedError;
  bool get isCheckingCashback => throw _privateConstructorUsedError;
  int get activePage => throw _privateConstructorUsedError;
  int get selectedShopIndex => throw _privateConstructorUsedError;
  int get selectedPaymentIndex => throw _privateConstructorUsedError;
  int get addressIndex => throw _privateConstructorUsedError;
  double get deliveryFee => throw _privateConstructorUsedError;
  double get cashbackAmount => throw _privateConstructorUsedError;
  List<ShopData> get shops => throw _privateConstructorUsedError;
  List<ShippingData> get shippingDataList => throw _privateConstructorUsedError;
  List<PaymentData> get payments => throw _privateConstructorUsedError;
  List<ApplyCouponData> get applyCoupons => throw _privateConstructorUsedError;
  List<CardList> get cardList => throw _privateConstructorUsedError;
  Map<MarkerId, Marker> get markers => throw _privateConstructorUsedError;
  LatLng? get initialLatLng => throw _privateConstructorUsedError;
  String? get comment => throw _privateConstructorUsedError;
  ProductCalculateResponse? get calculateResponse =>
      throw _privateConstructorUsedError;
  BindCardResponse? get bindCard => throw _privateConstructorUsedError;
  TokenResponse? get tokenResponse => throw _privateConstructorUsedError;
  String get confirmCode => throw _privateConstructorUsedError;
  String get timerText => throw _privateConstructorUsedError;
  Razorpay? get razorpay => throw _privateConstructorUsedError;
  PaystackPlugin? get payStack => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CheckoutStateCopyWith<CheckoutState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CheckoutStateCopyWith<$Res> {
  factory $CheckoutStateCopyWith(
          CheckoutState value, $Res Function(CheckoutState) then) =
      _$CheckoutStateCopyWithImpl<$Res>;
  $Res call(
      {bool isLoading,
      bool isCardBinding,
      bool isConfirmLoading,
      bool isResending,
      bool isTimeExpired,
      bool isCodeError,
      bool isInitializing,
      bool isCardListLoading,
      bool isStoreAddressLoading,
      bool isPaymentsLoading,
      bool isShopDeliveriesLoading,
      bool isCreatingOrder,
      bool isContinueEnabled,
      bool isCalculationsLoading,
      bool isCheckingCoupon,
      bool isPaymentValid,
      bool isAddressCreating,
      bool isCheckingCashback,
      int activePage,
      int selectedShopIndex,
      int selectedPaymentIndex,
      int addressIndex,
      double deliveryFee,
      double cashbackAmount,
      List<ShopData> shops,
      List<ShippingData> shippingDataList,
      List<PaymentData> payments,
      List<ApplyCouponData> applyCoupons,
      List<CardList> cardList,
      Map<MarkerId, Marker> markers,
      LatLng? initialLatLng,
      String? comment,
      ProductCalculateResponse? calculateResponse,
      BindCardResponse? bindCard,
      TokenResponse? tokenResponse,
      String confirmCode,
      String timerText,
      Razorpay? razorpay,
      PaystackPlugin? payStack});
}

/// @nodoc
class _$CheckoutStateCopyWithImpl<$Res>
    implements $CheckoutStateCopyWith<$Res> {
  _$CheckoutStateCopyWithImpl(this._value, this._then);

  final CheckoutState _value;
  // ignore: unused_field
  final $Res Function(CheckoutState) _then;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? isCardBinding = freezed,
    Object? isConfirmLoading = freezed,
    Object? isResending = freezed,
    Object? isTimeExpired = freezed,
    Object? isCodeError = freezed,
    Object? isInitializing = freezed,
    Object? isCardListLoading = freezed,
    Object? isStoreAddressLoading = freezed,
    Object? isPaymentsLoading = freezed,
    Object? isShopDeliveriesLoading = freezed,
    Object? isCreatingOrder = freezed,
    Object? isContinueEnabled = freezed,
    Object? isCalculationsLoading = freezed,
    Object? isCheckingCoupon = freezed,
    Object? isPaymentValid = freezed,
    Object? isAddressCreating = freezed,
    Object? isCheckingCashback = freezed,
    Object? activePage = freezed,
    Object? selectedShopIndex = freezed,
    Object? selectedPaymentIndex = freezed,
    Object? addressIndex = freezed,
    Object? deliveryFee = freezed,
    Object? cashbackAmount = freezed,
    Object? shops = freezed,
    Object? shippingDataList = freezed,
    Object? payments = freezed,
    Object? applyCoupons = freezed,
    Object? cardList = freezed,
    Object? markers = freezed,
    Object? initialLatLng = freezed,
    Object? comment = freezed,
    Object? calculateResponse = freezed,
    Object? bindCard = freezed,
    Object? tokenResponse = freezed,
    Object? confirmCode = freezed,
    Object? timerText = freezed,
    Object? razorpay = freezed,
    Object? payStack = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isCardBinding: isCardBinding == freezed
          ? _value.isCardBinding
          : isCardBinding // ignore: cast_nullable_to_non_nullable
              as bool,
      isConfirmLoading: isConfirmLoading == freezed
          ? _value.isConfirmLoading
          : isConfirmLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isResending: isResending == freezed
          ? _value.isResending
          : isResending // ignore: cast_nullable_to_non_nullable
              as bool,
      isTimeExpired: isTimeExpired == freezed
          ? _value.isTimeExpired
          : isTimeExpired // ignore: cast_nullable_to_non_nullable
              as bool,
      isCodeError: isCodeError == freezed
          ? _value.isCodeError
          : isCodeError // ignore: cast_nullable_to_non_nullable
              as bool,
      isInitializing: isInitializing == freezed
          ? _value.isInitializing
          : isInitializing // ignore: cast_nullable_to_non_nullable
              as bool,
      isCardListLoading: isCardListLoading == freezed
          ? _value.isCardListLoading
          : isCardListLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isStoreAddressLoading: isStoreAddressLoading == freezed
          ? _value.isStoreAddressLoading
          : isStoreAddressLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isPaymentsLoading: isPaymentsLoading == freezed
          ? _value.isPaymentsLoading
          : isPaymentsLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isShopDeliveriesLoading: isShopDeliveriesLoading == freezed
          ? _value.isShopDeliveriesLoading
          : isShopDeliveriesLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isCreatingOrder: isCreatingOrder == freezed
          ? _value.isCreatingOrder
          : isCreatingOrder // ignore: cast_nullable_to_non_nullable
              as bool,
      isContinueEnabled: isContinueEnabled == freezed
          ? _value.isContinueEnabled
          : isContinueEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      isCalculationsLoading: isCalculationsLoading == freezed
          ? _value.isCalculationsLoading
          : isCalculationsLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isCheckingCoupon: isCheckingCoupon == freezed
          ? _value.isCheckingCoupon
          : isCheckingCoupon // ignore: cast_nullable_to_non_nullable
              as bool,
      isPaymentValid: isPaymentValid == freezed
          ? _value.isPaymentValid
          : isPaymentValid // ignore: cast_nullable_to_non_nullable
              as bool,
      isAddressCreating: isAddressCreating == freezed
          ? _value.isAddressCreating
          : isAddressCreating // ignore: cast_nullable_to_non_nullable
              as bool,
      isCheckingCashback: isCheckingCashback == freezed
          ? _value.isCheckingCashback
          : isCheckingCashback // ignore: cast_nullable_to_non_nullable
              as bool,
      activePage: activePage == freezed
          ? _value.activePage
          : activePage // ignore: cast_nullable_to_non_nullable
              as int,
      selectedShopIndex: selectedShopIndex == freezed
          ? _value.selectedShopIndex
          : selectedShopIndex // ignore: cast_nullable_to_non_nullable
              as int,
      selectedPaymentIndex: selectedPaymentIndex == freezed
          ? _value.selectedPaymentIndex
          : selectedPaymentIndex // ignore: cast_nullable_to_non_nullable
              as int,
      addressIndex: addressIndex == freezed
          ? _value.addressIndex
          : addressIndex // ignore: cast_nullable_to_non_nullable
              as int,
      deliveryFee: deliveryFee == freezed
          ? _value.deliveryFee
          : deliveryFee // ignore: cast_nullable_to_non_nullable
              as double,
      cashbackAmount: cashbackAmount == freezed
          ? _value.cashbackAmount
          : cashbackAmount // ignore: cast_nullable_to_non_nullable
              as double,
      shops: shops == freezed
          ? _value.shops
          : shops // ignore: cast_nullable_to_non_nullable
              as List<ShopData>,
      shippingDataList: shippingDataList == freezed
          ? _value.shippingDataList
          : shippingDataList // ignore: cast_nullable_to_non_nullable
              as List<ShippingData>,
      payments: payments == freezed
          ? _value.payments
          : payments // ignore: cast_nullable_to_non_nullable
              as List<PaymentData>,
      applyCoupons: applyCoupons == freezed
          ? _value.applyCoupons
          : applyCoupons // ignore: cast_nullable_to_non_nullable
              as List<ApplyCouponData>,
      cardList: cardList == freezed
          ? _value.cardList
          : cardList // ignore: cast_nullable_to_non_nullable
              as List<CardList>,
      markers: markers == freezed
          ? _value.markers
          : markers // ignore: cast_nullable_to_non_nullable
              as Map<MarkerId, Marker>,
      initialLatLng: initialLatLng == freezed
          ? _value.initialLatLng
          : initialLatLng // ignore: cast_nullable_to_non_nullable
              as LatLng?,
      comment: comment == freezed
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String?,
      calculateResponse: calculateResponse == freezed
          ? _value.calculateResponse
          : calculateResponse // ignore: cast_nullable_to_non_nullable
              as ProductCalculateResponse?,
      bindCard: bindCard == freezed
          ? _value.bindCard
          : bindCard // ignore: cast_nullable_to_non_nullable
              as BindCardResponse?,
      tokenResponse: tokenResponse == freezed
          ? _value.tokenResponse
          : tokenResponse // ignore: cast_nullable_to_non_nullable
              as TokenResponse?,
      confirmCode: confirmCode == freezed
          ? _value.confirmCode
          : confirmCode // ignore: cast_nullable_to_non_nullable
              as String,
      timerText: timerText == freezed
          ? _value.timerText
          : timerText // ignore: cast_nullable_to_non_nullable
              as String,
      razorpay: razorpay == freezed
          ? _value.razorpay
          : razorpay // ignore: cast_nullable_to_non_nullable
              as Razorpay?,
      payStack: payStack == freezed
          ? _value.payStack
          : payStack // ignore: cast_nullable_to_non_nullable
              as PaystackPlugin?,
    ));
  }
}

/// @nodoc
abstract class _$$_CheckoutStateCopyWith<$Res>
    implements $CheckoutStateCopyWith<$Res> {
  factory _$$_CheckoutStateCopyWith(
          _$_CheckoutState value, $Res Function(_$_CheckoutState) then) =
      __$$_CheckoutStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool isLoading,
      bool isCardBinding,
      bool isConfirmLoading,
      bool isResending,
      bool isTimeExpired,
      bool isCodeError,
      bool isInitializing,
      bool isCardListLoading,
      bool isStoreAddressLoading,
      bool isPaymentsLoading,
      bool isShopDeliveriesLoading,
      bool isCreatingOrder,
      bool isContinueEnabled,
      bool isCalculationsLoading,
      bool isCheckingCoupon,
      bool isPaymentValid,
      bool isAddressCreating,
      bool isCheckingCashback,
      int activePage,
      int selectedShopIndex,
      int selectedPaymentIndex,
      int addressIndex,
      double deliveryFee,
      double cashbackAmount,
      List<ShopData> shops,
      List<ShippingData> shippingDataList,
      List<PaymentData> payments,
      List<ApplyCouponData> applyCoupons,
      List<CardList> cardList,
      Map<MarkerId, Marker> markers,
      LatLng? initialLatLng,
      String? comment,
      ProductCalculateResponse? calculateResponse,
      BindCardResponse? bindCard,
      TokenResponse? tokenResponse,
      String confirmCode,
      String timerText,
      Razorpay? razorpay,
      PaystackPlugin? payStack});
}

/// @nodoc
class __$$_CheckoutStateCopyWithImpl<$Res>
    extends _$CheckoutStateCopyWithImpl<$Res>
    implements _$$_CheckoutStateCopyWith<$Res> {
  __$$_CheckoutStateCopyWithImpl(
      _$_CheckoutState _value, $Res Function(_$_CheckoutState) _then)
      : super(_value, (v) => _then(v as _$_CheckoutState));

  @override
  _$_CheckoutState get _value => super._value as _$_CheckoutState;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? isCardBinding = freezed,
    Object? isConfirmLoading = freezed,
    Object? isResending = freezed,
    Object? isTimeExpired = freezed,
    Object? isCodeError = freezed,
    Object? isInitializing = freezed,
    Object? isCardListLoading = freezed,
    Object? isStoreAddressLoading = freezed,
    Object? isPaymentsLoading = freezed,
    Object? isShopDeliveriesLoading = freezed,
    Object? isCreatingOrder = freezed,
    Object? isContinueEnabled = freezed,
    Object? isCalculationsLoading = freezed,
    Object? isCheckingCoupon = freezed,
    Object? isPaymentValid = freezed,
    Object? isAddressCreating = freezed,
    Object? isCheckingCashback = freezed,
    Object? activePage = freezed,
    Object? selectedShopIndex = freezed,
    Object? selectedPaymentIndex = freezed,
    Object? addressIndex = freezed,
    Object? deliveryFee = freezed,
    Object? cashbackAmount = freezed,
    Object? shops = freezed,
    Object? shippingDataList = freezed,
    Object? payments = freezed,
    Object? applyCoupons = freezed,
    Object? cardList = freezed,
    Object? markers = freezed,
    Object? initialLatLng = freezed,
    Object? comment = freezed,
    Object? calculateResponse = freezed,
    Object? bindCard = freezed,
    Object? tokenResponse = freezed,
    Object? confirmCode = freezed,
    Object? timerText = freezed,
    Object? razorpay = freezed,
    Object? payStack = freezed,
  }) {
    return _then(_$_CheckoutState(
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isCardBinding: isCardBinding == freezed
          ? _value.isCardBinding
          : isCardBinding // ignore: cast_nullable_to_non_nullable
              as bool,
      isConfirmLoading: isConfirmLoading == freezed
          ? _value.isConfirmLoading
          : isConfirmLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isResending: isResending == freezed
          ? _value.isResending
          : isResending // ignore: cast_nullable_to_non_nullable
              as bool,
      isTimeExpired: isTimeExpired == freezed
          ? _value.isTimeExpired
          : isTimeExpired // ignore: cast_nullable_to_non_nullable
              as bool,
      isCodeError: isCodeError == freezed
          ? _value.isCodeError
          : isCodeError // ignore: cast_nullable_to_non_nullable
              as bool,
      isInitializing: isInitializing == freezed
          ? _value.isInitializing
          : isInitializing // ignore: cast_nullable_to_non_nullable
              as bool,
      isCardListLoading: isCardListLoading == freezed
          ? _value.isCardListLoading
          : isCardListLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isStoreAddressLoading: isStoreAddressLoading == freezed
          ? _value.isStoreAddressLoading
          : isStoreAddressLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isPaymentsLoading: isPaymentsLoading == freezed
          ? _value.isPaymentsLoading
          : isPaymentsLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isShopDeliveriesLoading: isShopDeliveriesLoading == freezed
          ? _value.isShopDeliveriesLoading
          : isShopDeliveriesLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isCreatingOrder: isCreatingOrder == freezed
          ? _value.isCreatingOrder
          : isCreatingOrder // ignore: cast_nullable_to_non_nullable
              as bool,
      isContinueEnabled: isContinueEnabled == freezed
          ? _value.isContinueEnabled
          : isContinueEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      isCalculationsLoading: isCalculationsLoading == freezed
          ? _value.isCalculationsLoading
          : isCalculationsLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isCheckingCoupon: isCheckingCoupon == freezed
          ? _value.isCheckingCoupon
          : isCheckingCoupon // ignore: cast_nullable_to_non_nullable
              as bool,
      isPaymentValid: isPaymentValid == freezed
          ? _value.isPaymentValid
          : isPaymentValid // ignore: cast_nullable_to_non_nullable
              as bool,
      isAddressCreating: isAddressCreating == freezed
          ? _value.isAddressCreating
          : isAddressCreating // ignore: cast_nullable_to_non_nullable
              as bool,
      isCheckingCashback: isCheckingCashback == freezed
          ? _value.isCheckingCashback
          : isCheckingCashback // ignore: cast_nullable_to_non_nullable
              as bool,
      activePage: activePage == freezed
          ? _value.activePage
          : activePage // ignore: cast_nullable_to_non_nullable
              as int,
      selectedShopIndex: selectedShopIndex == freezed
          ? _value.selectedShopIndex
          : selectedShopIndex // ignore: cast_nullable_to_non_nullable
              as int,
      selectedPaymentIndex: selectedPaymentIndex == freezed
          ? _value.selectedPaymentIndex
          : selectedPaymentIndex // ignore: cast_nullable_to_non_nullable
              as int,
      addressIndex: addressIndex == freezed
          ? _value.addressIndex
          : addressIndex // ignore: cast_nullable_to_non_nullable
              as int,
      deliveryFee: deliveryFee == freezed
          ? _value.deliveryFee
          : deliveryFee // ignore: cast_nullable_to_non_nullable
              as double,
      cashbackAmount: cashbackAmount == freezed
          ? _value.cashbackAmount
          : cashbackAmount // ignore: cast_nullable_to_non_nullable
              as double,
      shops: shops == freezed
          ? _value._shops
          : shops // ignore: cast_nullable_to_non_nullable
              as List<ShopData>,
      shippingDataList: shippingDataList == freezed
          ? _value._shippingDataList
          : shippingDataList // ignore: cast_nullable_to_non_nullable
              as List<ShippingData>,
      payments: payments == freezed
          ? _value._payments
          : payments // ignore: cast_nullable_to_non_nullable
              as List<PaymentData>,
      applyCoupons: applyCoupons == freezed
          ? _value._applyCoupons
          : applyCoupons // ignore: cast_nullable_to_non_nullable
              as List<ApplyCouponData>,
      cardList: cardList == freezed
          ? _value._cardList
          : cardList // ignore: cast_nullable_to_non_nullable
              as List<CardList>,
      markers: markers == freezed
          ? _value._markers
          : markers // ignore: cast_nullable_to_non_nullable
              as Map<MarkerId, Marker>,
      initialLatLng: initialLatLng == freezed
          ? _value.initialLatLng
          : initialLatLng // ignore: cast_nullable_to_non_nullable
              as LatLng?,
      comment: comment == freezed
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String?,
      calculateResponse: calculateResponse == freezed
          ? _value.calculateResponse
          : calculateResponse // ignore: cast_nullable_to_non_nullable
              as ProductCalculateResponse?,
      bindCard: bindCard == freezed
          ? _value.bindCard
          : bindCard // ignore: cast_nullable_to_non_nullable
              as BindCardResponse?,
      tokenResponse: tokenResponse == freezed
          ? _value.tokenResponse
          : tokenResponse // ignore: cast_nullable_to_non_nullable
              as TokenResponse?,
      confirmCode: confirmCode == freezed
          ? _value.confirmCode
          : confirmCode // ignore: cast_nullable_to_non_nullable
              as String,
      timerText: timerText == freezed
          ? _value.timerText
          : timerText // ignore: cast_nullable_to_non_nullable
              as String,
      razorpay: razorpay == freezed
          ? _value.razorpay
          : razorpay // ignore: cast_nullable_to_non_nullable
              as Razorpay?,
      payStack: payStack == freezed
          ? _value.payStack
          : payStack // ignore: cast_nullable_to_non_nullable
              as PaystackPlugin?,
    ));
  }
}

/// @nodoc

class _$_CheckoutState extends _CheckoutState {
  const _$_CheckoutState(
      {this.isLoading = false,
      this.isCardBinding = false,
      this.isConfirmLoading = false,
      this.isResending = false,
      this.isTimeExpired = false,
      this.isCodeError = false,
      this.isInitializing = false,
      this.isCardListLoading = false,
      this.isStoreAddressLoading = false,
      this.isPaymentsLoading = false,
      this.isShopDeliveriesLoading = false,
      this.isCreatingOrder = false,
      this.isContinueEnabled = false,
      this.isCalculationsLoading = false,
      this.isCheckingCoupon = false,
      this.isPaymentValid = false,
      this.isAddressCreating = false,
      this.isCheckingCashback = false,
      this.activePage = 0,
      this.selectedShopIndex = 0,
      this.selectedPaymentIndex = 0,
      this.addressIndex = 0,
      this.deliveryFee = 0,
      this.cashbackAmount = 0,
      final List<ShopData> shops = const [],
      final List<ShippingData> shippingDataList = const [],
      final List<PaymentData> payments = const [],
      final List<ApplyCouponData> applyCoupons = const [],
      final List<CardList> cardList = const [],
      final Map<MarkerId, Marker> markers = const {},
      this.initialLatLng,
      this.comment,
      this.calculateResponse,
      this.bindCard,
      this.tokenResponse,
      this.confirmCode = '',
      this.timerText = '',
      this.razorpay,
      this.payStack})
      : _shops = shops,
        _shippingDataList = shippingDataList,
        _payments = payments,
        _applyCoupons = applyCoupons,
        _cardList = cardList,
        _markers = markers,
        super._();

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isCardBinding;
  @override
  @JsonKey()
  final bool isConfirmLoading;
  @override
  @JsonKey()
  final bool isResending;
  @override
  @JsonKey()
  final bool isTimeExpired;
  @override
  @JsonKey()
  final bool isCodeError;
  @override
  @JsonKey()
  final bool isInitializing;
  @override
  @JsonKey()
  final bool isCardListLoading;
  @override
  @JsonKey()
  final bool isStoreAddressLoading;
  @override
  @JsonKey()
  final bool isPaymentsLoading;
  @override
  @JsonKey()
  final bool isShopDeliveriesLoading;
  @override
  @JsonKey()
  final bool isCreatingOrder;
  @override
  @JsonKey()
  final bool isContinueEnabled;
  @override
  @JsonKey()
  final bool isCalculationsLoading;
  @override
  @JsonKey()
  final bool isCheckingCoupon;
  @override
  @JsonKey()
  final bool isPaymentValid;
  @override
  @JsonKey()
  final bool isAddressCreating;
  @override
  @JsonKey()
  final bool isCheckingCashback;
  @override
  @JsonKey()
  final int activePage;
  @override
  @JsonKey()
  final int selectedShopIndex;
  @override
  @JsonKey()
  final int selectedPaymentIndex;
  @override
  @JsonKey()
  final int addressIndex;
  @override
  @JsonKey()
  final double deliveryFee;
  @override
  @JsonKey()
  final double cashbackAmount;
  final List<ShopData> _shops;
  @override
  @JsonKey()
  List<ShopData> get shops {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_shops);
  }

  final List<ShippingData> _shippingDataList;
  @override
  @JsonKey()
  List<ShippingData> get shippingDataList {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_shippingDataList);
  }

  final List<PaymentData> _payments;
  @override
  @JsonKey()
  List<PaymentData> get payments {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_payments);
  }

  final List<ApplyCouponData> _applyCoupons;
  @override
  @JsonKey()
  List<ApplyCouponData> get applyCoupons {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_applyCoupons);
  }

  final List<CardList> _cardList;
  @override
  @JsonKey()
  List<CardList> get cardList {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_cardList);
  }

  final Map<MarkerId, Marker> _markers;
  @override
  @JsonKey()
  Map<MarkerId, Marker> get markers {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_markers);
  }

  @override
  final LatLng? initialLatLng;
  @override
  final String? comment;
  @override
  final ProductCalculateResponse? calculateResponse;
  @override
  final BindCardResponse? bindCard;
  @override
  final TokenResponse? tokenResponse;
  @override
  @JsonKey()
  final String confirmCode;
  @override
  @JsonKey()
  final String timerText;
  @override
  final Razorpay? razorpay;
  @override
  final PaystackPlugin? payStack;

  @override
  String toString() {
    return 'CheckoutState(isLoading: $isLoading, isCardBinding: $isCardBinding, isConfirmLoading: $isConfirmLoading, isResending: $isResending, isTimeExpired: $isTimeExpired, isCodeError: $isCodeError, isInitializing: $isInitializing, isCardListLoading: $isCardListLoading, isStoreAddressLoading: $isStoreAddressLoading, isPaymentsLoading: $isPaymentsLoading, isShopDeliveriesLoading: $isShopDeliveriesLoading, isCreatingOrder: $isCreatingOrder, isContinueEnabled: $isContinueEnabled, isCalculationsLoading: $isCalculationsLoading, isCheckingCoupon: $isCheckingCoupon, isPaymentValid: $isPaymentValid, isAddressCreating: $isAddressCreating, isCheckingCashback: $isCheckingCashback, activePage: $activePage, selectedShopIndex: $selectedShopIndex, selectedPaymentIndex: $selectedPaymentIndex, addressIndex: $addressIndex, deliveryFee: $deliveryFee, cashbackAmount: $cashbackAmount, shops: $shops, shippingDataList: $shippingDataList, payments: $payments, applyCoupons: $applyCoupons, cardList: $cardList, markers: $markers, initialLatLng: $initialLatLng, comment: $comment, calculateResponse: $calculateResponse, bindCard: $bindCard, tokenResponse: $tokenResponse, confirmCode: $confirmCode, timerText: $timerText, razorpay: $razorpay, payStack: $payStack)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CheckoutState &&
            const DeepCollectionEquality().equals(other.isLoading, isLoading) &&
            const DeepCollectionEquality()
                .equals(other.isCardBinding, isCardBinding) &&
            const DeepCollectionEquality()
                .equals(other.isConfirmLoading, isConfirmLoading) &&
            const DeepCollectionEquality()
                .equals(other.isResending, isResending) &&
            const DeepCollectionEquality()
                .equals(other.isTimeExpired, isTimeExpired) &&
            const DeepCollectionEquality()
                .equals(other.isCodeError, isCodeError) &&
            const DeepCollectionEquality()
                .equals(other.isInitializing, isInitializing) &&
            const DeepCollectionEquality()
                .equals(other.isCardListLoading, isCardListLoading) &&
            const DeepCollectionEquality()
                .equals(other.isStoreAddressLoading, isStoreAddressLoading) &&
            const DeepCollectionEquality()
                .equals(other.isPaymentsLoading, isPaymentsLoading) &&
            const DeepCollectionEquality().equals(
                other.isShopDeliveriesLoading, isShopDeliveriesLoading) &&
            const DeepCollectionEquality()
                .equals(other.isCreatingOrder, isCreatingOrder) &&
            const DeepCollectionEquality()
                .equals(other.isContinueEnabled, isContinueEnabled) &&
            const DeepCollectionEquality()
                .equals(other.isCalculationsLoading, isCalculationsLoading) &&
            const DeepCollectionEquality()
                .equals(other.isCheckingCoupon, isCheckingCoupon) &&
            const DeepCollectionEquality()
                .equals(other.isPaymentValid, isPaymentValid) &&
            const DeepCollectionEquality()
                .equals(other.isAddressCreating, isAddressCreating) &&
            const DeepCollectionEquality()
                .equals(other.isCheckingCashback, isCheckingCashback) &&
            const DeepCollectionEquality()
                .equals(other.activePage, activePage) &&
            const DeepCollectionEquality()
                .equals(other.selectedShopIndex, selectedShopIndex) &&
            const DeepCollectionEquality()
                .equals(other.selectedPaymentIndex, selectedPaymentIndex) &&
            const DeepCollectionEquality()
                .equals(other.addressIndex, addressIndex) &&
            const DeepCollectionEquality()
                .equals(other.deliveryFee, deliveryFee) &&
            const DeepCollectionEquality()
                .equals(other.cashbackAmount, cashbackAmount) &&
            const DeepCollectionEquality().equals(other._shops, _shops) &&
            const DeepCollectionEquality()
                .equals(other._shippingDataList, _shippingDataList) &&
            const DeepCollectionEquality().equals(other._payments, _payments) &&
            const DeepCollectionEquality()
                .equals(other._applyCoupons, _applyCoupons) &&
            const DeepCollectionEquality().equals(other._cardList, _cardList) &&
            const DeepCollectionEquality().equals(other._markers, _markers) &&
            const DeepCollectionEquality()
                .equals(other.initialLatLng, initialLatLng) &&
            const DeepCollectionEquality().equals(other.comment, comment) &&
            const DeepCollectionEquality()
                .equals(other.calculateResponse, calculateResponse) &&
            const DeepCollectionEquality().equals(other.bindCard, bindCard) &&
            const DeepCollectionEquality()
                .equals(other.tokenResponse, tokenResponse) &&
            const DeepCollectionEquality()
                .equals(other.confirmCode, confirmCode) &&
            const DeepCollectionEquality().equals(other.timerText, timerText) &&
            const DeepCollectionEquality().equals(other.razorpay, razorpay) &&
            const DeepCollectionEquality().equals(other.payStack, payStack));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        const DeepCollectionEquality().hash(isLoading),
        const DeepCollectionEquality().hash(isCardBinding),
        const DeepCollectionEquality().hash(isConfirmLoading),
        const DeepCollectionEquality().hash(isResending),
        const DeepCollectionEquality().hash(isTimeExpired),
        const DeepCollectionEquality().hash(isCodeError),
        const DeepCollectionEquality().hash(isInitializing),
        const DeepCollectionEquality().hash(isCardListLoading),
        const DeepCollectionEquality().hash(isStoreAddressLoading),
        const DeepCollectionEquality().hash(isPaymentsLoading),
        const DeepCollectionEquality().hash(isShopDeliveriesLoading),
        const DeepCollectionEquality().hash(isCreatingOrder),
        const DeepCollectionEquality().hash(isContinueEnabled),
        const DeepCollectionEquality().hash(isCalculationsLoading),
        const DeepCollectionEquality().hash(isCheckingCoupon),
        const DeepCollectionEquality().hash(isPaymentValid),
        const DeepCollectionEquality().hash(isAddressCreating),
        const DeepCollectionEquality().hash(isCheckingCashback),
        const DeepCollectionEquality().hash(activePage),
        const DeepCollectionEquality().hash(selectedShopIndex),
        const DeepCollectionEquality().hash(selectedPaymentIndex),
        const DeepCollectionEquality().hash(addressIndex),
        const DeepCollectionEquality().hash(deliveryFee),
        const DeepCollectionEquality().hash(cashbackAmount),
        const DeepCollectionEquality().hash(_shops),
        const DeepCollectionEquality().hash(_shippingDataList),
        const DeepCollectionEquality().hash(_payments),
        const DeepCollectionEquality().hash(_applyCoupons),
        const DeepCollectionEquality().hash(_cardList),
        const DeepCollectionEquality().hash(_markers),
        const DeepCollectionEquality().hash(initialLatLng),
        const DeepCollectionEquality().hash(comment),
        const DeepCollectionEquality().hash(calculateResponse),
        const DeepCollectionEquality().hash(bindCard),
        const DeepCollectionEquality().hash(tokenResponse),
        const DeepCollectionEquality().hash(confirmCode),
        const DeepCollectionEquality().hash(timerText),
        const DeepCollectionEquality().hash(razorpay),
        const DeepCollectionEquality().hash(payStack)
      ]);

  @JsonKey(ignore: true)
  @override
  _$$_CheckoutStateCopyWith<_$_CheckoutState> get copyWith =>
      __$$_CheckoutStateCopyWithImpl<_$_CheckoutState>(this, _$identity);
}

abstract class _CheckoutState extends CheckoutState {
  const factory _CheckoutState(
      {final bool isLoading,
      final bool isCardBinding,
      final bool isConfirmLoading,
      final bool isResending,
      final bool isTimeExpired,
      final bool isCodeError,
      final bool isInitializing,
      final bool isCardListLoading,
      final bool isStoreAddressLoading,
      final bool isPaymentsLoading,
      final bool isShopDeliveriesLoading,
      final bool isCreatingOrder,
      final bool isContinueEnabled,
      final bool isCalculationsLoading,
      final bool isCheckingCoupon,
      final bool isPaymentValid,
      final bool isAddressCreating,
      final bool isCheckingCashback,
      final int activePage,
      final int selectedShopIndex,
      final int selectedPaymentIndex,
      final int addressIndex,
      final double deliveryFee,
      final double cashbackAmount,
      final List<ShopData> shops,
      final List<ShippingData> shippingDataList,
      final List<PaymentData> payments,
      final List<ApplyCouponData> applyCoupons,
      final List<CardList> cardList,
      final Map<MarkerId, Marker> markers,
      final LatLng? initialLatLng,
      final String? comment,
      final ProductCalculateResponse? calculateResponse,
      final BindCardResponse? bindCard,
      final TokenResponse? tokenResponse,
      final String confirmCode,
      final String timerText,
      final Razorpay? razorpay,
      final PaystackPlugin? payStack}) = _$_CheckoutState;
  const _CheckoutState._() : super._();

  @override
  bool get isLoading;
  @override
  bool get isCardBinding;
  @override
  bool get isConfirmLoading;
  @override
  bool get isResending;
  @override
  bool get isTimeExpired;
  @override
  bool get isCodeError;
  @override
  bool get isInitializing;
  @override
  bool get isCardListLoading;
  @override
  bool get isStoreAddressLoading;
  @override
  bool get isPaymentsLoading;
  @override
  bool get isShopDeliveriesLoading;
  @override
  bool get isCreatingOrder;
  @override
  bool get isContinueEnabled;
  @override
  bool get isCalculationsLoading;
  @override
  bool get isCheckingCoupon;
  @override
  bool get isPaymentValid;
  @override
  bool get isAddressCreating;
  @override
  bool get isCheckingCashback;
  @override
  int get activePage;
  @override
  int get selectedShopIndex;
  @override
  int get selectedPaymentIndex;
  @override
  int get addressIndex;
  @override
  double get deliveryFee;
  @override
  double get cashbackAmount;
  @override
  List<ShopData> get shops;
  @override
  List<ShippingData> get shippingDataList;
  @override
  List<PaymentData> get payments;
  @override
  List<ApplyCouponData> get applyCoupons;
  @override
  List<CardList> get cardList;
  @override
  Map<MarkerId, Marker> get markers;
  @override
  LatLng? get initialLatLng;
  @override
  String? get comment;
  @override
  ProductCalculateResponse? get calculateResponse;
  @override
  BindCardResponse? get bindCard;
  @override
  TokenResponse? get tokenResponse;
  @override
  String get confirmCode;
  @override
  String get timerText;
  @override
  Razorpay? get razorpay;
  @override
  PaystackPlugin? get payStack;
  @override
  @JsonKey(ignore: true)
  _$$_CheckoutStateCopyWith<_$_CheckoutState> get copyWith =>
      throw _privateConstructorUsedError;
}
