import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../core/constants/constants.dart';
import '../../../../../core/utils/utils.dart';
import '../../../../../models/models.dart';
import '../../../../components/components.dart';
import '../../../../theme/theme.dart';

class WReviewItem extends StatelessWidget {
  final ReviewData review;

  const WReviewItem({Key? key, required this.review}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = LocalStorage.instance.getAppThemeMode();
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        color:
            isDarkMode ? AppColors.mainBackDark : AppColors.dontHaveAccBtnBack,
      ),
      padding: REdgeInsets.symmetric(vertical: 16, horizontal: 12),
      margin: REdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '${review.user?.firstname} ${review.user?.lastname}',
                    style: GoogleFonts.k2d(
                      fontWeight: FontWeight.w500,
                      fontSize: 15.sp,
                      color: isDarkMode ? AppColors.white : AppColors.black,
                      letterSpacing: -0.3,
                    ),
                  ),
                  3.verticalSpace,
                  Text(
                    '${review.createdAt?.substring(0, 16)}',
                    style: GoogleFonts.k2d(
                      fontWeight: FontWeight.w500,
                      fontSize: 13.sp,
                      color: isDarkMode ? AppColors.white : AppColors.black,
                      letterSpacing: -0.3,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(
                    FlutterRemix.star_smile_fill,
                    color: AppColors.starColor,
                    size: 16.r,
                  ),
                  6.horizontalSpace,
                  Text(
                    '${review.rating}',
                    style: GoogleFonts.k2d(
                      fontWeight: FontWeight.w500,
                      fontSize: 13.sp,
                      color: isDarkMode ? AppColors.white : AppColors.black,
                      letterSpacing: -0.35,
                    ),
                  ),
                ],
              ),
            ],
          ),
          20.verticalSpace,
          if (review.galleries != null && review.galleries!.isNotEmpty)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 66.r,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: review.galleries?.length,
                    itemBuilder: (context, index) {
                      final gallery = review.galleries?[index];
                      return Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10.r),
                            child: CachedNetworkImage(
                              imageUrl:
                                  '${AppConstants.imageBaseUrl}/${gallery?.path}',
                              height: 66.r,
                              width: 66.r,
                              fit: BoxFit.cover,
                              progressIndicatorBuilder:
                                  (context, url, progress) {
                                return MakeShimmer(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.r),
                                      color: AppColors.mainBack,
                                    ),
                                  ),
                                );
                              },
                              errorWidget: (context, url, error) {
                                return Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.r),
                                    color: AppColors.mainBack,
                                  ),
                                  alignment: Alignment.center,
                                  child: Icon(
                                    FlutterRemix.image_line,
                                    color: AppColors.black.withOpacity(0.4),
                                    size: 20.r,
                                  ),
                                );
                              },
                            ),
                          ),
                          10.horizontalSpace,
                        ],
                      );
                    },
                  ),
                ),
                10.verticalSpace,
              ],
            ),
          Text(
            '${review.comment}',
            style: GoogleFonts.k2d(
              fontWeight: FontWeight.w400,
              fontSize: 14.sp,
              color: isDarkMode ? AppColors.white : AppColors.reviewText,
              letterSpacing: -0.5,
            ),
          ),
        ],
      ),
    );
  }
}
