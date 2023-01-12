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
import 'widgets/expandable_shop_order_item.dart';
import 'riverpod/provider/order_details_provider.dart';
import 'widgets/order_review_modal.dart';
import 'widgets/order_shop_totals_widget.dart';

class OrderDetailsPage extends ConsumerStatefulWidget {
  final int orderId;
  final String date;

  const OrderDetailsPage({Key? key, required this.orderId, required this.date})
      : super(key: key);

  @override
  ConsumerState<OrderDetailsPage> createState() => _OrderDetailsPageState();
}

class _OrderDetailsPageState extends ConsumerState<OrderDetailsPage> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    Future.delayed(
      Duration.zero,
      () {
        ref
            .read(orderDetailsProvider.notifier)
            .fetchOrderDetails(context, widget.orderId);
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
    final state = ref.watch(orderDetailsProvider);
    final bool isDarkMode = LocalStorage.instance.getAppThemeMode();
    final bool isLtr = LocalStorage.instance.getLangLtr();
    return Directionality(
      textDirection: isLtr ? TextDirection.ltr : TextDirection.rtl,
      child: Scaffold(
        backgroundColor:
            isDarkMode ? AppColors.dontHaveAnAccBackDark : AppColors.mainBack,
        extendBody: true,
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
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(),
              Container(
                height: 29.r,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100.r),
                  border: Border.all(
                    width: 1.r,
                    color: isDarkMode
                        ? AppColors.borderDark
                        : AppColors.black.withOpacity(0.09),
                  ),
                ),
                padding: REdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  children: [
                    Text(
                      '${AppHelpers.getTranslation(TrKeys.order)}_${widget.orderId}',
                      style: GoogleFonts.k2d(
                        fontWeight: FontWeight.w500,
                        fontSize: 12.sp,
                        letterSpacing: -0.4,
                        color:
                            isDarkMode ? AppColors.white : AppColors.reviewText,
                      ),
                    ),
                    12.horizontalSpace,
                    Container(
                      height: 19.r,
                      width: 1.r,
                      color: AppColors.verticalDivider,
                    ),
                    12.horizontalSpace,
                    Text(
                      widget.date.substring(0, 10),
                      style: GoogleFonts.k2d(
                        fontWeight: FontWeight.w500,
                        fontSize: 12.sp,
                        letterSpacing: -0.4,
                        color:
                            isDarkMode ? AppColors.white : AppColors.reviewText,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        body: state.isLoading
            ? JumpingDots(
                color: isDarkMode ? AppColors.white : AppColors.black,
              )
            : Column(
                children: [
                  1.verticalSpace,
                  Expanded(
                    child: SingleChildScrollView(
                      physics: const CustomBouncingScrollPhysics(),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ListView.builder(
                            itemCount: state.shopOrderDetails.length,
                            shrinkWrap: true,
                            physics: const CustomBouncingScrollPhysics(),
                            padding: EdgeInsets.zero,
                            itemBuilder: (context, index) {
                              final ShopOrderDetails orderDetails =
                                  state.shopOrderDetails[index];
                              return ExpandableShopOrderItem(
                                orderDetails: orderDetails,
                              );
                            },
                          ),
                          Container(
                            color: isDarkMode
                                ? AppColors.dontHaveAnAccBackDark
                                : AppColors.white,
                            padding: REdgeInsets.symmetric(
                              horizontal: 15,
                              vertical: 20,
                            ),
                            child: const OrderShopTotalsWidget(),
                          ),
                          50.verticalSpace,
                        ],
                      ),
                    ),
                  ),
                ],
              ),
        bottomNavigationBar: Container(
          color: AppColors.transparent,
          padding: REdgeInsets.only(
            left: 15,
            right: 15,
            bottom: 15,
            top: 10,
          ),
          child: Row(
            children: [
              Expanded(
                child: AccentLoginButton(
                  background: AppColors.red,
                  title: AppHelpers.getTranslation(TrKeys.cancelOrder),
                  onPressed: state.isCancelable ? () => {} : null,
                ),
              ),
              9.horizontalSpace,
              Expanded(
                child: AccentLoginButton(
                  background: AppColors.black,
                  title: AppHelpers.getTranslation(TrKeys.leaveFeedback),
                  onPressed: state.canLeaveFeedback
                      ? () {
                          // showCupertinoModalBottomSheet(
                          //   context: context,
                          //   builder: (context) => const OrderReviewModal(),
                          // );
                          showModalBottomSheet(
                            context: context,
                            builder: (context) => const OrderReviewModal(),
                          );
                        }
                      : null,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
