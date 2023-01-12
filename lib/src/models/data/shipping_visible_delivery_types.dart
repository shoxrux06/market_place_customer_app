class ShippingVisibleDeliveryTypes {
  final int shopId;
  final ShippingVisibleDeliveryTye type;

  ShippingVisibleDeliveryTypes(this.shopId, this.type);
}

enum ShippingVisibleDeliveryTye { cantOrder, onlyDelivery, onlyPickup, both }
