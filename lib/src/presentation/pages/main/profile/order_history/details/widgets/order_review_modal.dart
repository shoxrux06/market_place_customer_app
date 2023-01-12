import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../../core/constants/constants.dart';
import '../../../../../../../core/utils/utils.dart';
import '../../../../../../components/components.dart';
import '../../../../../../theme/theme.dart';
import '../riverpod/provider/order_details_provider.dart';

class OrderReviewModal extends ConsumerWidget {
  const OrderReviewModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(orderDetailsProvider.notifier);
    final state = ref.watch(orderDetailsProvider);
    return AbsorbPointer(
      absorbing: state.isReviewing,
      child: KeyboardDismisser(
        child: AnimatedPadding(
          padding: REdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          duration: const Duration(milliseconds: 150),
          child: Material(
            color: AppColors.white,
            child: Container(
              padding: REdgeInsets.symmetric(vertical: 20, horizontal: 15),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    height: 50.r,
                    decoration: BoxDecoration(
                      color: AppColors.dontHaveAccBtnBack,
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
                          onRatingUpdate: (rating) {
                            notifier.setRating(rating);
                          },
                          maxRating: 5,
                          minRating: 1,
                          initialRating: 4,
                          itemSize: 26.r,
                          itemPadding: REdgeInsets.only(right: 20),
                          unratedColor: AppColors.black.withOpacity(0.2),
                          glow: false,
                        ),
                        Text(
                          '${state.rating}',
                          style: GoogleFonts.k2d(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColors.black,
                            letterSpacing: -0.7,
                          ),
                        ),
                      ],
                    ),
                  ),
                  10.verticalSpace,
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            border: Border.all(
                              color: AppColors.attachmentBorder,
                              width: 1.r,
                            ),
                          ),
                          alignment: Alignment.center,
                          padding: REdgeInsets.only(left: 12),
                          child: Row(
                            children: [
                              Expanded(
                                child: TextFormField(
                                  onChanged: notifier.setReviewText,
                                  cursorColor: AppColors.black,
                                  cursorWidth: 1.r,
                                  style: GoogleFonts.k2d(
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.black,
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
                                      TrKeys.addComment,
                                    ),
                                  ),
                                ),
                              ),
                              IconButton(
                                splashRadius: 20.r,
                                onPressed: () => notifier.addReview(context),
                                icon: state.isReviewing
                                    ? SizedBox(
                                        width: 16.r,
                                        height: 16.r,
                                        child: CircularProgressIndicator(
                                          strokeWidth: 1.r,
                                          color: AppColors.black,
                                        ),
                                      )
                                    : Icon(
                                        FlutterRemix.send_plane_2_fill,
                                        size: 22.r,
                                        color: AppColors.black,
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
          ),
        ),
      ),
    );
  }
}
