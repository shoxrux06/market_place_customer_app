import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constants/constants.dart';
import '../../../core/routes/app_router.gr.dart';
import '../../../models/models.dart';
import '../../theme/theme.dart';
import '../shimmers/make_shimmer.dart';

class BrandItem extends StatelessWidget {
  final BrandData brand;

  const BrandItem({Key? key, required this.brand}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Material(
          color: AppColors.mainBack,
          borderRadius: BorderRadius.circular(8.r),
          child: InkWell(
            borderRadius: BorderRadius.circular(8.r),
            onTap: () => context.pushRoute(
              BrandDetailsRoute(id: brand.id ?? 0),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.r),
              child: CachedNetworkImage(
                imageUrl: '${AppConstants.imageBaseUrl}/${brand.img}',
                width: 132.r,
                height: 132.r,
                fit: BoxFit.cover,
                progressIndicatorBuilder: (context, url, progress) {
                  return MakeShimmer(
                    child: Container(
                      width: 132.r,
                      height: 132.r,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        color: AppColors.white,
                      ),
                    ),
                  );
                },
                errorWidget: (context, url, error) {
                  return Container(
                    height: 132.r,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.r),
                      color: AppColors.mainBack,
                    ),
                    alignment: Alignment.center,
                    child: Icon(
                      FlutterRemix.image_line,
                      size: 40.r,
                      color: AppColors.black.withOpacity(0.4),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
        9.horizontalSpace,
      ],
    );
  }
}
