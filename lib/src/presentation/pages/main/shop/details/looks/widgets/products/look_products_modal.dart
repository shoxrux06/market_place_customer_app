import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../../../core/constants/constants.dart';
import '../../../../../../../../core/utils/utils.dart';
import '../../../../../../../../models/models.dart';
import '../../../../../../../components/components.dart';
import '../../../../../../../theme/theme.dart';
import 'riverpod/provider/look_products_provider.dart';
import 'widgets/look_product_item.dart';

class LookProductsModal extends ConsumerStatefulWidget {
  final BannerData? look;

  const LookProductsModal({Key? key, required this.look}) : super(key: key);

  @override
  ConsumerState<LookProductsModal> createState() => _LookProductsModalState();
}

class _LookProductsModalState extends ConsumerState<LookProductsModal> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      Duration.zero,
      () {
        ref
            .read(lookProductsProvider.notifier)
            .fetchBannerProducts(context, widget.look?.id);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(lookProductsProvider);
    final notifier = ref.read(lookProductsProvider.notifier);
    final bool isDarkMode = LocalStorage.instance.getAppThemeMode();
    return AbsorbPointer(
      absorbing: state.isLoading,
      child: Padding(
        padding: REdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            11.verticalSpace,
            Container(
              width: 49.r,
              height: 3.r,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(62.r),
                color: isDarkMode
                    ? AppColors.dragElementDark
                    : AppColors.dragElement,
              ),
            ),
            Expanded(
              child: ListView(
                physics: const CustomBouncingScrollPhysics(),
                shrinkWrap: true,
                primary: true,
                children: [
                  13.verticalSpace,
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '${widget.look?.translation?.title}'.toUpperCase(),
                      style: GoogleFonts.k2d(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500,
                        color: isDarkMode ? AppColors.white : AppColors.black,
                      ),
                    ),
                  ),
                  18.verticalSpace,
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.r),
                    child: CachedNetworkImage(
                      width: double.infinity,
                      height: 370.r,
                      imageUrl:
                          '${AppConstants.imageBaseUrl}/${widget.look?.img}',
                      fit: BoxFit.cover,
                      progressIndicatorBuilder: (context, url, progress) {
                        return MakeShimmer(
                          child: Container(
                            height: 370.r,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.r),
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
                          child: Icon(
                            FlutterRemix.image_line,
                            color: AppColors.black.withOpacity(0.5),
                          ),
                        );
                      },
                    ),
                  ),
                  10.verticalSpace,
                  state.isLoading
                      ? const JumpingDots(color: AppColors.black)
                      : ListView.builder(
                          shrinkWrap: true,
                          primary: false,
                          itemCount: state.products.length,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            final product = state.products[index];
                            return LookProductItem(
                              product: product,
                              productIndex: index,
                            );
                          },
                        ),
                  26.verticalSpace,
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      AppHelpers.getTranslation(TrKeys.description)
                          .toUpperCase(),
                      style: GoogleFonts.k2d(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500,
                        color: isDarkMode ? AppColors.white : AppColors.black,
                      ),
                    ),
                  ),
                  2.verticalSpace,
                  Text(
                    widget.look?.translation?.description ?? '',
                    style: GoogleFonts.k2d(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w400,
                      letterSpacing: -0.4,
                      color: AppColors.black,
                    ),
                  ),
                  30.verticalSpace,
                  AccentLoginButton(
                    title: AppHelpers.getTranslation(TrKeys.buyAllProducts),
                    onPressed: () => notifier.buyAllProducts(context),
                  ),
                  23.verticalSpace,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
