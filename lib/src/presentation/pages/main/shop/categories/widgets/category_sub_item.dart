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

class CategorySubItem extends StatelessWidget {
  final List<CategoryData> categories;

  const CategorySubItem({Key? key, required this.categories}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = LocalStorage.instance.getAppThemeMode();
    return categories.isNotEmpty
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: categories.map((category) {
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
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                    margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 4),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Text(
                        '${category.translation?.title}',
                        maxLines: 2,
                        textAlign: TextAlign.start,
                        style: GoogleFonts.k2d(
                          fontWeight: FontWeight.w500,
                          fontSize: 12.sp,
                          color: isDarkMode ? AppColors.white : AppColors.black,
                          letterSpacing: -0.4,
                        ),
                      ),
                    ),
                  )
                ),
              );
            }).toList(),
          )
        : Container();
  }
}
