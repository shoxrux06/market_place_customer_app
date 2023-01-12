import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/constants/constants.dart';
import '../../../../../core/utils/utils.dart';
import '../../../../components/components.dart';
import '../../../../theme/theme.dart';
import '../riverpod/provider/product_provider.dart';
import 'w_product_image_item.dart';

class WImagesProduct extends ConsumerWidget {
  const WImagesProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(productProvider);
    final notifier = ref.read(productProvider.notifier);
    final bool isDarkMode = LocalStorage.instance.getAppThemeMode();
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          height: 438.r,
          color: isDarkMode ? AppColors.dontHaveAnAccBackDark : AppColors.white,
          alignment: Alignment.topCenter,
          child: CachedNetworkImage(
            imageUrl: '${AppConstants.imageBaseUrl}/${state.activeImageUrl}',
            height: 408.r,
            width: 1.sw,
            fit: BoxFit.cover,
            progressIndicatorBuilder: (context, url, progress) {
              return MakeShimmer(
                child: Container(
                  decoration: const BoxDecoration(color: AppColors.mainBack),
                ),
              );
            },
            errorWidget: (context, url, error) {
              return Container(
                height: 438.r,
                color: AppColors.white,
                alignment: Alignment.center,
                child: const Icon(
                  FlutterRemix.image_line,
                  size: 80,
                  color: AppColors.black,
                ),
              );
            },
          ),
        ),
        Padding(
          padding: REdgeInsets.symmetric(horizontal: 15),
          child: Container(
            height: 60.r,
            decoration: BoxDecoration(
              color: isDarkMode ? AppColors.mainBackDark : AppColors.mainBack,
              borderRadius: BorderRadius.circular(8.r),
            ),
            alignment: Alignment.center,
            child: SizedBox(
              height: 42.r,
              child: ListView.builder(
                physics: const CustomBouncingScrollPhysics(),
                padding: REdgeInsets.symmetric(horizontal: 13),
                scrollDirection: Axis.horizontal,
                itemCount: state.product?.galleries?.length,
                itemBuilder: (context, index) {
                  final gallery = state.product?.galleries?[index];
                  return WProductItemImageItem(
                    url: '${gallery?.path}',
                    onTap: () =>
                        notifier.changeActiveImageUrl('${gallery?.path}'),
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
