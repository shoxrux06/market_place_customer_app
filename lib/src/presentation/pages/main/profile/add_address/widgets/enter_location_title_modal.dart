import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/constants/constants.dart';
import '../../../../../../core/routes/app_router.gr.dart';
import '../../../../../../core/utils/utils.dart';
import '../../../../../components/components.dart';
import '../../../profile/riverpod/provider/address_modal_provider.dart';
import '../../../profile/saved_locations/riverpod/provider/saved_locations_provider.dart';
import '../riverpod/provider/add_address_provider.dart';

class EnterLocationTitleModal extends ConsumerWidget {
  final bool? hasBack;

  const EnterLocationTitleModal({Key? key, this.hasBack = true})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(addAddressProvider.notifier);
    final addressModalNotifier = ref.read(addressModalProvider.notifier);
    final savedLocationsNotifier = ref.read(savedLocationsProvider.notifier);
    final state = ref.watch(addAddressProvider);
    final bool isLtr = LocalStorage.instance.getLangLtr();
    return Directionality(
      textDirection: isLtr ? TextDirection.ltr : TextDirection.rtl,
      child: AbsorbPointer(
        absorbing: state.isSaving,
        child: AnimatedPadding(
          padding: REdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          duration: Duration.zero,
          child: Padding(
            padding: REdgeInsets.symmetric(horizontal: 15),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                11.verticalSpace,
                OutlinedBorderTextField(
                  onChanged: notifier.setTitle,
                  label: AppHelpers.getTranslation(TrKeys.title),
                ),
                16.verticalSpace,
                AccentLoginButton(
                  title: AppHelpers.getTranslation(TrKeys.save),
                  isLoading: state.isSaving,
                  onPressed: state.title.isNotEmpty
                      ? () => notifier.saveLocalAddress(
                            context,
                            addressModalNotifier,
                            savedLocationsNotifier,
                            hasBack,
                            onBack: () {
                              addressModalNotifier.fetchLocalAddresses();
                              savedLocationsNotifier.fetchSavedLocations();
                              Navigator.pop(context);
                              Navigator.pop(context);
                            },
                            onGoMain: () {
                              context.router.popUntilRoot();
                              context.replaceRoute(const ShopMainRoute());
                            },
                          )
                      : null,
                ),
                30.verticalSpace,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
