import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../../../../models/models.dart';

part 'saved_locations_state.freezed.dart';

@freezed
class SavedLocationsState with _$SavedLocationsState {
  const factory SavedLocationsState({
    @Default(false) bool isLoading,
    @Default(false) bool isUpdating,
    @Default([]) List<LocalAddressData> addresses,
    @Default([]) List<Map<MarkerId, Marker>> listOfMarkers,
  }) = _SavedLocationsState;

  const SavedLocationsState._();
}