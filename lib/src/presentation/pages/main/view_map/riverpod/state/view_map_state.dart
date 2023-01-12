import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../../../models/models.dart';

part 'view_map_state.freezed.dart';

@freezed
class ViewMapState with _$ViewMapState {
  const factory ViewMapState({
    @Default(false) bool isLoading,
    @Default([]) List<ShopData> shops,
    @Default({}) Map<MarkerId, Marker> shopMarkers,
    GlobalKey? globalKey,
  }) = _ViewMapState;

  const ViewMapState._();
}
