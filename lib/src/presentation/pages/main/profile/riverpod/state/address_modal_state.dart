import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../../models/models.dart';

part 'address_modal_state.freezed.dart';

@freezed
class AddressModalState with _$AddressModalState {
  const factory AddressModalState({
    @Default(false) bool isLoading,
    @Default([]) List<LocalAddressData> addresses,
    @Default('') String activeAddress,
  }) = _AddressModalState;

  const AddressModalState._();
}