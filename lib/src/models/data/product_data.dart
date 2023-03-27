import 'review_data.dart';
import 'translation.dart';
import 'location.dart';

class ProductData {
  ProductData({
    int? id,
    String? uuid,
    int? shopId,
    int? categoryId,
    String? keywords,
    int? brandId,
    num? tax,
    int? minQty,
    int? maxQty,
    bool? active,
    String? img,
    String? createdAt,
    String? updatedAt,
    num? ratingAvg,
    dynamic ordersCount,
    Translation? translation,
    List<Properties>? properties,
    List<Stocks>? stocks,
    Shop? shop,
    Category? category,
    Brand? brand,
    Unit? unit,
    List<ReviewData>? reviews,
    List<Galleries>? galleries,
  }) {
    _id = id;
    _uuid = uuid;
    _shopId = shopId;
    _categoryId = categoryId;
    _keywords = keywords;
    _brandId = brandId;
    _tax = tax;
    _minQty = minQty;
    _maxQty = maxQty;
    _active = active;
    _img = img;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _ratingAvg = ratingAvg;
    _ordersCount = ordersCount;
    _translation = translation;
    _properties = properties;
    _stocks = stocks;
    _shop = shop;
    _category = category;
    _brand = brand;
    _unit = unit;
    _reviews = reviews;
    _galleries = galleries;
  }

  ProductData.fromJson(dynamic json) {
    _id = json['id'];
    _uuid = json['uuid'];
    _shopId = json['shop_id'];
    _categoryId = json['category_id'];
    _keywords = json['keywords'];
    _brandId = json['brand_id'];
    _tax = json['tax'];
    _minQty = json['min_qty'];
    _maxQty = json['max_qty'];
    _active = json['active'];
    _img = json['img'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _ratingAvg = json['rating_avg'];
    _ordersCount = json['orders_count'];
    _translation = json['translation'] != null
        ? Translation.fromJson(json['translation'])
        : null;
    if (json['properties'] != null) {
      _properties = [];
      json['properties'].forEach((v) {
        _properties?.add(Properties.fromJson(v));
      });
    }
    if (json['stocks'] != null) {
      _stocks = [];
      json['stocks'].forEach((v) {
        _stocks?.add(Stocks.fromJson(v));
      });
    }
    _shop = json['shop'] != null ? Shop.fromJson(json['shop']) : null;
    _category =
        json['category'] != null ? Category.fromJson(json['category']) : null;
    _brand = json['brand'] != null ? Brand.fromJson(json['brand']) : null;
    _unit = json['unit'] != null ? Unit.fromJson(json['unit']) : null;
    if (json['reviews'] != null) {
      _reviews = [];
      json['reviews'].forEach((v) {
        _reviews?.add(ReviewData.fromJson(v));
      });
    }
    if (json['galleries'] != null) {
      _galleries = [];
      json['galleries'].forEach((v) {
        _galleries?.add(Galleries.fromJson(v));
      });
    }
  }

  int? _id;
  String? _uuid;
  int? _shopId;
  int? _categoryId;
  String? _keywords;
  int? _brandId;
  num? _tax;
  int? _minQty;
  int? _maxQty;
  bool? _active;
  String? _img;
  String? _createdAt;
  String? _updatedAt;
  num? _ratingAvg;
  dynamic _ordersCount;
  Translation? _translation;
  List<Properties>? _properties;
  List<Stocks>? _stocks;
  Shop? _shop;
  Category? _category;
  Brand? _brand;
  Unit? _unit;
  List<ReviewData>? _reviews;
  List<Galleries>? _galleries;

  ProductData copyWith({
    int? id,
    String? uuid,
    int? shopId,
    int? categoryId,
    String? keywords,
    int? brandId,
    num? tax,
    int? minQty,
    int? maxQty,
    bool? active,
    String? img,
    String? createdAt,
    String? updatedAt,
    num? ratingAvg,
    dynamic ordersCount,
    Translation? translation,
    List<Properties>? properties,
    List<Stocks>? stocks,
    Shop? shop,
    Category? category,
    Brand? brand,
    Unit? unit,
    List<ReviewData>? reviews,
    List<Galleries>? galleries,
  }) =>
      ProductData(
        id: id ?? _id,
        uuid: uuid ?? _uuid,
        shopId: shopId ?? _shopId,
        categoryId: categoryId ?? _categoryId,
        keywords: keywords ?? _keywords,
        brandId: brandId ?? _brandId,
        tax: tax ?? _tax,
        minQty: minQty ?? _minQty,
        maxQty: maxQty ?? _maxQty,
        active: active ?? _active,
        img: img ?? _img,
        createdAt: createdAt ?? _createdAt,
        updatedAt: updatedAt ?? _updatedAt,
        ratingAvg: ratingAvg ?? _ratingAvg,
        ordersCount: ordersCount ?? _ordersCount,
        translation: translation ?? _translation,
        properties: properties ?? _properties,
        stocks: stocks ?? _stocks,
        shop: shop ?? _shop,
        category: category ?? _category,
        brand: brand ?? _brand,
        unit: unit ?? _unit,
        reviews: reviews ?? _reviews,
        galleries: galleries ?? _galleries,
      );

  int? get id => _id;

  String? get uuid => _uuid;

  int? get shopId => _shopId;

  int? get categoryId => _categoryId;

  String? get keywords => _keywords;

  int? get brandId => _brandId;

  num? get tax => _tax;

  int? get minQty => _minQty;

  int? get maxQty => _maxQty;

  bool? get active => _active;

  String? get img => _img;

  String? get createdAt => _createdAt;

  String? get updatedAt => _updatedAt;

  num? get ratingAvg => _ratingAvg;

  dynamic get ordersCount => _ordersCount;

  Translation? get translation => _translation;

  List<Properties>? get properties => _properties;

  List<Stocks>? get stocks => _stocks;

  Shop? get shop => _shop;

  Category? get category => _category;

  Brand? get brand => _brand;

  Unit? get unit => _unit;

  List<ReviewData>? get reviews => _reviews;

  List<Galleries>? get galleries => _galleries;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['uuid'] = _uuid;
    map['shop_id'] = _shopId;
    map['category_id'] = _categoryId;
    map['keywords'] = _keywords;
    map['brand_id'] = _brandId;
    map['tax'] = _tax;
    map['min_qty'] = _minQty;
    map['max_qty'] = _maxQty;
    map['active'] = _active;
    map['img'] = _img;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['rating_avg'] = _ratingAvg;
    map['orders_count'] = _ordersCount;
    if (_translation != null) {
      map['translation'] = _translation?.toJson();
    }
    if (_properties != null) {
      map['properties'] = _properties?.map((v) => v.toJson()).toList();
    }
    if (_stocks != null) {
      map['stocks'] = _stocks?.map((v) => v.toJson()).toList();
    }
    if (_shop != null) {
      map['shop'] = _shop?.toJson();
    }
    if (_category != null) {
      map['category'] = _category?.toJson();
    }
    if (_brand != null) {
      map['brand'] = _brand?.toJson();
    }
    if (_unit != null) {
      map['unit'] = _unit?.toJson();
    }
    if (_reviews != null) {
      map['reviews'] = _reviews?.map((v) => v.toJson()).toList();
    }
    if (_galleries != null) {
      map['galleries'] = _galleries?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Unit {
  Unit({
    int? id,
    bool? active,
    String? position,
    String? createdAt,
    String? updatedAt,
    Translation? translation,
  }) {
    _id = id;
    _active = active;
    _position = position;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _translation = translation;
  }

  Unit.fromJson(dynamic json) {
    _id = json['id'];
    _active = json['active'];
    _position = json['position'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _translation = json['translation'] != null
        ? Translation.fromJson(json['translation'])
        : null;
  }

  int? _id;
  bool? _active;
  String? _position;
  String? _createdAt;
  String? _updatedAt;
  Translation? _translation;

  Unit copyWith({
    int? id,
    bool? active,
    String? position,
    String? createdAt,
    String? updatedAt,
    Translation? translation,
  }) =>
      Unit(
        id: id ?? _id,
        active: active ?? _active,
        position: position ?? _position,
        createdAt: createdAt ?? _createdAt,
        updatedAt: updatedAt ?? _updatedAt,
        translation: translation ?? _translation,
      );

  int? get id => _id;

  bool? get active => _active;

  String? get position => _position;

  String? get createdAt => _createdAt;

  String? get updatedAt => _updatedAt;

  Translation? get translation => _translation;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['active'] = _active;
    map['position'] = _position;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    if (_translation != null) {
      map['translation'] = _translation?.toJson();
    }
    return map;
  }
}

class Brand {
  Brand({
    int? id,
    String? uuid,
    String? title,
  }) {
    _id = id;
    _uuid = uuid;
    _title = title;
  }

  Brand.fromJson(dynamic json) {
    _id = json['id'];
    _uuid = json['uuid'];
    _title = json['title'];
  }

  int? _id;
  String? _uuid;
  String? _title;

  Brand copyWith({
    int? id,
    String? uuid,
    String? title,
  }) =>
      Brand(
        id: id ?? _id,
        uuid: uuid ?? _uuid,
        title: title ?? _title,
      );

  int? get id => _id;

  String? get uuid => _uuid;

  String? get title => _title;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['uuid'] = _uuid;
    map['title'] = _title;
    return map;
  }
}

class Category {
  Category({
    int? id,
    String? uuid,
    int? parentId,
    Translation? translation,
  }) {
    _id = id;
    _uuid = uuid;
    _parentId = parentId;
    _translation = translation;
  }

  Category.fromJson(dynamic json) {
    _id = json['id'];
    _uuid = json['uuid'];
    _parentId = json['parent_id'];
    _translation = json['translation'] != null
        ? Translation.fromJson(json['translation'])
        : null;
  }

  int? _id;
  String? _uuid;
  int? _parentId;
  Translation? _translation;

  Category copyWith({
    int? id,
    String? uuid,
    int? parentId,
    Translation? translation,
  }) =>
      Category(
        id: id ?? _id,
        uuid: uuid ?? _uuid,
        parentId: parentId ?? _parentId,
        translation: translation ?? _translation,
      );

  int? get id => _id;

  String? get uuid => _uuid;

  int? get parentId => _parentId;

  Translation? get translation => _translation;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['uuid'] = _uuid;
    map['parent_id'] = _parentId;
    if (_translation != null) {
      map['translation'] = _translation?.toJson();
    }
    return map;
  }
}

class Shop {
  Shop({
    int? id,
    String? uuid,
    int? userId,
    num? tax,
    num? deliveryRange,
    num? percentage,
    Location? location,
    String? phone,
    bool? showType,
    bool? open,
    bool? visibility,
    String? openTime,
    String? closeTime,
    String? backgroundImg,
    String? logoImg,
    int? minAmount,
    String? status,
    String? statusNote,
    String? createdAt,
    String? updatedAt,
    Translation? translation,
  }) {
    _id = id;
    _uuid = uuid;
    _userId = userId;
    _tax = tax;
    _deliveryRange = deliveryRange;
    _percentage = percentage;
    _location = location;
    _phone = phone;
    _showType = showType;
    _open = open;
    _visibility = visibility;
    _openTime = openTime;
    _closeTime = closeTime;
    _backgroundImg = backgroundImg;
    _logoImg = logoImg;
    _minAmount = minAmount;
    _status = status;
    _statusNote = statusNote;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _translation = translation;
  }

  Shop.fromJson(dynamic json) {
    _id = json['id'];
    _uuid = json['uuid'];
    _userId = json['user_id'];
    _tax = json['tax'];
    _deliveryRange = json['delivery_range'];
    _percentage = json['percentage'];
    _location =
        json['location'] != null ? Location.fromJson(json['location']) : null;
    _phone = json['phone'];
    _showType = json['show_type'];
    _open = json['open'];
    _visibility = json['visibility'];
    _openTime = json['open_time'];
    _closeTime = json['close_time'];
    _backgroundImg = json['background_img'];
    _logoImg = json['logo_img'];
    _minAmount = json['min_amount'];
    _status = json['status'];
    _statusNote = json['status_note'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _translation = json['translation'] != null
        ? Translation.fromJson(json['translation'])
        : null;
  }

  int? _id;
  String? _uuid;
  int? _userId;
  num? _tax;
  num? _deliveryRange;
  num? _percentage;
  Location? _location;
  String? _phone;
  bool? _showType;
  bool? _open;
  bool? _visibility;
  String? _openTime;
  String? _closeTime;
  String? _backgroundImg;
  String? _logoImg;
  int? _minAmount;
  String? _status;
  String? _statusNote;
  String? _createdAt;
  String? _updatedAt;
  Translation? _translation;

  Shop copyWith({
    int? id,
    String? uuid,
    int? userId,
    num? tax,
    num? deliveryRange,
    num? percentage,
    Location? location,
    String? phone,
    bool? showType,
    bool? open,
    bool? visibility,
    String? openTime,
    String? closeTime,
    String? backgroundImg,
    String? logoImg,
    int? minAmount,
    String? status,
    String? statusNote,
    String? createdAt,
    String? updatedAt,
    Translation? translation,
  }) =>
      Shop(
        id: id ?? _id,
        uuid: uuid ?? _uuid,
        userId: userId ?? _userId,
        tax: tax ?? _tax,
        deliveryRange: deliveryRange ?? _deliveryRange,
        percentage: percentage ?? _percentage,
        location: location ?? _location,
        phone: phone ?? _phone,
        showType: showType ?? _showType,
        open: open ?? _open,
        visibility: visibility ?? _visibility,
        openTime: openTime ?? _openTime,
        closeTime: closeTime ?? _closeTime,
        backgroundImg: backgroundImg ?? _backgroundImg,
        logoImg: logoImg ?? _logoImg,
        minAmount: minAmount ?? _minAmount,
        status: status ?? _status,
        statusNote: statusNote ?? _statusNote,
        createdAt: createdAt ?? _createdAt,
        updatedAt: updatedAt ?? _updatedAt,
        translation: translation ?? _translation,
      );

  int? get id => _id;

  String? get uuid => _uuid;

  int? get userId => _userId;

  num? get tax => _tax;

  num? get deliveryRange => _deliveryRange;

  num? get percentage => _percentage;

  Location? get location => _location;

  String? get phone => _phone;

  bool? get showType => _showType;

  bool? get open => _open;

  bool? get visibility => _visibility;

  String? get openTime => _openTime;

  String? get closeTime => _closeTime;

  String? get backgroundImg => _backgroundImg;

  String? get logoImg => _logoImg;

  int? get minAmount => _minAmount;

  String? get status => _status;

  String? get statusNote => _statusNote;

  String? get createdAt => _createdAt;

  String? get updatedAt => _updatedAt;

  Translation? get translation => _translation;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['uuid'] = _uuid;
    map['user_id'] = _userId;
    map['tax'] = _tax;
    map['delivery_range'] = _deliveryRange;
    map['percentage'] = _percentage;
    if (_location != null) {
      map['location'] = _location?.toJson();
    }
    map['phone'] = _phone;
    map['show_type'] = _showType;
    map['open'] = _open;
    map['visibility'] = _visibility;
    map['open_time'] = _openTime;
    map['close_time'] = _closeTime;
    map['background_img'] = _backgroundImg;
    map['logo_img'] = _logoImg;
    map['min_amount'] = _minAmount;
    map['status'] = _status;
    map['status_note'] = _statusNote;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    if (_translation != null) {
      map['translation'] = _translation?.toJson();
    }
    return map;
  }
}

class Stocks {
  Stocks({
    int? id,
    int? countableId,
    num? price,
    int? quantity,
    num? discount,
    num? tax,
    num? totalPrice,
    List<Extras>? extras,
    ProductData? product,
  }) {
    _id = id;
    _countableId = countableId;
    _price = price;
    _quantity = quantity;
    _discount = discount;
    _tax = tax;
    _totalPrice = totalPrice;
    _extras = extras;
    _product = product;
  }

  Stocks.fromJson(dynamic json) {
    _id = json['id'];
    _countableId = json['countable_id'];
    _price = json['price'];
    _quantity = json['quantity'];
    _discount = json['discount'];
    _tax = json['tax'];
    _totalPrice = json['total_price'];
    if (json['extras'] != null) {
      _extras = [];
      json['extras'].forEach((v) {
        _extras?.add(Extras.fromJson(v));
      });
    }
    _product =
        json['product'] != null ? ProductData.fromJson(json['product']) : null;
  }

  int? _id;
  int? _countableId;
  num? _price;
  int? _quantity;
  num? _discount;
  num? _tax;
  num? _totalPrice;
  List<Extras>? _extras;
  ProductData? _product;

  Stocks copyWith({
    int? id,
    int? countableId,
    num? price,
    int? quantity,
    num? discount,
    num? tax,
    num? totalPrice,
    List<Extras>? extras,
    ProductData? product,
  }) =>
      Stocks(
        id: id ?? _id,
        countableId: countableId ?? _countableId,
        price: price ?? _price,
        quantity: quantity ?? _quantity,
        discount: discount ?? _discount,
        tax: tax ?? _tax,
        totalPrice: totalPrice ?? _totalPrice,
        extras: extras ?? _extras,
        product: product ?? _product,
      );

  int? get id => _id;

  int? get countableId => _countableId;

  num? get price => _price;

  int? get quantity => _quantity;

  num? get discount => _discount;

  num? get tax => _tax;

  num? get totalPrice => _totalPrice;

  List<Extras>? get extras => _extras;

  ProductData? get product => _product;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['countable_id'] = _countableId;
    map['price'] = _price;
    map['quantity'] = _quantity;
    map['discount'] = _discount;
    map['tax'] = _tax;
    map['total_price'] = _totalPrice;
    if (_extras != null) {
      map['extras'] = _extras?.map((v) => v.toJson()).toList();
    }
    if (_product != null) {
      map['product'] = _product?.toJson();
    }
    return map;
  }

  @override
  String toString() {
    return 'Stocks{_id: $_id, _countableId: $_countableId, _price: $_price, _quantity: $_quantity, _discount: $_discount, _tax: $_tax, _totalPrice: $_totalPrice, _extras: $_extras, _product: $_product}';
  }
}

class Extras {
  Extras({
    int? id,
    int? extraGroupId,
    String? value,
    bool? active,
    Group? group,
  }) {
    _id = id;
    _extraGroupId = extraGroupId;
    _value = value;
    _active = active;
    _group = group;
  }

  Extras.fromJson(dynamic json) {
    _id = json['id'];
    _extraGroupId = json['extra_group_id'];
    _value = json['value'];
    _active = json['active'];
    _group = json['group'] != null ? Group.fromJson(json['group']) : null;
  }

  int? _id;
  int? _extraGroupId;
  String? _value;
  bool? _active;
  Group? _group;

  Extras copyWith({
    int? id,
    int? extraGroupId,
    String? value,
    bool? active,
    Group? group,
  }) =>
      Extras(
        id: id ?? _id,
        extraGroupId: extraGroupId ?? _extraGroupId,
        value: value ?? _value,
        active: active ?? _active,
        group: group ?? _group,
      );

  int? get id => _id;

  int? get extraGroupId => _extraGroupId;

  String? get value => _value;

  bool? get active => _active;

  Group? get group => _group;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['extra_group_id'] = _extraGroupId;
    map['value'] = _value;
    map['active'] = _active;
    if (_group != null) {
      map['group'] = _group?.toJson();
    }
    return map;
  }
}

class Group {
  Group({
    int? id,
    String? type,
    bool? active,
    Translation? translation,
  }) {
    _id = id;
    _type = type;
    _active = active;
    _translation = translation;
  }

  Group.fromJson(dynamic json) {
    _id = json['id'];
    _type = json['type'];
    _active = json['active'];
    _translation = json['translation'] != null
        ? Translation.fromJson(json['translation'])
        : null;
  }

  int? _id;
  String? _type;
  bool? _active;
  Translation? _translation;

  Group copyWith({
    int? id,
    String? type,
    bool? active,
    Translation? translation,
  }) =>
      Group(
        id: id ?? _id,
        type: type ?? _type,
        active: active ?? _active,
        translation: translation ?? _translation,
      );

  int? get id => _id;

  String? get type => _type;

  bool? get active => _active;

  Translation? get translation => _translation;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['type'] = _type;
    map['active'] = _active;
    if (_translation != null) {
      map['translation'] = _translation?.toJson();
    }
    return map;
  }
}

class Properties {
  Properties({
    String? locale,
    String? key,
    String? value,
  }) {
    _locale = locale;
    _key = key;
    _value = value;
  }

  Properties.fromJson(dynamic json) {
    _locale = json['locale'];
    _key = json['key'];
    _value = json['value'];
  }

  String? _locale;
  String? _key;
  String? _value;

  Properties copyWith({
    String? locale,
    String? key,
    String? value,
  }) =>
      Properties(
        locale: locale ?? _locale,
        key: key ?? _key,
        value: value ?? _value,
      );

  String? get locale => _locale;

  String? get key => _key;

  String? get value => _value;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['locale'] = _locale;
    map['key'] = _key;
    map['value'] = _value;
    return map;
  }
}
