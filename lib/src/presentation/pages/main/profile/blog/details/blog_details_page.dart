import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../core/utils/utils.dart';
import '../../../../../components/components.dart';
import '../../../../../theme/theme.dart';
import 'riverpod/provider/blog_details_provider.dart';

class BlogDetailsPage extends ConsumerStatefulWidget {
  final String uuid;
  final String title;

  const BlogDetailsPage({
    Key? key,
    required this.uuid,
    required this.title,
  }) : super(key: key);

  @override
  ConsumerState<BlogDetailsPage> createState() => _BlogDetailsPageState();
}

class _BlogDetailsPageState extends ConsumerState<BlogDetailsPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      Duration.zero,
      () {
        ref
            .read(blogDetailsProvider.notifier)
            .fetchBlogDetails(context, widget.uuid);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(blogDetailsProvider);
    final bool isDarkMode = LocalStorage.instance.getAppThemeMode();
    final bool isLtr = LocalStorage.instance.getLangLtr();
    return Directionality(
      textDirection: isLtr ? TextDirection.ltr : TextDirection.rtl,
      child: Scaffold(
        backgroundColor:
            isDarkMode ? AppColors.mainBackDark : AppColors.mainBack,
        appBar: CommonAppBar(
          title: widget.title,
          onLeadingPressed: context.popRoute,
        ),
        body: state.isLoading
            ? JumpingDots(color: isDarkMode ? AppColors.white : AppColors.black)
            : SingleChildScrollView(
                physics: const CustomBouncingScrollPhysics(),
                child: Column(
                  children: [
                    16.verticalSpace,
                    Container(
                      color: isDarkMode
                          ? AppColors.dontHaveAnAccBackDark
                          : AppColors.white,
                      width: 1.sw,
                      padding: REdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          20.verticalSpace,
                          Text(
                            '${state.blogDetails?.data?.translation?.title}',
                            style: GoogleFonts.k2d(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              letterSpacing: -14 * 0.02,
                              color: isDarkMode
                                  ? AppColors.white
                                  : AppColors.black,
                            ),
                          ),
                          24.verticalSpace,
                          Text(
                            '${state.blogDetails?.data?.createdAt?.substring(0, 10)}',
                            style: GoogleFonts.k2d(
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w400,
                              letterSpacing: -14 * 0.02,
                              color: isDarkMode
                                  ? AppColors.white
                                  : AppColors.black,
                            ),
                          ),
                          34.verticalSpace,
                          CommonImage(
                            imageUrl: state.blogDetails?.data?.img,
                            height: 236,
                            width: double.infinity,
                          ),
                          17.verticalSpace,
                          Html(
                            data:
                                '${state.blogDetails?.data?.translation?.description}',
                          ),
                          17.verticalSpace,
                        ],
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
