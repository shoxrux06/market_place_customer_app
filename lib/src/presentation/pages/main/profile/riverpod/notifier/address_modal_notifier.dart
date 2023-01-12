import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../core/utils/utils.dart';
import '../../../../../../models/models.dart';
import '../state/address_modal_state.dart';

class AddressModalNotifier extends StateNotifier<AddressModalState> {
  AddressModalNotifier() : super(const AddressModalState());

  Future<void> fetchLocalAddresses() async {
    state = state.copyWith(isLoading: true, addresses: []);
    state = state.copyWith(
      addresses: LocalStorage.instance.getLocalAddressesList(),
      isLoading: false,
      activeAddress: LocalStorage.instance.getActiveAddressTitle(),
    );
  }

  Future<void> changeLocalAddress(int index) async {
    String title = '';
    final List<LocalAddressData> localAddresses =
        LocalStorage.instance.getLocalAddressesList();
    for (int i = 0; i < localAddresses.length; i++) {
      if (i == index) {
        title = localAddresses[i].title ?? '';
        final updated = localAddresses[i].copyWith(isSelected: true);
        localAddresses[i] = updated;
      } else if (localAddresses[i].isSelected ?? false) {
        final updated = localAddresses[i].copyWith(isSelected: false);
        localAddresses[i] = updated;
      }
    }
    LocalStorage.instance.setLocalAddressesList(localAddresses);
    LocalStorage.instance.setActiveAddressTile(title);
    fetchLocalAddresses();
  }
}
