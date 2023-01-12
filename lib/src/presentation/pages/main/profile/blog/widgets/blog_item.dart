import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../core/routes/app_router.gr.dart';
import '../../../../../../core/utils/utils.dart';
import '../../../../../../models/models.dart';
import '../../../../../components/components.dart';
import '../../../../../theme/theme.dart';

class BlogItem extends StatelessWidget {
  final BlogData blog;

  const BlogItem({Key? key, required this.blog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = LocalStorage.instance.getAppThemeMode();
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Material(
          borderRadius: BorderRadius.circular(8.r),
          color: isDarkMode ? AppColors.mainBackDark : AppColors.white,
          child: InkWell(
            borderRadius: BorderRadius.circular(8.r),
            onTap: () => context.pushRoute(
              BlogDetailsRoute(
                uuid: blog.uuid ?? '',
                title: blog.translation?.title ?? '',
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
              ),
              width: double.infinity,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8.r),
                      topRight: Radius.circular(8.r),
                    ),
                    child: CommonImage(
                      imageUrl: blog.img,
                      height: 150,
                      width: double.infinity,
                      radius: 0,
                    ),
                  ),
                  Padding(
                    padding: REdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        18.verticalSpace,
                        Text(
                          '${blog.translation?.title}',
                          style: GoogleFonts.k2d(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w500,
                            color:
                                isDarkMode ? AppColors.white : AppColors.black,
                            letterSpacing: -14 * 0.01,
                          ),
                        ),
                        4.verticalSpace,
                        Text(
                          blog.translation?.shortDesc ?? '',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.k2d(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w400,
                            color:
                                isDarkMode ? AppColors.white : AppColors.black,
                            letterSpacing: -14 * 0.01,
                          ),
                        ),
                        13.verticalSpace,
                        Text(
                          '${blog.createdAt?.substring(0, 10)}',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.k2d(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w400,
                            color:
                                isDarkMode ? AppColors.white : AppColors.black,
                            letterSpacing: -14 * 0.01,
                          ),
                        ),
                        16.verticalSpace,
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        10.verticalSpace,
      ],
    );
  }
}
