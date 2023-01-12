import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../core/constants/constants.dart';
import '../../../../../core/routes/app_router.gr.dart';
import '../../../../../core/utils/utils.dart';
import '../../../../components/components.dart';
import '../../../../theme/theme.dart';
import '../riverpod/provider/product_provider.dart';
import 'select_review_image_button.dart';
import 'w_review_item.dart';

class ProductReviewsModal extends ConsumerWidget {
  const ProductReviewsModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(productProvider);
    final notifier = ref.read(productProvider.notifier);
    final bool isDarkMode = LocalStorage.instance.getAppThemeMode();
    final bool isLtr = LocalStorage.instance.getLangLtr();
    return Directionality(
      textDirection: isLtr ? TextDirection.ltr : TextDirection.rtl,
      child: AbsorbPointer(
        absorbing: state.isReviewing,
        child: KeyboardDismisser(
          child: AnimatedPadding(
            padding: REdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            duration: Duration.zero,
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
                      children: [
                        13.verticalSpace,
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            AppHelpers.getTranslation(TrKeys.reviews)
                                .toUpperCase(),
                            style: GoogleFonts.k2d(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w500,
                              color: isDarkMode
                                  ? AppColors.white
                                  : AppColors.black,
                            ),
                          ),
                        ),
                        10.verticalSpace,
                        ListView.builder(
                          shrinkWrap: true,
                          primary: false,
                          itemCount: state.reviews.length,
                          itemBuilder: (context, index) {
                            final review = state.reviews[index];
                            return WReviewItem(review: review);
                          },
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: REdgeInsets.symmetric(vertical: 20),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          height: 50.r,
                          decoration: BoxDecoration(
                            color: isDarkMode
                                ? AppColors.mainBackDark
                                : AppColors.dontHaveAccBtnBack,
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          alignment: Alignment.center,
                          padding: REdgeInsets.symmetric(
                            horizontal: 15,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              RatingBar.builder(
                                itemBuilder: (context, index) {
                                  return Icon(
                                    FlutterRemix.star_smile_fill,
                                    color: AppColors.starColor,
                                    size: 26.r,
                                  );
                                },
                                onRatingUpdate: notifier.setRating,
                                maxRating: 5,
                                minRating: 1,
                                initialRating: 4,
                                itemSize: 26.r,
                                itemPadding: REdgeInsets.only(right: 20),
                                unratedColor: isDarkMode
                                    ? AppColors.dontHaveAnAccBackDark
                                    : AppColors.black.withOpacity(0.2),
                                glow: false,
                              ),
                              Text(
                                '${state.rating}',
                                style: GoogleFonts.k2d(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                  color: isDarkMode
                                      ? AppColors.white
                                      : AppColors.black,
                                  letterSpacing: -0.7,
                                ),
                              ),
                            ],
                          ),
                        ),
                        10.verticalSpace,
                        Row(
                          children: [
                            SelectReviewImageButton(
                              onChangePhoto: notifier.setReviewFile,
                              file: state.reviewFile,
                            ),
                            6.horizontalSpace,
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.r),
                                  border: Border.all(
                                    color: isDarkMode
                                        ? AppColors.borderDark
                                        : AppColors.attachmentBorder,
                                    width: 1.r,
                                  ),
                                ),
                                alignment: Alignment.center,
                                padding: EdgeInsetsDirectional.only(start: 12.r),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: TextFormField(
                                        onChanged: notifier.setReviewText,
                                        cursorColor: isDarkMode
                                            ? AppColors.white
                                            : AppColors.black,
                                        cursorWidth: 1.r,
                                        style: GoogleFonts.k2d(
                                          fontSize: 13.sp,
                                          fontWeight: FontWeight.w400,
                                          color: isDarkMode
                                              ? AppColors.white
                                              : AppColors.black,
                                          letterSpacing: -14 * 0.01,
                                        ),
                                        decoration: InputDecoration.collapsed(
                                          hintStyle: GoogleFonts.k2d(
                                            fontSize: 13.sp,
                                            fontWeight: FontWeight.w400,
                                            color: AppColors.hintColor,
                                            letterSpacing: -14 * 0.01,
                                          ),
                                          hintText: AppHelpers.getTranslation(
                                              TrKeys.addComment),
                                        ),
                                      ),
                                    ),
                                    IconButton(
                                      splashRadius: 20.r,
                                      onPressed: () {
                                        if (LocalStorage.instance
                                            .getToken()
                                            .isEmpty) {
                                          LocalStorage.instance.deleteToken();
                                          AppHelpers.showCheckFlash(
                                            context,
                                            AppHelpers.getTranslation(
                                                TrKeys.youNeedToLoginFirst),
                                          );
                                          context
                                              .replaceRoute(const LoginRoute());
                                          return;
                                        }
                                        notifier.addReview(context);
                                      },
                                      icon: state.isReviewing
                                          ? SizedBox(
                                              width: 16.r,
                                              height: 16.r,
                                              child: CircularProgressIndicator(
                                                strokeWidth: 1.r,
                                                color: isDarkMode
                                                    ? AppColors.white
                                                    : AppColors.black,
                                              ),
                                            )
                                          : RotatedBox(
                                              quarterTurns: isLtr ? 0 : 2,
                                              child: Icon(
                                                FlutterRemix.send_plane_2_fill,
                                                size: 22.r,
                                                color: isDarkMode
                                                    ? AppColors.white
                                                    : AppColors.black,
                                              ),
                                            ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
