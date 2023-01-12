import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_place/google_place.dart';

import '../../../../../../../models/models.dart' as models;

part 'add_address_state.freezed.dart';

@freezed
class AddAddressState with _$AddAddressState {
  const factory AddAddressState({
    @Default(false) bool isLoading,
    @Default(false) bool isSearching,
    @Default(false) bool isSaving,
    @Default(false) bool isChoosing,
    @Default([]) List<AutocompletePrediction> searchedLocations,
    @Default('') String title,
    TextEditingController? textController,
    GoogleMapController? mapController,
    models.LocalLocation? location,
    String? address,
  }) = _AddAddressState;

  const AddAddressState._();
}