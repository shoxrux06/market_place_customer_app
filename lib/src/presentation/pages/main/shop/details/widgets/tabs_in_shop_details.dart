import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../core/routes/app_router.gr.dart';
import '../../../../../../core/utils/utils.dart';
import '../../../../../components/components.dart';
import '../../../../../theme/theme.dart';
import '../riverpod/provider/shop_details_provider.dart';

class TabsInShopDetails extends ConsumerWidget {
  const TabsInShopDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(shopDetailsProvider);
    final notifier = ref.read(shopDetailsProvider.notifier);
    final bool isDarkMode = LocalStorage.instance.getAppThemeMode();
    return state.isCategoriesLoading
        ? Container(
            color:
                isDarkMode ? AppColors.dontHaveAnAccBackDark : AppColors.white,
            height: 54.r,
            child: JumpingDots(
              radius: 6,
              color: isDarkMode ? AppColors.white : AppColors.black,
            ),
          )
        : state.categories.isNotEmpty
            ? Container(
                color: isDarkMode
                    ? AppColors.dontHaveAnAccBackDark
                    : AppColors.white,
                height: 54.r,
                child: Row(
                  children: [
                    SizedBox(
                      height: 54.r,
                      child: PopupMenuButton<int>(
                        initialValue: state.selectedCategory?.id,
                        elevation: 0,
                        color: isDarkMode
                            ? AppColors.dontHaveAnAccBackDark
                            : AppColors.white,
                        child: Container(
                          height: 54.r,
                          padding: REdgeInsets.only(
                            left: 15,
                            right: 5,
                          ),
                          decoration: const BoxDecoration(
                            color: AppColors.black,
                          ),
                          child: Row(
                            children: [
                              Text(
                                '${state.selectedCategory?.translation?.title}',
                                style: GoogleFonts.k2d(
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.white,
                                  letterSpacing: -14 * 0.01,
                                ),
                              ),
                              15.horizontalSpace,
                              Icon(
                                FlutterRemix.arrow_down_s_line,
                                color: AppColors.white,
                                size: 18.r,
                              ),
                            ],
                          ),
                        ),
                        itemBuilder: (context) {
                          return state.categories
                              .map(
                                (category) => PopupMenuItem<int>(
                                  value: category.id,
                                  child: Text(
                                    '${category.translation?.title}',
                                    style: GoogleFonts.k2d(
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              )
                              .toList();
                        },
                        onSelected: (value) =>
                            notifier.setSelectedCategory(value),
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: state.subCategories.length,
                        shrinkWrap: true,
                        physics: const CustomBouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          final category = state.subCategories[index];
                          return ForgotTextButton(
                            title: '${category.translation?.title}',
                            fontColor:
                                isDarkMode ? AppColors.white : AppColors.black,
                            onPressed: () {
                              context.pushRoute(
                                CategoryProductsRoute(
                                  id: category.id ?? 0,
                                  title: '${category.translation?.title}',
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              )
            : const SizedBox();
  }
}
