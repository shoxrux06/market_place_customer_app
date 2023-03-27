import 'dart:ffi';

import 'package:flutter_paystack/flutter_paystack.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:g_customer/src/models/response/bind_card_response.dart';
import 'package:g_customer/src/models/response/card_list_response.dart';
import 'package:g_customer/src/models/response/token_response.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

import '../../../../../../../../models/models.dart';

part 'checkout_state.freezed.dart';

@freezed
class CheckoutState with _$CheckoutState {
  const factory CheckoutState({
    @Default(false) bool isLoading,
    @Default(false) bool isCardBinding,
    @Default(false) bool isConfirmLoading,
    @Default(false) bool isResending,
    @Default(false) bool isTimeExpired,
    @Default(false) bool isCodeError,
    @Default(false) bool isInitializing,
    @Default(false) bool isCardListLoading,
    @Default(false) bool isStoreAddressLoading,
    @Default(false) bool isPaymentsLoading,
    @Default(false) bool isShopDeliveriesLoading,
    @Default(false) bool isCreatingOrder,
    @Default(false) bool isContinueEnabled,
    @Default(false) bool isCalculationsLoading,
    @Default(false) bool isCheckingCoupon,
    @Default(false) bool isPaymentValid,
    @Default(false) bool isAddressCreating,
    @Default(false) bool isCheckingCashback,
    @Default(0) int activePage,
    @Default(0) int selectedShopIndex,
    @Default(0) int selectedPaymentIndex,
    @Default(0) int addressIndex,
    @Default(0) double deliveryFee,
    @Default(0) double cashbackAmount,
    @Default([]) List<ShopData> shops,
    @Default([]) List<ShippingData> shippingDataList,
    @Default([]) List<PaymentData> payments,
    @Default([]) List<ApplyCouponData> applyCoupons,
    @Default([]) List<CardList> cardList,
    @Default({}) Map<MarkerId, Marker> markers,
    LatLng? initialLatLng,
    String? comment,
    ProductCalculateResponse? calculateResponse,
    BindCardResponse? bindCard,
    TokenResponse? tokenResponse,
    @Default('') String confirmCode,
    @Default('') String timerText,

    Razorpay? razorpay,
    PaystackPlugin? payStack,
  }) = _CheckoutState;

  const CheckoutState._();
}
