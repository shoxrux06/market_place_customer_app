import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../core/constants/constants.dart';
import '../../../../../../core/utils/utils.dart';
import '../../../../../../models/models.dart';
import '../../../../../components/components.dart';
import '../../../../../theme/theme.dart';
import '../../../view_map/riverpod/provider/view_map_provider.dart';
import '../riverpod/provider/order_provider.dart';
import 'riverpod/provider/checkout_provider.dart';
import 'widgets/current_order_status_widget.dart';
import 'widgets/payment_body_widget.dart';
import 'widgets/shipping_body_widget.dart';
import 'widgets/verify_body_widget.dart';

class CheckoutPage extends ConsumerStatefulWidget {
  const CheckoutPage({Key? key}) : super(key: key);

  @override
  ConsumerState<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends ConsumerState<CheckoutPage> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    Future.delayed(
      Duration.zero,
      () {
        final List<ShopData> shops = ref.watch(viewMapProvider).shops;
        ref.read(checkoutProvider.notifier).fetchShops(context, shops);
      },
    );
    _pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(checkoutProvider);
    final orderState = ref.watch(orderProvider);
    final notifier = ref.read(checkoutProvider.notifier);
    final orderNotifier = ref.read(orderProvider.notifier);
    final bool isDarkMode = LocalStorage.instance.getAppThemeMode();
    return KeyboardDismisser(
      child: AbsorbPointer(
        absorbing: state.isLoading ||
            state.isCreatingOrder ||
            orderState.isLoading ||
            state.isCheckingCoupon ||
            state.isCheckingCashback,
        child: Scaffold(
          backgroundColor:
              isDarkMode ? AppColors.dontHaveAnAccBackDark : AppColors.white,
          appBar: AppBar(
            backgroundColor:
                isDarkMode ? AppColors.dontHaveAnAccBackDark : AppColors.white,
            elevation: 0,
            leadingWidth: 0.r,
            leading: const SizedBox(),
            title: Text(
              AppHelpers.getTranslation(TrKeys.checkout).toUpperCase(),
              style: GoogleFonts.k2d(
                fontSize: 15.sp,
                fontWeight: FontWeight.w500,
                letterSpacing: -0.7,
                color: isDarkMode ? AppColors.white : AppColors.black,
              ),
            ),
            actions: [
              Center(
                child: InkWell(
                  onTap: context.popRoute,
                  child: Text(
                    AppHelpers.getTranslation(TrKeys.cancelOrder),
                    style: GoogleFonts.k2d(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w500,
                      letterSpacing: -0.7,
                      color: AppColors.red,
                    ),
                  ),
                ),
              ),
              15.horizontalSpace,
            ],
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(1.r),
              child: Container(
                color: isDarkMode ? AppColors.mainBackDark : AppColors.mainBack,
                height: 1.r,
              ),
            ),
          ),
          body: Column(
            children: [
              Container(
                height: 100.r,
                padding: REdgeInsets.symmetric(horizontal: 15),
                alignment: Alignment.center,
                child: Row(
                  children: [
                    CurrentOrderStatusWidget(
                      title: AppHelpers.getTranslation(TrKeys.shipping),
                      isDone: state.activePage > 0,
                      isActive: state.activePage == 0,
                      iconData: FlutterRemix.map_2_line,
                    ),
                    9.horizontalSpace,
                    CurrentOrderStatusWidget(
                      title: AppHelpers.getTranslation(TrKeys.payment),
                      isDone: state.activePage > 1,
                      isActive: state.activePage == 1,
                      iconData: FlutterRemix.bank_card_line,
                    ),
                    9.horizontalSpace,
                    CurrentOrderStatusWidget(
                      title: AppHelpers.getTranslation(TrKeys.verify),
                      isDone: false,
                      isActive: state.activePage == 2,
                      iconData: FlutterRemix.check_double_line,
                    ),
                  ],
                ),
              ),
              Divider(
                height: 1.r,
                thickness: 1.r,
                color: isDarkMode ? AppColors.mainBackDark : AppColors.mainBack,
              ),
              Expanded(
                child: PageView(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: _pageController,
                  onPageChanged: notifier.setActivePage,
                  children: const [
                    ShippingBodyWidget(),
                    PaymentBodyWidget(),
                    VerifyBodyWidget(),
                  ],
                ),
              ),
            ],
          ),
          bottomNavigationBar: Padding(
            padding: REdgeInsets.only(left: 15, right: 15, bottom: 23),
            child: Row(
              children: [
                if (state.activePage > 0)
                  Row(
                    children: [
                      Material(
                        borderRadius: BorderRadius.circular(8.r),
                        color: AppColors.black,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(8.r),
                          onTap: () {
                            _pageController.animateToPage(
                              state.activePage - 1,
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.ease,
                            );
                          },
                          child: Container(
                            width: 66.r,
                            height: 46.r,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            alignment: Alignment.center,
                            child: Icon(
                              FlutterRemix.arrow_left_s_line,
                              color: AppColors.white,
                              size: 24.r,
                            ),
                          ),
                        ),
                      ),
                      9.horizontalSpace,
                    ],
                  ),
                Expanded(
                  child: AccentLoginButton(
                    isLoading: state.isCreatingOrder,
                    title: state.activePage > 1
                        ? AppHelpers.getTranslation(TrKeys.pay)
                        : AppHelpers.getTranslation(TrKeys.continueText),
                    onPressed: state.isContinueEnabled
                        ? () {
                            switch (state.activePage) {
                              case 0:
                                _pageController.animateToPage(
                                  state.activePage + 1,
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.ease,
                                );
                                break;
                              case 1:
                                if (notifier.checkIfWalletIsEnough(
                                    context, orderState)) {
                                  _pageController.animateToPage(
                                    state.activePage + 1,
                                    duration: const Duration(milliseconds: 300),
                                    curve: Curves.ease,
                                  );
                                  notifier.updateCoupons(context);
                                  orderNotifier.getCalculations(
                                    context,
                                    orderState.shops,
                                    checkoutNotifier: notifier,
                                  );
                                } else {
                                  AppHelpers.showCheckFlash(
                                    context,
                                    AppHelpers.getTranslation(
                                      TrKeys
                                          .walletAmountIsNotEnoughForOrderCreating,
                                    ),
                                  );
                                }
                                break;
                              case 2:
                                notifier.makeAnOrder(
                                  context,
                                  orderState,
                                  orderNotifier,
                                );
                                break;
                            }
                          }
                        : null,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
