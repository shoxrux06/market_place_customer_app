import 'product_data.dart';

class CartProductData {
  CartProductData({
    int? quantity,
    String? imageUrl,
    String? title,
    Stocks? selectedStock,
  }) {
    _quantity = quantity;
    _imageUrl = imageUrl;
    _title = title;
    _selectedStock = selectedStock;
  }

  CartProductData.fromJson(dynamic json) {
    _quantity = json['quantity'];
    _imageUrl = json['image_url'];
    _title = json['title'];
    _selectedStock = json['selected_stock'] != null
        ? Stocks.fromJson(json['selected_stock'])
        : null;
  }

  int? _quantity;
  String? _imageUrl;
  String? _title;
  Stocks? _selectedStock;

  CartProductData copyWith({
    int? quantity,
    String? imageUrl,
    String? title,
    Stocks? selectedStock,
  }) =>
      CartProductData(
        quantity: quantity ?? _quantity,
        imageUrl: imageUrl ?? _imageUrl,
        title: title ?? _title,
        selectedStock: selectedStock ?? _selectedStock,
      );

  int? get quantity => _quantity;

  String? get imageUrl => _imageUrl;

  String? get title => _title;

  Stocks? get selectedStock => _selectedStock;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['quantity'] = _quantity;
    map['image_url'] = _imageUrl;
    map['title'] = _title;
    if (_selectedStock != null) {
      map['selected_stock'] = selectedStock?.toJson();
    }
    return map;
  }

  @override
  String toString() {
    return 'CartProductData{_quantity: $_quantity, _imageUrl: $_imageUrl, _title: $_title, _selectedStock: $_selectedStock}';
  }
}
