import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../../core/constants/constants.dart';
import '../../../../../../../core/utils/utils.dart';
import '../../../../../../components/components.dart';
import '../../../../../../theme/theme.dart';
import '../riverpod/provider/checkout_provider.dart';
import 'address_item_in_order_shipping.dart';

class AddressesModalInOrderShipping extends ConsumerWidget {
  const AddressesModalInOrderShipping({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(checkoutProvider);
    final notifier = ref.read(checkoutProvider.notifier);
    final bool isDarkMode = LocalStorage.instance.getAppThemeMode();
    return Padding(
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
              color:isDarkMode ? AppColors.dragElementDark : AppColors.dragElement,
            ),
          ),
          16.verticalSpace,
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              AppHelpers.getTranslation(TrKeys.address).toUpperCase(),
              style: GoogleFonts.k2d(
                fontSize: 18.sp,
                fontWeight: FontWeight.w500,
                letterSpacing: -14 * 0.01,
                color: isDarkMode ? AppColors.white :AppColors.black,
              ),
            ),
          ),
          ListView.builder(
            physics: const CustomBouncingScrollPhysics(),
            shrinkWrap: true,
            padding: REdgeInsets.symmetric(vertical: 30),
            itemCount: LocalStorage.instance.getLocalAddressesList().length,
            itemBuilder: (context, index) {
              final address =
                  LocalStorage.instance.getLocalAddressesList()[index];
              final isSelected = index == state.addressIndex;
              return AddressItemInOrderShipping(
                isSelected: isSelected,
                address: address,
                onTap: () {
                  notifier.changeAddress(index);
                  context.popRoute();
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
