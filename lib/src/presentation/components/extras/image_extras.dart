import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constants/constants.dart';
import '../../../models/models.dart';
import '../../theme/theme.dart';
import '../shimmers/make_shimmer.dart';

class ImageExtras extends StatelessWidget {
  final int groupIndex;
  final List<UiExtra> uiExtras;
  final Function(UiExtra) onUpdate;
  final Function(String) updateImage;

  const ImageExtras({
    Key? key,
    required this.groupIndex,
    required this.uiExtras,
    required this.onUpdate,
    required this.updateImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8.r,
      runSpacing: 10.r,
      children: uiExtras
          .map(
            (uiExtra) => Material(
              borderRadius: BorderRadius.circular(21.r),
              child: InkWell(
                borderRadius: BorderRadius.circular(21.r),
                onTap: () {
                  updateImage(uiExtra.value);
                  if (uiExtra.isSelected) {
                    return;
                  }
                  onUpdate(uiExtra);
                },
                child: Container(
                  width: 42.r,
                  height: 42.r,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(21.r),
                  ),
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(21.r),
                        child: CachedNetworkImage(
                          imageUrl:
                              '${AppConstants.imageBaseUrl}/${uiExtra.value}',
                          width: 42.r,
                          height: 42.r,
                          fit: BoxFit.cover,
                          progressIndicatorBuilder: (context, url, progress) {
                            return MakeShimmer(
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(21.r),
                                  color: AppColors.mainBack,
                                ),
                              ),
                            );
                          },
                          errorWidget: (context, url, error) {
                            return Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.r),
                                color: AppColors.mainBack,
                              ),
                              alignment: Alignment.center,
                              child: const Icon(
                                FlutterRemix.image_line,
                                color: AppColors.black,
                              ),
                            );
                          },
                        ),
                      ),
                      if (uiExtra.isSelected)
                        Align(
                          alignment: Alignment.center,
                          child: Container(
                            width: 22.r,
                            height: 22.r,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(11.r),
                              color: AppColors.accentGreen,
                              border: Border.all(
                                color: AppColors.white,
                                width: 8.r,
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}
