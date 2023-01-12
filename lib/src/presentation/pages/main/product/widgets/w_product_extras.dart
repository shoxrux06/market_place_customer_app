import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../core/constants/constants.dart';
import '../../../../../core/utils/utils.dart';
import '../../../../../models/models.dart';
import '../../../../components/components.dart';
import '../../../../theme/theme.dart';
import '../riverpod/provider/product_provider.dart';
import 'product_price_widget.dart';

class WProductExtras extends ConsumerWidget {
  const WProductExtras({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(productProvider);
    final notifier = ref.read(productProvider.notifier);
    final bool isDarkMode = LocalStorage.instance.getAppThemeMode();
    return Container(
      decoration: BoxDecoration(
        color: isDarkMode ? AppColors.mainBackDark : AppColors.mainBack,
        borderRadius: BorderRadius.circular(8.r),
      ),
      padding: REdgeInsets.symmetric(horizontal: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          18.verticalSpace,
          ProductPriceWidget(selectedStock: state.selectedStock),
          16.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    FlutterRemix.star_smile_fill,
                    color: AppColors.rate,
                    size: 20.r,
                  ),
                  6.horizontalSpace,
                  Text(
                    (state.product?.ratingAvg ?? 0).toStringAsFixed(1),
                    style: GoogleFonts.k2d(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: isDarkMode ? AppColors.white : AppColors.black,
                      letterSpacing: -0.35,
                    ),
                  ),
                  4.horizontalSpace,
                  Text(
                    '(${(state.product?.reviews ?? []).length} ${AppHelpers.getTranslation(TrKeys.reviews).toLowerCase()})',
                    style: GoogleFonts.k2d(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: isDarkMode ? AppColors.white : AppColors.black,
                      letterSpacing: -0.35,
                    ),
                  )
                ],
              ),
            ],
          ),
          16.verticalSpace,
          ListView.builder(
            physics: const CustomBouncingScrollPhysics(),
            shrinkWrap: true,
            itemCount: state.typedExtras.length,
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) {
              final TypedExtra typedExtra = state.typedExtras[index];
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  color: isDarkMode
                      ? AppColors.dontHaveAnAccBackDark
                      : AppColors.white,
                ),
                padding: REdgeInsets.symmetric(horizontal: 12, vertical: 14),
                margin: REdgeInsets.only(bottom: 14),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      typedExtra.title,
                      style: GoogleFonts.k2d(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        color: isDarkMode ? AppColors.white : AppColors.black,
                        letterSpacing: -0.4,
                      ),
                    ),
                    16.verticalSpace,
                    typedExtra.type == ExtrasType.text
                        ? TextExtras(
                            uiExtras: typedExtra.uiExtras,
                            groupIndex: typedExtra.groupIndex,
                            onUpdate: (uiExtra) {
                              notifier.updateSelectedIndexes(
                                context,
                                typedExtra.groupIndex,
                                uiExtra.index,
                              );
                            },
                          )
                        : typedExtra.type == ExtrasType.color
                            ? ColorExtras(
                                uiExtras: typedExtra.uiExtras,
                                groupIndex: typedExtra.groupIndex,
                                onUpdate: (uiExtra) {
                                  notifier.updateSelectedIndexes(
                                    context,
                                    typedExtra.groupIndex,
                                    uiExtra.index,
                                  );
                                },
                              )
                            : typedExtra.type == ExtrasType.image
                                ? ImageExtras(
                                    uiExtras: typedExtra.uiExtras,
                                    groupIndex: typedExtra.groupIndex,
                                    updateImage: notifier.changeActiveImageUrl,
                                    onUpdate: (uiExtra) {
                                      notifier.updateSelectedIndexes(
                                        context,
                                        typedExtra.groupIndex,
                                        uiExtra.index,
                                      );
                                    },
                                  )
                                : const SizedBox(),
                  ],
                ),
              );
            },
          ),
          10.verticalSpace,
          Row(
            children: [
              SvgPicture.asset(
                AppAssets.svgIcCertificateCheck,
                color: isDarkMode ? AppColors.white : AppColors.black,
                width: 18.r,
                height: 18.r,
              ),
              7.horizontalSpace,
              Text(
                '${(state.selectedStock?.quantity != null && ((state.selectedStock?.quantity)! > 0)) ? '${state.selectedStock?.quantity} ${AppHelpers.getTranslation(TrKeys.searchIn).toLowerCase()}' : AppHelpers.getTranslation(TrKeys.outOf)} ${AppHelpers.getTranslation(TrKeys.stock).toLowerCase()}',
                style: GoogleFonts.k2d(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w500,
                  color: isDarkMode ? AppColors.white : AppColors.black,
                  decoration: TextDecoration.underline,
                  decorationColor: AppColors.accentGreen,
                  decorationThickness: 3,
                ),
              ),
            ],
          ),
          22.verticalSpace,
        ],
      ),
    );
  }
}
