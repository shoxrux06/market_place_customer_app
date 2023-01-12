import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../models/models.dart';
import '../../../riverpod/provider/app_provider.dart';
import '../../theme/theme.dart';

class BrandFilterItem extends ConsumerWidget {
  final bool isSelected;
  final bool isLast;
  final BrandData brand;
  final Function() onTap;

  const BrandFilterItem({
    Key? key,
    required this.isSelected,
    required this.brand,
    required this.isLast,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(appProvider);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Material(
          color: AppColors.transparent,
          child: InkWell(
            onTap: onTap,
            child: Container(
              height: 56.r,
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      isSelected
                          ? Container(
                              width: 18.r,
                              height: 18.r,
                              decoration: BoxDecoration(
                                color: AppColors.accentGreen,
                                borderRadius: BorderRadius.circular(9.r),
                              ),
                              alignment: Alignment.center,
                              child: Icon(
                                FlutterRemix.check_line,
                                color: AppColors.white,
                                size: 15.r,
                              ),
                            )
                          : Container(
                              width: 18.r,
                              height: 18.r,
                              decoration: BoxDecoration(
                                color: AppColors.transparent,
                                borderRadius: BorderRadius.circular(9.r),
                                border: Border.all(
                                  width: 2.r,
                                  color: state.isDarkMode
                                      ? AppColors.white
                                      : AppColors.selectedItemsText,
                                ),
                              ),
                            ),
                      10.horizontalSpace,
                      Text(
                        '${brand.title}',
                        style: GoogleFonts.k2d(
                          fontWeight: FontWeight.w500,
                          fontSize: 14.sp,
                          color: state.isDarkMode
                              ? AppColors.white
                              : AppColors.black,
                          letterSpacing: -0.7,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    '${brand.productsCount ?? 0}',
                    style: GoogleFonts.k2d(
                      fontWeight: FontWeight.w500,
                      fontSize: 14.sp,
                      color: state.isDarkMode
                          ? AppColors.shippingType
                          : AppColors.reviewText,
                      letterSpacing: -0.7,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        if (!isLast)
          Divider(
            thickness: 1.r,
            height: 1.r,
            color: state.isDarkMode
                ? AppColors.white.withOpacity(0.06)
                : AppColors.newStoreDataBorder.withOpacity(0.5),
          )
      ],
    );
  }
}
