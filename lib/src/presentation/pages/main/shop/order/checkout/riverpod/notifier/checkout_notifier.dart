import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_braintree/flutter_braintree.dart';
import 'package:flutter_paystack/flutter_paystack.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:razorpay_flutter/razorpay_flutter.dart';

import '../../../../../../../../core/constants/.env.dart';
import '../../../../../../../../core/constants/constants.dart';
import '../../../../../../../../core/handlers/handlers.dart';
import '../../../../../../../../core/routes/app_router.gr.dart';
import '../../../../../../../../core/utils/utils.dart';
import '../../../../../../../../models/models.dart';
import '../../../../../../../../repository/repository.dart';
import '../../../riverpod/notifier/order_notifier.dart';
import '../../../riverpod/state/order_state.dart';
import '../state/checkout_state.dart';

class CheckoutNotifier extends StateNotifier<CheckoutState> {
  final PaymentsRepository _paymentsRepository;
  final ShopsRepository _shopsRepository;
  final OrdersRepository _ordersRepository;
  final UserRepository _userRepository;
  final AddressRepository _addressRepository;

  CheckoutNotifier(
    this._paymentsRepository,
    this._shopsRepository,
    this._ordersRepository,
    this._userRepository,
    this._addressRepository,
  ) : super(
          CheckoutState(
            razorpay: Razorpay(),
            payStack: PaystackPlugin()
              ..initialize(publicKey: payStackPublicKey),
          ),
        );

  void setActivePage(int index) {
    state = state.copyWith(activePage: index);
  }

  void setSelectedShopIndex(int index) {
    state = state.copyWith(selectedShopIndex: index);
  }

  Future<void> fetchShops(BuildContext context, List<ShopData> shops) async {
    final connected = await AppConnectivity.connectivity();
    if (connected) {
      state = state.copyWith(isLoading: true);
      final List<SettingsData> settings =
          LocalStorage.instance.getSettingsList();
      bool isDelivery = false;
      for (final setting in settings) {
        if (setting.key == 'delivery') {
          isDelivery = setting.value == '0';
          break;
        }
      }
      if (isDelivery) {
        final response = await _shopsRepository.getOnlyDeliveries();
        response.when(
          success: (data) async {
            final List<CartProductData> cartProducts =
                LocalStorage.instance.getCartProducts();
            List<int> shopIds = [];
            for (final product in cartProducts) {
              shopIds.add(product.selectedStock?.product?.shopId ?? 0);
            }
            shopIds = shopIds.toSet().toList();
            List<ShopData> filtered = [];
            for (final shop in shops) {
              for (final shopId in shopIds) {
                if (shop.id == shopId) {
                  filtered.add(shop);
                  break;
                }
              }
            }
            state = state.copyWith(shops: filtered, isLoading: false);
            setInitialShippingDeliveries(isDelivery, onlyDeliveries: data.data);
            fetchPayments(context);
            fetchProfileDetails(context);
          },
          failure: (failure) {
            state = state.copyWith(isLoading: false);
            if (failure == const NetworkExceptions.noInternetConnection()) {
              AppHelpers.showCheckFlash(
                context,
                AppHelpers.getTranslation(TrKeys.checkYourNetworkConnection),
              );
            }
            debugPrint('==> get all shops failure: $failure');
          },
        );
      } else {
        final List<CartProductData> cartProducts =
            LocalStorage.instance.getCartProducts();
        List<int> shopIds = [];
        for (final product in cartProducts) {
          shopIds.add(product.selectedStock?.product?.shopId ?? 0);
        }
        shopIds = shopIds.toSet().toList();
        final response = await _shopsRepository.getShopsDeliveries(shopIds);
        response.when(
          success: (data) async {
            state = state.copyWith(shops: data.data ?? [], isLoading: false);
            setInitialShippingDeliveries(isDelivery);
            fetchPayments(context);
            fetchProfileDetails(context);
          },
          failure: (failure) {
            state = state.copyWith(isLoading: false);
            debugPrint('==> get shop deliveries failure: $failure');
          },
        );
      }
    } else {
      if (mounted) {
        AppHelpers.showCheckFlash(
          context,
          AppHelpers.getTranslation(TrKeys.checkYourNetworkConnection),
        );
      }
    }
  }

  void setInitialShippingDeliveries(
    bool isDelivery, {
    List<ShopDelivery>? onlyDeliveries,
  }) {
    List<ShippingData> shippingDataList = [];
    for (final shop in state.shops) {
      ShippingDeliveryVisibilityType visibilityType =
          ShippingDeliveryVisibilityType.cantOrder;
      DeliveryTypeEnum? activeDelivery;
      List<ShopDelivery> shopDeliveries = [];
      final List<ShopDelivery> deliveries =
          isDelivery ? (onlyDeliveries ?? []) : (shop.deliveries ?? []);
      int pickupIndex = 0;
      if (deliveries.isNotEmpty) {
        bool hasPickup = false;
        for (int i = 0; i < deliveries.length; i++) {
          if (deliveries[i].type == 'pickup') {
            hasPickup = true;
            pickupIndex = i;
          } else {
            shopDeliveries.add(deliveries[i]);
          }
        }
        if (hasPickup) {
          if (deliveries.length > 1) {
            visibilityType = ShippingDeliveryVisibilityType.both;
            activeDelivery = DeliveryTypeEnum.delivery;
          } else {
            visibilityType = ShippingDeliveryVisibilityType.onlyPickup;
            activeDelivery = DeliveryTypeEnum.pickup;
          }
        } else {
          visibilityType = ShippingDeliveryVisibilityType.onlyDelivery;
          activeDelivery = DeliveryTypeEnum.delivery;
        }
        final bool hasDeliveries =
            visibilityType == ShippingDeliveryVisibilityType.onlyDelivery ||
                visibilityType == ShippingDeliveryVisibilityType.both;
        shippingDataList.add(
          ShippingData(
            shopId: shop.id ?? 0,
            openTime: shop.openTime ?? '',
            closeTime: shop.closeTime ?? '',
            visibilityType: visibilityType,
            activeDelivery: activeDelivery,
            shopDeliveries: hasDeliveries ? shopDeliveries : null,
            deliveryData: hasDeliveries
                ? DeliveryData(shopDelivery: shopDeliveries[0])
                : null,
            pickupData: PickupData(
              pickupIndex: pickupIndex,
              deliveryData: deliveries[pickupIndex],
            ),
          ),
        );
      } else {
        shippingDataList.add(
          ShippingData(
            shopId: shop.id ?? 0,
            openTime: shop.openTime ?? '',
            closeTime: shop.closeTime ?? '',
            visibilityType: ShippingDeliveryVisibilityType.cantOrder,
          ),
        );
      }
    }
    final List<LocalAddressData> addresses =
        LocalStorage.instance.getLocalAddressesList();
    int addressIndex = 0;
    for (int i = 0; i < addresses.length; i++) {
      if (addresses[i].isDefault ?? false) {
        addressIndex = i;
        break;
      }
    }
    state = state.copyWith(
      shippingDataList: shippingDataList,
      addressIndex: addressIndex,
    );
  }

  void updateCoupons(BuildContext context) {
    double fee = 0;
    for (final shipping in state.shippingDataList) {
      if (shipping.activeDelivery == DeliveryTypeEnum.delivery) {
        fee += shipping.deliveryData?.shopDelivery?.price ?? 0;
      }
    }
    final address =
        LocalStorage.instance.getLocalAddressesList()[state.addressIndex];
    if (address.id == null) {
      createAddress(context, address);
    }
    state = state.copyWith(
      deliveryFee: fee,
      applyCoupons: state.shops
          .map(
            (shop) => ApplyCouponData(
              shopId: shop.id ?? 0,
              coupon: '',
              isApplied: false,
              isError: false,
            ),
          )
          .toList(),
    );
  }

  void changeDeliveryType(DeliveryTypeEnum deliveryType) {
    final ShippingData shippingData =
        state.shippingDataList[state.selectedShopIndex];
    final List<ShippingData> newList = List.from(state.shippingDataList);
    newList[state.selectedShopIndex] =
        shippingData.copyWith(activeDelivery: deliveryType);
    state = state.copyWith(shippingDataList: newList);
    checkContinueEnabled();
  }

  void checkContinueEnabled() {
    bool isContinueEnabled = true;
    for (final shippingData in state.shippingDataList) {
      if (shippingData.activeDelivery == DeliveryTypeEnum.pickup) {
        if (shippingData.pickupData?.pickupDate == null) {
          isContinueEnabled = false;
          break;
        }
      } else {
        if (shippingData.deliveryData?.deliveryDate == null ||
            shippingData.deliveryData?.deliveryTime == null) {
          isContinueEnabled = false;
          break;
        }
      }
    }
    state = state.copyWith(isContinueEnabled: isContinueEnabled);
  }

  void checkPaymentValid(double totalAmount) {
    bool isPaymentValid = true;
    final num wallet = LocalStorage.instance.getWalletData()?.price ?? 0;
    final payment = state.payments[state.selectedPaymentIndex];
    if (payment.tag == 'wallet') {
      if (wallet < totalAmount) {
        isPaymentValid = false;
      }
    }
    state = state.copyWith(isPaymentValid: isPaymentValid);
  }

  void changeAddress(int index) {
    state = state.copyWith(addressIndex: index);
  }

  void setDeliveryDate(DateTime date) {
    final shippingData = state.shippingDataList[state.selectedShopIndex];
    final String formattedDate = DateFormat('yyyy-MM-dd').format(date);
    final newDeliveryData =
        shippingData.deliveryData?.copyWith(deliveryDate: formattedDate);
    final newShippingData =
        shippingData.copyWith(deliveryData: newDeliveryData);
    final List<ShippingData> newList = List.from(state.shippingDataList);
    newList[state.selectedShopIndex] = newShippingData;
    state = state.copyWith(shippingDataList: newList);
    checkContinueEnabled();
  }

  void setDeliveryTime(DateTime date) {
    final shippingData = state.shippingDataList[state.selectedShopIndex];
    final String formattedTime = DateFormat.Hm().format(date);
    final newDeliveryData =
        shippingData.deliveryData?.copyWith(deliveryTime: formattedTime);
    final newShippingData =
        shippingData.copyWith(deliveryData: newDeliveryData);
    final List<ShippingData> newList = List.from(state.shippingDataList);
    newList[state.selectedShopIndex] = newShippingData;
    state = state.copyWith(shippingDataList: newList);
    checkContinueEnabled();
  }

  void setPickupDate(DateTime date) {
    final shippingData = state.shippingDataList[state.selectedShopIndex];
    final String formattedDate = DateFormat('yyyy-MM-dd').format(date);
    final newPickupData =
        shippingData.pickupData?.copyWith(pickupDate: formattedDate);
    final newShippingData = shippingData.copyWith(pickupData: newPickupData);
    final List<ShippingData> newList = List.from(state.shippingDataList);
    newList[state.selectedShopIndex] = newShippingData;
    state = state.copyWith(shippingDataList: newList);
    checkContinueEnabled();
  }

  Future<void> getMarkers(LatLng latLng) async {
    state = state.copyWith(
      isStoreAddressLoading: true,
      initialLatLng: null,
      markers: {},
    );
    final customIcon = await BitmapDescriptor.fromAssetImage(
      ImageConfiguration(size: Size(38.4.r, 60.r)),
      AppAssets.pngIcStorePin,
    );
    const MarkerId markerId = MarkerId('storeMarkerId');
    final Marker marker = Marker(
      markerId: markerId,
      position: latLng,
      draggable: false,
      icon: customIcon,
    );
    final Map<MarkerId, Marker> markerData = {};
    markerData[markerId] = marker;
    state = state.copyWith(
      markers: markerData,
      initialLatLng: latLng,
      isStoreAddressLoading: false,
    );
  }

  Future<void> fetchPayments(BuildContext context) async {
    final connected = await AppConnectivity.connectivity();
    if (connected) {
      state = state.copyWith(isPaymentsLoading: true);
      final response = await _paymentsRepository.getPayments();
      response.when(
        success: (data) {
          state = state.copyWith(
            payments: data.data ?? [],
            isPaymentsLoading: false,
          );
        },
        failure: (failure) {
          state = state.copyWith(isPaymentsLoading: false);
          debugPrint('==> get payments failure: $failure');
        },
      );
    } else {
      if (mounted) {
        AppHelpers.showCheckFlash(
          context,
          AppHelpers.getTranslation(TrKeys.checkYourNetworkConnection),
        );
      }
    }
  }

  Future<void> fetchProfileDetails(BuildContext context) async {
    final connected = await AppConnectivity.connectivity();
    if (connected) {
      state = state.copyWith(isPaymentsLoading: true);
      final response = await _userRepository.getProfileDetails();
      response.when(
        success: (data) {
          state = state.copyWith(isPaymentsLoading: false);
          LocalStorage.instance.setWalletData(data.data?.wallet);
        },
        failure: (failure) {
          state = state.copyWith(isPaymentsLoading: false);
          if (failure == const NetworkExceptions.unauthorisedRequest()) {
            LocalStorage.instance.deleteToken();
            AppHelpers.showCheckFlash(
              context,
              AppHelpers.getTranslation(TrKeys.youNeedToLoginFirst),
            );
            context.router.pushAndPopUntil(
              const LoginRoute(),
              predicate: (route) => false,
            );
          }
          debugPrint('==> get profile details failure: $failure');
        },
      );
    } else {
      if (mounted) {
        AppHelpers.showCheckFlash(
          context,
          AppHelpers.getTranslation(TrKeys.checkYourNetworkConnection),
        );
      }
    }
  }

  void setSelectedPaymentIndex(int index) {
    state = state.copyWith(selectedPaymentIndex: index);
  }

  void changeDelivery(int index) {
    final shippingData = state.shippingDataList[state.selectedShopIndex];
    final newDeliveryData = shippingData.deliveryData?.copyWith(
      shopDelivery: state
          .shippingDataList[state.selectedShopIndex].shopDeliveries?[index],
    );
    final newShippingData =
        shippingData.copyWith(deliveryData: newDeliveryData);
    final List<ShippingData> newList = List.from(state.shippingDataList);
    newList[state.selectedShopIndex] = newShippingData;
    state = state.copyWith(shippingDataList: newList);
  }

  Future<void> makeAnOrder(
    BuildContext context,
    OrderState orderState,
    OrderNotifier orderNotifier,
  ) async {
    // createPaypalPayment(
    //   context,
    //   (orderState.calculateResponse?.data?.orderTotal ?? 0) + state.deliveryFee,
    // );
    // await makeStripePayment(
    //     context,
    //     (orderState.calculateResponse?.data?.orderTotal ?? 0) +
    //         state.deliveryFee,
    //     1);
    // await makeRazorpayPayment(
    //   (orderState.calculateResponse?.data?.orderTotal ?? 0) + state.deliveryFee,
    // );
    // await makePayStackPayment(
    //   context,
    //   (orderState.calculateResponse?.data?.orderTotal ?? 0) + state.deliveryFee,
    // );
    // return;
    final connected = await AppConnectivity.connectivity();
    if (connected) {
      state = state.copyWith(isCreatingOrder: true);
      final List<ShopTotalData> shopTotals = orderState.shopTotals;
      final List<ShippingData> shippingList = state.shippingDataList;
      List<ShopOrder> shopsOrder = [];
      for (final shopTotal in shopTotals) {
        List<ProductOrder> products = [];
        for (final product in shopTotal.cartProducts) {
          final bool hasDiscount = product.selectedStock?.discount != null &&
              (product.selectedStock?.discount ?? 0) > 0;
          final productsPrice = (hasDiscount
                  ? ((product.selectedStock?.price ?? 0) -
                      (product.selectedStock?.discount ?? 0))
                  : product.selectedStock?.price ?? 0) *
              (product.quantity ?? 1);
          final productTax =
              (product.selectedStock?.tax ?? 0) * (product.quantity ?? 1);
          products.add(
            ProductOrder(
              stockId: product.selectedStock?.id ?? 0,
              price: product.selectedStock?.price ?? 0,
              quantity: product.quantity ?? 0,
              tax: productTax,
              discount: (product.selectedStock?.discount ?? 0) *
                  (product.quantity ?? 1),
              totalPrice: productsPrice + productTax,
            ),
          );
        }
        int? deliveryId;
        int? deliveryAddressId;
        num? deliveryFee;
        String? deliveryDate;
        String? deliveryTime;
        for (final shipping in shippingList) {
          if (shipping.shopId == shopTotal.shopData.id) {
            deliveryId = shipping.activeDelivery == DeliveryTypeEnum.delivery
                ? shipping.deliveryData?.shopDelivery?.id
                : shipping.pickupData?.deliveryData?.id;
            deliveryFee = shipping.activeDelivery == DeliveryTypeEnum.delivery
                ? shipping.deliveryData?.shopDelivery?.price
                : 0;
            deliveryId = shipping.activeDelivery == DeliveryTypeEnum.delivery
                ? shipping.deliveryData?.shopDelivery?.id
                : shipping.pickupData?.deliveryData?.id;
            deliveryAddressId =
                shipping.activeDelivery == DeliveryTypeEnum.delivery
                    ? LocalStorage.instance
                        .getLocalAddressesList()[state.addressIndex]
                        .id
                    : null;
            deliveryDate = shipping.activeDelivery == DeliveryTypeEnum.delivery
                ? shipping.deliveryData?.deliveryDate
                : shipping.pickupData?.pickupDate;
            deliveryTime = shipping.activeDelivery == DeliveryTypeEnum.delivery
                ? shipping.deliveryData?.deliveryTime
                : null;
            break;
          }
        }
        shopsOrder.add(
          ShopOrder(
            shopId: shopTotal.shopData.id ?? 0,
            deliveryFee: deliveryFee,
            deliveryTypeId: deliveryId,
            deliveryAddressId: deliveryAddressId,
            tax: shopTotal.onlyShopTax,
            products: products,
            deliveryDate: deliveryDate,
            deliveryTime: deliveryTime,
            coupon: state.applyCoupons
                .firstWhere(
                    (element) => element.shopId == shopTotal.shopData.id)
                .coupon,
          ),
        );
      }
      final orderBody = OrderBodyData(
        userId: LocalStorage.instance.getUser()?.user?.id ?? 0,
        total: (orderState.calculateResponse?.data?.orderTotal ?? 0) +
            state.deliveryFee,
        currencyId: LocalStorage.instance.getSelectedCurrency().id ?? 0,
        currencyRate: LocalStorage.instance.getSelectedCurrency().rate ?? 0,
        note: state.comment,
        shops: shopsOrder,
      );
      checkData(orderBody);
      // return;
      final response = await _ordersRepository.createOrder(orderBody);
      response.when(
        success: (data) async {
          switch (state.payments[state.selectedPaymentIndex].tag) {
            case 'paypal':
              await createPaypalPayment(
                context,
                (orderState.calculateResponse?.data?.orderTotal ?? 0) +
                    state.deliveryFee,
                data.data?.id,
              );
              break;
            case 'cash':
              await createTransaction(context, data.data?.id);
              break;
            case 'wallet':
              await createTransaction(context, data.data?.id);
              break;
            case 'stripe':
              await makeStripePayment(
                context,
                (orderState.calculateResponse?.data?.orderTotal ?? 0) +
                    state.deliveryFee,
                data.data?.id,
              );
              break;
          }
        },
        failure: (failure) {
          state = state.copyWith(isCreatingOrder: false);
          if (failure == const NetworkExceptions.internalServerError()) {
            AppHelpers.showCheckFlash(
              context,
              AppHelpers.getTranslation(TrKeys.somethingWentWrongWithTheServer),
            );
          } else if (failure == const NetworkExceptions.unauthorisedRequest()) {
            LocalStorage.instance.deleteToken();
            AppHelpers.showCheckFlash(
              context,
              AppHelpers.getTranslation(TrKeys.youNeedToLoginFirst),
            );
            context.router.pushAndPopUntil(
              const LoginRoute(),
              predicate: (route) => false,
            );
          } else if (failure == const NetworkExceptions.badRequest()) {
            AppHelpers.showCheckFlash(
              context,
              'Bad request!',
            );
          }
          debugPrint('==> create order failure: $failure');
        },
      );
    } else {
      if (mounted) {
        AppHelpers.showCheckFlash(
          context,
          AppHelpers.getTranslation(TrKeys.checkYourNetworkConnection),
        );
      }
    }
  }

  Future<void> createTransaction(BuildContext context, int? orderId) async {
    final connected = await AppConnectivity.connectivity();
    if (connected) {
      final transactionResponse = await _paymentsRepository.createTransaction(
        orderId: orderId ?? 0,
        paymentId: state.payments[state.selectedPaymentIndex].id ?? 0,
      );
      transactionResponse.when(
        success: (transactionData) {
          state = state.copyWith(isCreatingOrder: false);
          LocalStorage.instance.deleteCartProducts();
          context.pushRoute(const OrderHistoryRoute());
        },
        failure: (transactionFailure) {
          state = state.copyWith(isCreatingOrder: false);
          LocalStorage.instance.deleteCartProducts();
          context.pushRoute(const OrderHistoryRoute());
          AppHelpers.showCheckFlash(
            context,
            'Error with creating transaction!',
          );
        },
      );
    } else {
      if (mounted) {
        AppHelpers.showCheckFlash(
          context,
          AppHelpers.getTranslation(TrKeys.checkYourNetworkConnection),
        );
      }
    }
  }

  Future<void> getToken(BuildContext context) async {
    final connected = await AppConnectivity.connectivity();
    if (connected) {
      final bindCardResponse = await _paymentsRepository.getToken();
      bindCardResponse.when(
        success: (token) {
          state = state.copyWith(tokenResponse: token);
          LocalStorage.instance.setCardToken(token.accessToken);
          print('getToken <<$token>>');
        },
        failure: (bindCardFailure) {
          AppHelpers.showCheckFlash(
            context,
            'Error with getToken!',
          );
        },
      );
    } else {
      if (mounted) {
        AppHelpers.showCheckFlash(
          context,
          AppHelpers.getTranslation(TrKeys.checkYourNetworkConnection),
        );
      }
    }
  }


  Future<void> bindCard(BuildContext context, String cardNumber,String expiry) async {
    final connected = await AppConnectivity.connectivity();
    if (connected) {
      state = state.copyWith(isCardBinding: true);
      final bindCardResponse = await _paymentsRepository.bindCard(
        cardNumber: cardNumber,
        expiry: expiry,
      );
      bindCardResponse.when(
        success: (bindCard) {
          print('bindCard**$bindCard**');
          state = state.copyWith(isCardBinding: false, bindCard: bindCard);
          context.pushRoute(const CardConfirmationRoute());
        },
        failure: (bindCardFailure) {
          state = state.copyWith(isCardBinding: false);
          // context.pushRoute(const OrderHistoryRoute());
          AppHelpers.showCheckFlash(
            context,
            'Error with bindCard!',
          );
        },
      );
    } else {
      if (mounted) {
        AppHelpers.showCheckFlash(
          context,
          AppHelpers.getTranslation(TrKeys.checkYourNetworkConnection),
        );
      }
    }
  }

  void setCode(String? code) {
    state = state.copyWith(confirmCode: code?.trim() ?? '', isCodeError: false);
  }

  Future<void> bindCardApply(BuildContext context, String transactionId,String otp) async {
    final connected = await AppConnectivity.connectivity();
    if (connected) {
      state = state.copyWith(isConfirmLoading: true);
      final bindCardApplyResponse = await _paymentsRepository.bindCardApply(
        transactionId: transactionId,
        otp: otp,
      );
      bindCardApplyResponse.when(
        success: (bindCardApply) {
          print('bindCardApply**$bindCardApply**');
          state = state.copyWith(isConfirmLoading: false, confirmCode: state.confirmCode);
          context.replaceRoute(const AddCardSuccessRoute());
        },
        failure: (bindCardFailure) {
          state = state.copyWith(isConfirmLoading: false);
          AppHelpers.showCheckFlash(
            context,
            'Error with bindCard Apply!',
          );
        },
      );
    } else {
      if (mounted) {
        AppHelpers.showCheckFlash(
          context,
          AppHelpers.getTranslation(TrKeys.checkYourNetworkConnection),
        );
      }
    }
  }

  Future<void> getCardList(BuildContext context, int page,int pageSize) async {
    final connected = await AppConnectivity.connectivity();
    if (connected) {
      state = state.copyWith(cardList:[],isCardListLoading: true);
      final bindCardApplyResponse = await _paymentsRepository.getCardList(
        page: page,
        pageSize: pageSize,
      );
      bindCardApplyResponse.when(
        success: (card) {
          print('getCardList**$card**');
          state = state.copyWith(cardList:card.cardList, isCardListLoading: false);
        },
        failure: (bindCardFailure) {
          state = state.copyWith(isCardListLoading: false);
          AppHelpers.showCheckFlash(
            context,
            'Error with getCardList!',
          );
        },
      );
    } else {
      if (mounted) {
        AppHelpers.showCheckFlash(
          context,
          AppHelpers.getTranslation(TrKeys.checkYourNetworkConnection),
        );
      }
    }
  }

  Future<void> makePayStackPayment(BuildContext context, double amount) async {
    final Charge charge = Charge()
      ..amount = (amount * 100).toInt()
      ..reference = Platform.isAndroid ? 'Android' : 'iOS'
      ..email = 'abbos@gmail.com'
      ..currency = LocalStorage.instance.getSelectedCurrency().title;
    try {
      final CheckoutResponse? response = await state.payStack?.checkout(
        context,
        method: CheckoutMethod.card,
        charge: charge,
      );
      debugPrint('===> paystack payment response: $response');
    } catch (e) {
      debugPrint('===> paystack payment error: $e');
    }
  }

  Future<void> makeRazorpayPayment(double amount) async {
    var options = {
      'key': razorpayKey,
      'amount': (amount * 100).toStringAsFixed(2),
      'name': 'Githubit',
      'currency': LocalStorage.instance.getSelectedCurrency().title,
      'description': 'Order pay',
      'retry': {'enabled': true, 'max_count': 1},
      'send_sms_hash': true,
      'prefill': {'contact': '8888888888', 'email': 'test@razorpay.com'},
      'external': {
        'wallets': ['paytm']
      }
    };

    try {
      state.razorpay?.open(options);
    } catch (e) {
      debugPrint('Error: $e');
    }
  }

  Future<void> createAddress(
    BuildContext context,
    LocalAddressData address,
  ) async {
    final connected = await AppConnectivity.connectivity();
    if (connected) {
      state = state.copyWith(isAddressCreating: true);
      final response = await _addressRepository.createAddress(address);
      response.when(
        success: (data) {
          final List<LocalAddressData> localAddresses =
              List.from(LocalStorage.instance.getLocalAddressesList());
          int index = 0;
          for (int i = 0; i < localAddresses.length; i++) {
            if (address.location == localAddresses[i].location) {
              index = i;
              break;
            }
          }
          localAddresses[index] = LocalAddressData(
            id: data.data?.id,
            title: data.data?.title,
            address: data.data?.address,
            location: address.location,
            isDefault: data.data?.isDefault,
            isSelected: address.isSelected,
          );
          LocalStorage.instance.setLocalAddressesList(localAddresses);
          state = state.copyWith(isAddressCreating: false);
        },
        failure: (failure) {
          if (failure == const NetworkExceptions.unauthorisedRequest()) {
            LocalStorage.instance.deleteToken();
            AppHelpers.showCheckFlash(
              context,
              AppHelpers.getTranslation(TrKeys.youNeedToLoginFirst),
            );
            context.router.pushAndPopUntil(
              const LoginRoute(),
              predicate: (route) => false,
            );
          }
          debugPrint('==> get profile details failure: $failure');
          state = state.copyWith(isAddressCreating: false);
        },
      );
    } else {
      if (mounted) {
        AppHelpers.showCheckFlash(
          context,
          AppHelpers.getTranslation(TrKeys.checkYourNetworkConnection),
        );
      }
    }
  }

  void checkData(OrderBodyData orderBody) {
    log('===> order body: $orderBody');
  }

  void setComment(String? value) {
    state = state.copyWith(comment: value?.trim());
  }

  void setShopCoupon(String coupon, int shopId) {
    final List<ApplyCouponData> applyCoupons = List.from(state.applyCoupons);
    int index = 0;
    for (int i = 0; i < applyCoupons.length; i++) {
      if (shopId == applyCoupons[i].shopId) {
        index = i;
        break;
      }
    }
    applyCoupons[index] =
        applyCoupons[index].copyWith(coupon: coupon, isError: false);
    state = state.copyWith(applyCoupons: applyCoupons);
  }

  void setShopCouponStatus(bool status, int shopId) {
    final List<ApplyCouponData> applyCoupons = List.from(state.applyCoupons);
    int index = 0;
    for (int i = 0; i < applyCoupons.length; i++) {
      if (shopId == applyCoupons[i].shopId) {
        index = i;
        break;
      }
    }
    applyCoupons[index] =
        applyCoupons[index].copyWith(isApplied: status, isError: !status);
    state = state.copyWith(applyCoupons: applyCoupons);
  }

  Future<void> checkCoupon(
    BuildContext context,
    int shopId,
    OrderNotifier orderNotifier,
  ) async {
    final connected = await AppConnectivity.connectivity();
    if (connected) {
      state = state.copyWith(isCheckingCoupon: true);
      String? coupon;
      for (final couponData in state.applyCoupons) {
        if (shopId == couponData.shopId) {
          coupon = couponData.coupon;
          break;
        }
      }
      final response = await _ordersRepository.checkCoupon(
        coupon: coupon ?? '',
        shopId: shopId,
      );
      response.when(
        success: (data) async {
          state = state.copyWith(isCheckingCoupon: false);
          setShopCouponStatus(true, shopId);
          orderNotifier.setCoupon(
            data.data?.price ?? 0.0,
            data.data?.type == 'fix' ? CouponType.fix : CouponType.percent,
            shopId,
          );
        },
        failure: (failure) {
          state = state.copyWith(isCheckingCoupon: false);
          setShopCouponStatus(false, shopId);
          debugPrint('==> check coupon failure: $failure');
        },
      );
    } else {
      if (mounted) {
        AppHelpers.showCheckFlash(
          context,
          AppHelpers.getTranslation(TrKeys.checkYourNetworkConnection),
        );
      }
    }
  }

  Future<void> checkCashback(BuildContext context, double amount) async {
    final connected = await AppConnectivity.connectivity();
    if (connected) {
      state = state.copyWith(isCheckingCashback: true);
      final response = await _ordersRepository.checkCashback(amount: amount);
      response.when(
        success: (data) async {
          state = state.copyWith(
            isCheckingCashback: false,
            cashbackAmount: (data.data?.price ?? 0).toDouble(),
          );
        },
        failure: (failure) {
          state = state.copyWith(isCheckingCashback: false);
          debugPrint('==> check cashback failure: $failure');
        },
      );
    } else {
      if (mounted) {
        AppHelpers.showCheckFlash(
          context,
          AppHelpers.getTranslation(TrKeys.checkYourNetworkConnection),
        );
      }
    }
  }

  Future<void> createPaypalPayment(
    BuildContext context,
    double total,
    int? orderId,
  ) async {
    final request = BraintreeDropInRequest(
      tokenizationKey: tokenizationKey,
      collectDeviceData: true,
      paypalRequest: BraintreePayPalRequest(
        amount: (total * 100).toStringAsFixed(2),
        currencyCode: LocalStorage.instance.getSelectedCurrency().title,
        displayName: AppHelpers.getAppName(),
      ),
    );
    await BraintreeDropIn.start(request)
        .then((value) => createTransaction(context, orderId));
  }

  Future<void> makeStripePayment(
    BuildContext context,
    double amount,
    int? orderId,
  ) async {
    try {
      Map<String, dynamic>? paymentIntentData =
          await createStripePaymentIntent(context, amount, orderId);
      if (paymentIntentData != null) {
        await Stripe.instance.initPaymentSheet(
          paymentSheetParameters: SetupPaymentSheetParameters(
            merchantDisplayName: 'Prospects',
            customerId: paymentIntentData['customer'],
            paymentIntentClientSecret: paymentIntentData['client_secret'],
            customerEphemeralKeySecret: paymentIntentData['ephemeralKey'],
          ),
        );
        await Stripe.instance
            .presentPaymentSheet()
            .then((value) => createTransaction(context, orderId));
        debugPrint('===> stripe payment succeeded');
      }
    } catch (e) {
      AppHelpers.showCheckFlash(
        context,
        AppHelpers.getTranslation(TrKeys.errorOccurredWithPayingViaStripe),
      );
      createTransaction(context, orderId);
    }
  }

  Future<void> makeHumoPayment(
      BuildContext context,
      double amount,
      int? orderId,
      ) async {
    try {
      Map<String, dynamic>? paymentIntentData =
      await createStripePaymentIntent(context, amount, orderId);
      if (paymentIntentData != null) {
        await Stripe.instance.initPaymentSheet(
          paymentSheetParameters: SetupPaymentSheetParameters(
            merchantDisplayName: 'Prospects',
            customerId: paymentIntentData['customer'],
            paymentIntentClientSecret: paymentIntentData['client_secret'],
            customerEphemeralKeySecret: paymentIntentData['ephemeralKey'],
          ),
        );
        await Stripe.instance
            .presentPaymentSheet()
            .then((value) => createTransaction(context, orderId));
        debugPrint('===> stripe payment succeeded');
      }
    } catch (e) {
      AppHelpers.showCheckFlash(
        context,
        AppHelpers.getTranslation(TrKeys.errorOccurredWithPayingViaStripe),
      );
      createTransaction(context, orderId);
    }
  }

  createStripePaymentIntent(
    BuildContext context,
    double amount,
    int? orderId,
  ) async {
    try {
      Map<String, dynamic> body = {
        'amount': (amount * 100).toInt().toString(),
        'currency': LocalStorage.instance.getSelectedCurrency().title,
        'payment_method_types[]': 'card'
      };
      debugPrint('===> create stripe payment intent body: $body');
      var response = await http.post(
        Uri.parse('https://api.stripe.com/v1/payment_intents'),
        body: body,
        headers: {
          'Authorization': 'Bearer $stripeSecretKey',
          'Content-Type': 'application/x-www-form-urlencoded'
        },
      );
      debugPrint('===> create stripe paymant response body: ${response.body}');
      return jsonDecode(response.body);
    } catch (err) {
      debugPrint('===> error stripe payment error: $err');
    }
  }

  bool checkIfWalletIsEnough(BuildContext context, OrderState orderState) {
    final bool isWallet =
        state.payments[state.selectedPaymentIndex].tag?.toLowerCase() ==
            'wallet'.toLowerCase();
    if (isWallet) {
      final orderAmount =
          (orderState.calculateResponse?.data?.orderTotal ?? 0) +
              state.deliveryFee;
      final walletAmount = LocalStorage.instance.getWalletData()?.price ?? 0;
      debugPrint('====> check if wallet is enough order amount: $orderAmount');
      debugPrint(
          '====> check if wallet is enough wallet amount: $walletAmount');
      if (orderAmount > walletAmount) {
        return false;
      }
    }
    return true;
  }
}
