import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../../../../../core/constants/constants.dart';
import '../../../../../../core/routes/app_router.gr.dart';
import '../../../../../../core/utils/utils.dart';
import '../../../../../../models/models.dart';
import '../../../../../theme/theme.dart';

class OrderItemWidget extends StatelessWidget {
  final OrderData order;

  const OrderItemWidget({Key? key, required this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = LocalStorage.instance.getAppThemeMode();
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Material(
          color: isDarkMode ? AppColors.dontHaveAnAccBackDark : AppColors.white,
          borderRadius: BorderRadius.circular(10.r),
          child: InkWell(
            borderRadius: BorderRadius.circular(10.r),
            onTap: () => context.pushRoute(
              OrderDetailsRoute(
                orderId: order.id ?? 0,
                date: order.createdAt ?? '',
              ),
            ),
            child: Container(
              height: 131.r,
              padding: REdgeInsets.symmetric(horizontal: 15, vertical: 12),
              child: Column(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          child: Stack(
                            alignment: Alignment.topLeft,
                            clipBehavior: Clip.none,
                            children:
                                AppHelpers.getOrderShopLogos(order.details),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              '${order.createdAt?.substring(5, 10)}',
                              style: GoogleFonts.k2d(
                                fontWeight: FontWeight.w500,
                                fontSize: 14.sp,
                                letterSpacing: -14 * 0.01,
                                color: isDarkMode
                                    ? AppColors.white
                                    : AppColors.black,
                              ),
                            ),
                            Text(
                              '${order.createdAt?.substring(0, 4)}',
                              style: GoogleFonts.k2d(
                                fontWeight: FontWeight.w500,
                                fontSize: 14.sp,
                                letterSpacing: -14 * 0.01,
                                color: isDarkMode
                                    ? AppColors.dragElementDark
                                    : AppColors.unselectedTab,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${AppHelpers.getOrderProductsCount(order)} ${AppHelpers.getTranslation(TrKeys.products).toLowerCase()}',
                            style: GoogleFonts.k2d(
                              fontWeight: FontWeight.w600,
                              fontSize: 14.sp,
                              letterSpacing: -14 * 0.01,
                              color: isDarkMode
                                  ? AppColors.white
                                  : AppColors.black,
                            ),
                          ),
                          6.verticalSpace,
                          Text(
                            NumberFormat.currency(
                              symbol: order.currency?.symbol,
                            ).format(order.price),
                            style: GoogleFonts.k2d(
                              fontWeight: FontWeight.w500,
                              fontSize: 13.sp,
                              letterSpacing: -14 * 0.01,
                              color: isDarkMode
                                  ? AppColors.white
                                  : AppColors.black,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        '${AppHelpers.getTranslation(TrKeys.order)}: ${order.id}',
                        style: GoogleFonts.k2d(
                          fontWeight: FontWeight.w500,
                          fontSize: 13.sp,
                          letterSpacing: -14 * 0.01,
                          color: isDarkMode ? AppColors.white : AppColors.black,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        10.verticalSpace,
      ],
    );
  }
}
