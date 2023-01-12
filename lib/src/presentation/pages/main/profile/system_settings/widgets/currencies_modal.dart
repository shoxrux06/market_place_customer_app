import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../core/constants/constants.dart';
import '../../../../../../core/utils/utils.dart';
import '../../../../../components/components.dart';
import '../../../../../theme/theme.dart';
import '../../../shop/details/riverpod/provider/shop_details_provider.dart';
import '../riverpod/provider/system_settings_provider.dart';
import 'currency_item_widget.dart';

class CurrenciesModal extends ConsumerWidget {
  const CurrenciesModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(systemSettingsProvider);
    final notifier = ref.read(systemSettingsProvider.notifier);
    final shopDetailsNotifier = ref.read(shopDetailsProvider.notifier);
    final bool isDarkMode = LocalStorage.instance.getAppThemeMode();
    final bool isLtr = LocalStorage.instance.getLangLtr();
    return Directionality(
      textDirection: isLtr ? TextDirection.ltr : TextDirection.rtl,
      child: Stack(
        children: [
          Padding(
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
                Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text(
                    AppHelpers.getTranslation(TrKeys.currencies).toUpperCase(),
                    style: GoogleFonts.k2d(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                      letterSpacing: -14 * 0.01,
                      color: isDarkMode ? AppColors.white : AppColors.black,
                    ),
                  ),
                ),
                state.isCurrenciesLoading
                    ? const OrdersShimmer(
                        itemCount: 5,
                        itemHeight: 56,
                        paddingVertical: 30,
                      )
                    : Expanded(
                        child: ListView.builder(
                          physics: const CustomBouncingScrollPhysics(),
                          shrinkWrap: true,
                          padding: REdgeInsets.symmetric(vertical: 30),
                          itemCount: state.currencies.length,
                          itemBuilder: (context, index) {
                            final currency = state.currencies[index];
                            final bool isLast =
                                state.currencies.length - 1 == index;
                            return CurrencyItemWidget(
                              currency: currency,
                              isLast: isLast,
                              onTap: () {
                                notifier.changeCurrency(
                                  context,
                                  currency,
                                  shopDetailsNotifier,
                                );
                                context.popRoute();
                              },
                            );
                          },
                        ),
                      ),
              ],
            ),
          ),
          BlurLoadingWidget(isLoading: state.isCurrencySaving)
        ],
      ),
    );
  }
}
