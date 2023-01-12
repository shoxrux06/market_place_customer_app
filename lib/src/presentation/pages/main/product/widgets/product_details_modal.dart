import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../core/constants/constants.dart';
import '../../../../../core/utils/utils.dart';
import '../../../../../models/models.dart';
import '../../../../components/components.dart';
import '../../../../theme/theme.dart';
import '../riverpod/provider/product_provider.dart';

class ProductDetailsModal extends ConsumerWidget {
  const ProductDetailsModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(productProvider);
    final bool isDarkMode = LocalStorage.instance.getAppThemeMode();
    final bool isLtr = LocalStorage.instance.getLangLtr();
    return Directionality(
      textDirection: isLtr ? TextDirection.ltr : TextDirection.rtl,
      child: Padding(
        padding: REdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
          physics: const CustomBouncingScrollPhysics(),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              11.verticalSpace,
              Align(
                alignment: Alignment.center,
                child: Container(
                  width: 49.r,
                  height: 3.r,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(62.r),
                    color: isDarkMode
                        ? AppColors.dragElementDark
                        : AppColors.dragElement,
                  ),
                ),
              ),
              13.verticalSpace,
              Text(
                AppHelpers.getTranslation(TrKeys.description).toUpperCase(),
                style: GoogleFonts.k2d(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500,
                  color: isDarkMode ? AppColors.white : AppColors.black,
                ),
              ),
              20.verticalSpace,
              Text(
                '${state.product?.translation?.description}',
                style: GoogleFonts.k2d(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: isDarkMode ? AppColors.white : AppColors.black,
                  letterSpacing: -0.5,
                ),
              ),
              20.verticalSpace,
              (state.product?.properties ?? []).isNotEmpty
                  ? Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        color: isDarkMode
                            ? AppColors.mainBackDark
                            : AppColors.mainBack,
                      ),
                      padding:
                          REdgeInsets.symmetric(horizontal: 12, vertical: 22),
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: state.product?.properties?.length,
                        itemBuilder: (context, index) {
                          final Properties? property =
                              state.product?.properties?[index];
                          bool isLast =
                              (state.product?.properties?.length ?? 0) - 1 ==
                                  index;
                          return Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '${property?.key}',
                                    style: GoogleFonts.k2d(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w400,
                                      color: isDarkMode
                                          ? AppColors.white
                                          : AppColors.black,
                                      letterSpacing: -0.4,
                                    ),
                                  ),
                                  14.horizontalSpace,
                                  Expanded(
                                    child: Text(
                                      '${property?.value}',
                                      style: GoogleFonts.k2d(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w400,
                                        color: isDarkMode
                                            ? AppColors.white
                                            : AppColors.blue,
                                        letterSpacing: -0.4,
                                      ),
                                      textAlign: TextAlign.end,
                                    ),
                                  ),
                                ],
                              ),
                              17.verticalSpace,
                              if (!isLast)
                                Column(
                                  children: [
                                    Divider(
                                      color: AppColors.divider,
                                      thickness: 1.r,
                                      height: 1.r,
                                    ),
                                    16.verticalSpace,
                                  ],
                                )
                            ],
                          );
                        },
                      ),
                    )
                  : const SizedBox(),
              40.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }
}
