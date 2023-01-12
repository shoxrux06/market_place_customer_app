import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../core/constants/constants.dart';
import '../../../../../core/routes/app_router.gr.dart';
import '../../../../../core/utils/utils.dart';
import '../../../../components/components.dart';
import '../../../../theme/theme.dart';
import '../../home/widgets/drawer/address_item.dart';
import '../riverpod/provider/address_modal_provider.dart';

class AddressesModal extends ConsumerWidget {
  const AddressesModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(addressModalProvider);
    final notifier = ref.read(addressModalProvider.notifier);
    final bool isDarkMode = LocalStorage.instance.getAppThemeMode();
    final bool isLtr = LocalStorage.instance.getLangLtr();
    return Directionality(
      textDirection: isLtr ? TextDirection.ltr : TextDirection.rtl,
      child: Padding(
        padding: REdgeInsets.symmetric(horizontal: 15),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            11.verticalSpace,
            Container(
              width: 49.r,
              height: 4.r,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(62.r),
                color: isDarkMode
                    ? AppColors.dragElementDark
                    : AppColors.dragElement,
              ),
            ),
            16.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppHelpers.getTranslation(TrKeys.address).toUpperCase(),
                  style: GoogleFonts.k2d(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                    letterSpacing: -14 * 0.01,
                    color: isDarkMode ? AppColors.white : AppColors.black,
                  ),
                ),
                TextButton(
                  style: ButtonStyle(
                    overlayColor: MaterialStateColor.resolveWith(
                      (states) => isDarkMode
                          ? AppColors.mainBackDark
                          : AppColors.dontHaveAccBtnBack,
                    ),
                  ),
                  onPressed: () =>
                      context.pushRoute(AddAddressRoute(isRequired: false)),
                  child: Row(
                    children: [
                      Icon(
                        FlutterRemix.add_line,
                        size: 20.r,
                        color: isDarkMode ? AppColors.white : AppColors.black,
                      ),
                      5.horizontalSpace,
                      Text(
                        AppHelpers.getTranslation(TrKeys.addNewAddress),
                        style: GoogleFonts.k2d(
                          fontWeight: FontWeight.w500,
                          fontSize: 14.sp,
                          color: isDarkMode ? AppColors.white : AppColors.black,
                          letterSpacing: -14 * 0.03,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            state.isLoading
                ? const SearchLocationListShimmer()
                : ListView.builder(
                    physics: const CustomBouncingScrollPhysics(),
                    shrinkWrap: true,
                    padding: REdgeInsets.only(top: 30, bottom: 23),
                    itemCount: state.addresses.length,
                    itemBuilder: (context, index) {
                      final address = state.addresses[index];
                      return AddressItem(
                        address: address,
                        onTap: () {
                          notifier.changeLocalAddress(index);
                          context.popRoute();
                        },
                      );
                    },
                  ),
          ],
        ),
      ),
    );
  }
}
