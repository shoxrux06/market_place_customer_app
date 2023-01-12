import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../../../core/constants/constants.dart';

part 'become_seller_state.freezed.dart';

@freezed
class BecomeSellerState with _$BecomeSellerState {
  const factory BecomeSellerState({
    @Default('') String name,
    @Default('') String phone,
    @Default('') String description,
    @Default('') String openTime,
    @Default('') String closeTime,
    @Default('') String minAmount,
    @Default('') String tax,
    @Default('') String deliveryRange,
    @Default(false) bool saveBtnEnabled,
    @Default(false) bool isLoading,
    @Default(false) bool isSaving,
    @Default(ShopStatus.notRequested) ShopStatus shopStatus,
    LatLng? address,
    XFile? logoFile,
    XFile? backgroundFile,
    TextEditingController? addressController,
  }) = _BecomeSellerState;

  const BecomeSellerState._();
}
