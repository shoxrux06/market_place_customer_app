import '../data/meta.dart';
import '../data/order_data.dart';

class OrderPaginateResponse {
  OrderPaginateResponse({
    List<OrderData>? data,
    Meta? meta,
  }) {
    _data = data;
    _meta = meta;
  }

  OrderPaginateResponse.fromJson(dynamic json) {
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(OrderData.fromJson(v));
      });
    }
    _meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
  }

  List<OrderData>? _data;
  Meta? _meta;

  OrderPaginateResponse copyWith({
    List<OrderData>? data,
    Meta? meta,
  }) =>
      OrderPaginateResponse(
        data: data ?? _data,
        meta: meta ?? _meta,
      );

  List<OrderData>? get data => _data;

  Meta? get meta => _meta;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    if (_meta != null) {
      map['meta'] = _meta?.toJson();
    }
    return map;
  }
}
