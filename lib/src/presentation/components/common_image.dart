import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/constants/constants.dart';
import '../theme/theme.dart';
import 'shimmers/make_shimmer.dart';

class CommonImage extends StatelessWidget {
  final String? imageUrl;
  final double? width;
  final double? height;
  final double radius;

  const CommonImage({
    Key? key,
    required this.imageUrl,
    this.width,
    this.height,
    this.radius = 8,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius.r),
      child: CachedNetworkImage(
        imageUrl: '${AppConstants.imageBaseUrl}/$imageUrl',
        width: width,
        height: height,
        fit: BoxFit.cover,
        progressIndicatorBuilder: (context, url, progress) {
          return MakeShimmer(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(radius.r),
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
              color: AppColors.black.withOpacity(0.5),
              size: 20.r,
            ),
          );
        },
      ),
    );
  }
}
