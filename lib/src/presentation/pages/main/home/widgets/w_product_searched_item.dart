import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/constants/constants.dart';
import '../../../../../models/models.dart';
import '../../../../components/components.dart';
import '../../../../theme/theme.dart';

class WProductSearchedItem extends StatelessWidget {
  final ProductData product;
  final Function() onTap;

  const WProductSearchedItem({
    Key? key,
    required this.product,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Material(
          borderRadius: BorderRadius.circular(8.r),
          color: AppColors.borderColor,
          child: InkWell(
            borderRadius: BorderRadius.circular(8.r),
            onTap: onTap,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.r),
              child: CachedNetworkImage(
                width: 228.r,
                height: 260.r,
                fit: BoxFit.cover,
                imageUrl: '${AppConstants.imageBaseUrl}/${product.img}',
                progressIndicatorBuilder: (context, url, progress) {
                  return MakeShimmer(
                    child: Container(
                      width: 228.r,
                      height: 260.r,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        color: AppColors.white,
                      ),
                    ),
                  );
                },
                errorWidget: (context, url, error) {
                  return Container(
                    width: 228.r,
                    height: 260.r,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    alignment: Alignment.center,
                    padding: REdgeInsets.all(12),
                    child: Icon(FlutterRemix.image_line, size: 40.r),
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
