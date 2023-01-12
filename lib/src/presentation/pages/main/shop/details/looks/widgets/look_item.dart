import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../../core/constants/constants.dart';
import '../../../../../../../core/utils/utils.dart';
import '../../../../../../../models/models.dart';
import '../../../../../../components/components.dart';
import '../../../../../../theme/theme.dart';

class LookItem extends StatelessWidget {
  final BannerData look;
  final bool isLiking;
  final Function() onTap;
  final Function() onLikeTap;

  const LookItem({
    Key? key,
    required this.look,
    required this.isLiking,
    required this.onTap,
    required this.onLikeTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        InkWell(
          borderRadius: BorderRadius.circular(8.r),
          onTap: onTap,
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.r),
                child: CachedNetworkImage(
                  imageUrl: '${AppConstants.imageBaseUrl}/${look.img}',
                  height: 370.r,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  progressIndicatorBuilder: (context, url, progress) {
                    return MakeShimmer(
                      child: Container(
                        decoration:
                            const BoxDecoration(color: AppColors.mainBack),
                      ),
                    );
                  },
                  errorWidget: (context, url, error) {
                    return Container(
                      height: 150.r,
                      color: AppColors.white,
                      alignment: Alignment.center,
                      child: Icon(
                        FlutterRemix.image_line,
                        size: 20.r,
                        color: AppColors.black,
                      ),
                    );
                  },
                ),
              ),
              Positioned(
                bottom: 12.r,
                right: 12.r,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(61.r),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 20.r, sigmaY: 20.r),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(61.r),
                            color: AppColors.white.withOpacity(0.19),
                          ),
                          alignment: Alignment.center,
                          padding: REdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 9,
                          ),
                          child: Text(
                            '${look.products?.length ?? 0} ${AppHelpers.getTranslation(TrKeys.products).toLowerCase()}',
                            style: GoogleFonts.k2d(
                              fontWeight: FontWeight.w500,
                              fontSize: 13.sp,
                              color: AppColors.white,
                              letterSpacing: -14 * 0.01,
                            ),
                          ),
                        ),
                      ),
                    ),
                    12.horizontalSpace,
                    LikeButton(
                      likeCount: look.likes,
                      isLiking: isLiking,
                      onTap: onLikeTap,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        10.verticalSpace,
      ],
    );
  }
}
