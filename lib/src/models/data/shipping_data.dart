import '../../core/constants/constants.dart';
import 'shop_delivery.dart';

class ShippingData {
  final int shopId;
  final String openTime;
  final String closeTime;
  final ShippingDeliveryVisibilityType visibilityType;
  DeliveryTypeEnum? activeDelivery;
  List<ShopDelivery>? shopDeliveries;
  DeliveryData? deliveryData;
  PickupData? pickupData;

  ShippingData({
    required this.shopId,
    required this.openTime,
    required this.closeTime,
    required this.visibilityType,
    this.activeDelivery,
    this.shopDeliveries,
    this.deliveryData,
    this.pickupData,
  });

  ShippingData copyWith({
    ShippingDeliveryVisibilityType? visibilityType,
    DeliveryTypeEnum? activeDelivery,
    int? addressIndex,
    List<ShopDelivery>? shopDeliveries,
    DeliveryData? deliveryData,
    PickupData? pickupData,
  }) =>
      ShippingData(
        shopId: shopId,
        openTime: openTime,
        closeTime: closeTime,
        visibilityType: visibilityType ?? this.visibilityType,
        activeDelivery: activeDelivery ?? this.activeDelivery,
        shopDeliveries: shopDeliveries ?? this.shopDeliveries,
        deliveryData: deliveryData ?? this.deliveryData,
        pickupData: pickupData ?? this.pickupData,
      );
}

class DeliveryData {
  final ShopDelivery? shopDelivery;
  final String? deliveryDate;
  final String? deliveryTime;

  DeliveryData({
    this.shopDelivery,
    this.deliveryDate,
    this.deliveryTime,
  });

  DeliveryData copyWith({
    ShopDelivery? shopDelivery,
    String? deliveryDate,
    String? deliveryTime,
  }) =>
      DeliveryData(
        shopDelivery: shopDelivery ?? this.shopDelivery,
        deliveryDate: deliveryDate ?? this.deliveryDate,
        deliveryTime: deliveryTime ?? this.deliveryTime,
      );
}

class PickupData {
  final String? pickupDate;
  final ShopDelivery? deliveryData;
  final int? pickupIndex;

  PickupData({
    this.pickupDate,
    this.deliveryData,
    this.pickupIndex,
  });

  PickupData copyWith({
    String? pickupDate,
    ShopDelivery? deliveryData,
    int? pickupIndex,
  }) =>
      PickupData(
        pickupDate: pickupDate ?? this.pickupDate,
        deliveryData: deliveryData ?? this.deliveryData,
        pickupIndex: pickupIndex ?? this.pickupIndex,
      );
}
