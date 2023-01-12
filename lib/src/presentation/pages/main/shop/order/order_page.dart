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
import '../../view_map/riverpod/provider/view_map_provider.dart';
import 'riverpod/provider/order_provider.dart';
import 'widgets/cart_products_body.dart';

class OrderPage extends ConsumerStatefulWidget {
  const OrderPage({Key? key}) : super(key: key);

  @override
  ConsumerState<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends ConsumerState<OrderPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      Duration.zero,
      () {
        final shops = ref.watch(viewMapProvider).shops;
        ref.read(orderProvider.notifier).getCalculations(context, shops);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(orderProvider);
    final notifier = ref.read(orderProvider.notifier);
    final bool isDarkMode = LocalStorage.instance.getAppThemeMode();
    final bool isLtr = LocalStorage.instance.getLangLtr();
    return Directionality(
      textDirection: isLtr ? TextDirection.ltr : TextDirection.rtl,
      child: AbsorbPointer(
        absorbing: state.isLoading,
        child: Scaffold(
          extendBody: true,
          backgroundColor:
              isDarkMode ? AppColors.dontHaveAnAccBackDark : AppColors.white,
          appBar: AppBar(
            backgroundColor:
                isDarkMode ? AppColors.dontHaveAnAccBackDark : AppColors.white,
            elevation: 0,
            leading: IconButton(
              splashRadius: 18.r,
              onPressed: context.popRoute,
              icon: Icon(
                isLtr
                    ? FlutterRemix.arrow_left_s_line
                    : FlutterRemix.arrow_right_s_line,
                size: 24.r,
                color: isDarkMode ? AppColors.white : AppColors.black,
              ),
            ),
            titleSpacing: -10.r,
            title: Row(
              children: [
                Text(
                  AppHelpers.getTranslation(TrKeys.myOrder).toUpperCase(),
                  style: GoogleFonts.k2d(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w500,
                    letterSpacing: -0.7,
                    color: isDarkMode ? AppColors.white : AppColors.black,
                  ),
                ),
                10.horizontalSpace,
                Container(
                  width: 4.r,
                  height: 4.r,
                  decoration: BoxDecoration(
                    color: isDarkMode
                        ? AppColors.dragElementDark
                        : AppColors.brandTitleDivider.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(2.r),
                  ),
                ),
                7.horizontalSpace,
                Text(
                  '${LocalStorage.instance.getCartProducts().length} ${AppHelpers.getTranslation(TrKeys.products)}',
                  style: GoogleFonts.k2d(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                    letterSpacing: -0.7,
                    color: isDarkMode ? AppColors.white : AppColors.black,
                  ),
                ),
              ],
            ),
            actions: [
              if (state.shopTotals.isNotEmpty)
                InkWell(
                  onTap: () => notifier.deleteAllCartProducts(),
                  child: Row(
                    children: [
                      Icon(
                        FlutterRemix.delete_bin_line,
                        color: AppColors.red,
                        size: 18.r,
                      ),
                      4.horizontalSpace,
                      Text(
                        AppHelpers.getTranslation(TrKeys.deleteAll),
                        style: GoogleFonts.k2d(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w500,
                          letterSpacing: -1,
                          color: AppColors.red,
                        ),
                      ),
                    ],
                  ),
                ),
              15.horizontalSpace,
            ],
          ),
          body: Column(
            children: [
              Divider(
                height: 1.r,
                thickness: 1.r,
                color: isDarkMode ? AppColors.mainBackDark : AppColors.mainBack,
              ),
              state.isLoading
                  ? Expanded(
                      child: JumpingDots(
                        color: isDarkMode ? AppColors.white : AppColors.black,
                      ),
                    )
                  : Expanded(
                      child: state.shopTotals.isNotEmpty
                          ? const CartProductsBody()
                          : Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 142.r,
                                  height: 142.r,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.r),
                                    color: isDarkMode
                                        ? AppColors.mainBackDark
                                        : AppColors.mainBack,
                                  ),
                                  alignment: Alignment.center,
                                  child: Image.asset(
                                    AppAssets.pngNoCartProducts,
                                    width: 57.r,
                                    height: 87.r,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                14.verticalSpace,
                                Text(
                                  '${AppHelpers.getTranslation(TrKeys.thereAreNoItemsInThe)} ${AppHelpers.getTranslation(TrKeys.myOrder).toLowerCase()}',
                                  style: GoogleFonts.k2d(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: -14 * 0.02,
                                    color: isDarkMode
                                        ? AppColors.white
                                        : AppColors.black,
                                  ),
                                ),
                              ],
                            ),
                    ),
            ],
          ),
          bottomNavigationBar: state.shopTotals.isNotEmpty
              ? Padding(
                  padding: REdgeInsets.only(left: 15, right: 15, bottom: 23),
                  child: AccentLoginButton(
                    title: AppHelpers.getTranslation(TrKeys.goToCheckout),
                    onPressed: () {
                      if (LocalStorage.instance.getToken().isEmpty) {
                        LocalStorage.instance.deleteToken();
                        AppHelpers.showCheckFlash(
                          context,
                          AppHelpers.getTranslation(TrKeys.youNeedToLoginFirst),
                        );
                        context.replaceRoute(const LoginRoute());
                        return;
                      }
                      context.pushRoute(const CheckoutRoute());
                    },
                  ),
                )
              : const SizedBox(),
        ),
      ),
    );
  }
}
