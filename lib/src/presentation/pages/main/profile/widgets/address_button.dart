import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../../../../core/constants/constants.dart';
import '../../../../../core/utils/utils.dart';
import '../../../../../riverpod/provider/app_provider.dart';
import '../../../../theme/theme.dart';
import '../riverpod/provider/address_modal_provider.dart';
import 'addresses_modal.dart';

class AddressButton extends ConsumerWidget {
  const AddressButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(addressModalProvider);
    final appState = ref.watch(appProvider);
    return InkWell(
      onTap: () {
        AppHelpers.showCustomModalBottomSheet(
          context: context,
          modal: const AddressesModal(),
          isDarkMode: appState.isDarkMode,
        );
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            FlutterRemix.navigation_line,
            size: 20.r,
            color: appState.isDarkMode ? AppColors.white : AppColors.black,
          ),
          11.horizontalSpace,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                AppHelpers.getTranslation(TrKeys.address),
                style: GoogleFonts.k2d(
                  fontWeight: FontWeight.w400,
                  fontSize: 12.sp,
                  letterSpacing: -14 * 0.01,
                  color:
                      appState.isDarkMode ? AppColors.white : AppColors.black,
                ),
              ),
              2.verticalSpace,
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    state.activeAddress.length > 45
                        ? state.activeAddress.substring(0, 45)
                        : state.activeAddress,
                    maxLines: 2,
                    style: GoogleFonts.k2d(
                      fontWeight: FontWeight.w500,
                      fontSize: 13.sp,
                      letterSpacing: -14 * 0.01,
                      color: appState.isDarkMode
                          ? AppColors.white
                          : AppColors.black,
                    ),
                  ),
                  11.horizontalSpace,
                  Icon(
                    FlutterRemix.arrow_down_s_line,
                    color:
                        appState.isDarkMode ? AppColors.white : AppColors.black,
                    size: 20.r,
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
