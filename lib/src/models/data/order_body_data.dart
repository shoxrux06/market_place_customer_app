class OrderBodyData {
  final int userId;
  final num total;
  final int currencyId;
  final num currencyRate;
  final String? note;
  final List<ShopOrder> shops;

  OrderBodyData({
    required this.userId,
    required this.total,
    required this.currencyId,
    required this.currencyRate,
    this.note,
    required this.shops,
  });

  @override
  String toString() {
    return "{\"user_id\":$userId, \"total\":$total, \"currency_id\":$currencyId, \"rate\":$currencyRate, \"note\":\"$note\", \"shops\":$shops}";
  }
}

class ShopOrder {
  final int shopId;
  final int? deliveryAddressId;
  final num? deliveryFee;
  final int? deliveryTypeId;
  final String? coupon;
  final String? deliveryDate;
  final String? deliveryTime;
  final num tax;
  final List<ProductOrder> products;

  ShopOrder({
    required this.shopId,
    this.deliveryFee,
    this.deliveryTypeId,
    this.deliveryAddressId,
    this.coupon,
    this.deliveryDate,
    this.deliveryTime,
    required this.tax,
    required this.products,
  });

  @override
  String toString() {
    return "{\"shop_id\":$shopId, \"delivery_address_id\":$deliveryAddressId, \"delivery_fee\":$deliveryFee, \"delivery_type_id\":$deliveryTypeId, \"coupon\":\"$coupon\", \"delivery_date\":\"$deliveryDate\", \"delivery_time\":\"$deliveryTime\", \"tax\":$tax, \"products\":$products}";
  }
}

class ProductOrder {
  final int stockId;
  final num price;
  final int quantity;
  final num tax;
  final num discount;
  final num totalPrice;

  ProductOrder({
    required this.stockId,
    required this.price,
    required this.quantity,
    required this.tax,
    required this.discount,
    required this.totalPrice,
  });

  @override
  String toString() {
    return "{\"stock_id\":$stockId, \"price\":$price, \"qty\":$quantity, \"tax\":$tax, \"discount\":$discount, \"total_price\":$totalPrice}";
  }
}
