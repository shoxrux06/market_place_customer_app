import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../core/constants/constants.dart';
import '../../../../../../core/routes/app_router.gr.dart';
import '../../../../../../core/utils/utils.dart';
import '../../../../../../models/models.dart';
import '../../../../../components/components.dart';
import '../../../../../theme/theme.dart';

class CategoryTabBody extends StatelessWidget {
  final List<CategoryData> categories;

  const CategoryTabBody({Key? key, required this.categories}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = LocalStorage.instance.getAppThemeMode();
    return categories.isNotEmpty
        ? GridView.builder(
            shrinkWrap: true,
            primary: false,
            itemCount: categories.length,
            physics: const CustomBouncingScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 109 / 134,
              mainAxisSpacing: 9.r,
              crossAxisSpacing: 9.r,
              crossAxisCount: 3,
            ),
            padding: REdgeInsets.only(left: 15, right: 15, bottom: 80),
            itemBuilder: (context, index) {
              final category = categories[index];
              return Material(
                color: isDarkMode ? AppColors.mainBackDark : AppColors.white,
                borderRadius: BorderRadius.circular(10.r),
                child: InkWell(
                  borderRadius: BorderRadius.circular(10.r),
                  onTap: () => context.pushRoute(
                    CategoryProductsRoute(
                      id: category.id ?? 0,
                      title: '${category.translation?.title}',
                    ),
                  ),
                  child: Container(
                    height: 134.r,
                    width: 109.r,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    padding: REdgeInsets.symmetric(
                      horizontal: 6.r,
                      vertical: 10.r,
                    ),
                    child: Column(
                      children: [
                        CommonImage(
                          imageUrl: category.img,
                          width: double.infinity,
                          height: 76,
                          radius: 10,
                        ),
                        13.verticalSpace,
                        Divider(
                          thickness: 1.r,
                          height: 0.r,
                          color: AppColors.mainBack,
                        ),
                        10.verticalSpace,
                        Expanded(
                          child: Text(
                            '${category.translation?.title}',
                            maxLines: 2,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.k2d(
                              fontWeight: FontWeight.w500,
                              fontSize: 12.sp,
                              color: isDarkMode
                                  ? AppColors.white
                                  : AppColors.black,
                              letterSpacing: -0.4,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          )
        : Column(
            children: [
              Container(
                width: 168.r,
                height: 168.r,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  color:
                      isDarkMode ? AppColors.mainBackDark : AppColors.mainBack,
                ),
                alignment: Alignment.center,
                child: Image.asset(
                  AppAssets.pngNoSearchResult,
                  width: 79.r,
                  height: 144.r,
                  fit: BoxFit.cover,
                ),
              ),
              14.verticalSpace,
              Text(
                AppHelpers.getTranslation(TrKeys.noSubCategoryItems),
                style: GoogleFonts.k2d(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  letterSpacing: -14 * 0.02,
                  color: isDarkMode ? AppColors.white : AppColors.black,
                ),
              ),
            ],
          );
  }
}
