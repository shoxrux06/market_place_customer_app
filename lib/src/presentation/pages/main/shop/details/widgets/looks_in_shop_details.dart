import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../core/constants/constants.dart';
import '../../../../../../core/utils/utils.dart';
import '../../../../../components/components.dart';
import '../../../../../theme/theme.dart';
import '../looks/widgets/products/look_products_modal.dart';
import '../riverpod/provider/shop_details_provider.dart';

class LooksInShopDetails extends ConsumerWidget {
  final Function() onSeeAllPressed;

  const LooksInShopDetails({
    Key? key,
    required this.onSeeAllPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(shopDetailsProvider);
    final notifier = ref.read(shopDetailsProvider.notifier);
    final bool isDarkMode = LocalStorage.instance.getAppThemeMode();
    return state.isLooksLoading
        ? Container(
            height: 250.r,
            color:
                isDarkMode ? AppColors.dontHaveAnAccBackDark : AppColors.white,
            child: Center(
              child: JumpingDots(
                color: isDarkMode ? AppColors.white : AppColors.black,
              ),
            ),
          )
        : state.looks.isEmpty
            ? const SizedBox()
            : Container(
                color: isDarkMode
                    ? AppColors.dontHaveAnAccBackDark
                    : AppColors.white,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    18.verticalSpace,
                    Padding(
                      padding: REdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            AppHelpers.getTranslation(TrKeys.looks),
                            style: GoogleFonts.k2d(
                              fontWeight: FontWeight.w500,
                              fontSize: 18.sp,
                              color: isDarkMode
                                  ? AppColors.white
                                  : AppColors.black,
                              letterSpacing: -14 * 0.02,
                            ),
                          ),
                          ForgotTextButton(
                            title: AppHelpers.getTranslation(TrKeys.seeAll),
                            fontSize: 12.sp,
                            fontColor:
                                isDarkMode ? AppColors.white : AppColors.black,
                            onPressed: onSeeAllPressed,
                          ),
                        ],
                      ),
                    ),
                    20.verticalSpace,
                    Container(
                      width: 1.sw,
                      height: 437.r,
                      padding: REdgeInsets.symmetric(horizontal: 15),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.r),
                        child: Image.asset(
                          AppAssets.pngLookMobile,
                          height: 437.r,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    9.verticalSpace,
                    GridView.builder(
                      shrinkWrap: true,
                      primary: false,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: state.looks.length,
                      padding: REdgeInsets.symmetric(horizontal: 15),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 168 / 220,
                        mainAxisSpacing: 9.r,
                        crossAxisSpacing: 9.r,
                        crossAxisCount: 2,
                      ),
                      itemBuilder: (context, index) {
                        final look = state.looks[index];
                        final isLiking = state.lookLikes[index].isLiking;
                        return InkWell(
                          onTap: () {
                            AppHelpers.showCustomModalBottomSheet(
                              context: context,
                              modal: LookProductsModal(look: look),
                              isDarkMode: isDarkMode,
                              paddingTop: 140,
                            );
                          },
                          child: Stack(
                            fit: StackFit.expand,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8.r),
                                child: CachedNetworkImage(
                                  width: double.infinity,
                                  height: 220.r,
                                  imageUrl:
                                      '${AppConstants.imageBaseUrl}/${look.img}',
                                  fit: BoxFit.cover,
                                  progressIndicatorBuilder:
                                      (context, url, progress) {
                                    return MakeShimmer(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8.r),
                                          color: AppColors.mainBack,
                                        ),
                                      ),
                                    );
                                  },
                                  errorWidget: (context, url, error) {
                                    return Container(
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(8.r),
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
                              Positioned(
                                bottom: 12.r,
                                right: 12.r,
                                child: LikeButton(
                                  likeCount: look.likes,
                                  isLiking: isLiking,
                                  onTap: () {
                                    notifier.likeLook(
                                      index,
                                      checkYourNetwork: () {
                                        AppHelpers.showCheckFlash(
                                          context,
                                          AppHelpers.getTranslation(TrKeys
                                              .checkYourNetworkConnection),
                                        );
                                      },
                                      youNeedToLoginFirst: () {
                                        AppHelpers.showCheckFlash(
                                          context,
                                          AppHelpers.getTranslation(
                                              TrKeys.youNeedToLoginFirst),
                                        );
                                      },
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                    20.verticalSpace,
                  ],
                ),
              );
  }
}
