import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../core/constants/constants.dart';
import '../../../../../core/utils/utils.dart';
import '../../../../components/components.dart';
import '../../../../theme/theme.dart';
import 'riverpod/provider/blogs_provider.dart';
import 'widgets/blog_item.dart';

class BlogPage extends ConsumerStatefulWidget {
  const BlogPage({Key? key}) : super(key: key);

  @override
  ConsumerState<BlogPage> createState() => _BlogPageState();
}

class _BlogPageState extends ConsumerState<BlogPage> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    Future.delayed(
      Duration.zero,
      () {
        ref.read(blogsProvider.notifier).fetchBlogs(context);
      },
    );
    _scrollController = ScrollController();
    _scrollController.addListener(
      () {
        if (_scrollController.position.maxScrollExtent ==
            _scrollController.position.pixels) {
          ref.read(blogsProvider.notifier).fetchBlogs(context);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(blogsProvider);
    final bool isDarkMode = LocalStorage.instance.getAppThemeMode();
    final bool isLtr = LocalStorage.instance.getLangLtr();
    return Directionality(
      textDirection: isLtr ? TextDirection.ltr : TextDirection.rtl,
      child: Scaffold(
        backgroundColor:
            isDarkMode ? AppColors.dontHaveAnAccBackDark : AppColors.mainBack,
        appBar: CommonAppBar(
          title: AppHelpers.getTranslation(TrKeys.blogs),
          onLeadingPressed: () => context.popRoute(),
        ),
        body: state.isLoading
            ? const ProductHorizontalListShimmer(
                height: 271,
                spacing: 10,
                verticalPadding: 15,
                horizontalPadding: 15,
              )
            : state.blogs.isNotEmpty
                ? ListView.builder(
                    itemCount: state.blogs.length,
                    shrinkWrap: true,
                    physics: const CustomBouncingScrollPhysics(),
                    padding: REdgeInsets.all(15),
                    itemBuilder: (context, index) {
                      final blog = state.blogs[index];
                      return BlogItem(blog: blog);
                    },
                  )
                : Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: 142.r,
                          height: 142.r,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.r),
                            color: isDarkMode
                                ? AppColors.mainBackDark
                                : AppColors.white,
                          ),
                          alignment: Alignment.center,
                          child: Image.asset(
                            AppAssets.pngNoViewedProducts,
                            width: 87.r,
                            height: 60.r,
                            fit: BoxFit.cover,
                          ),
                        ),
                        14.verticalSpace,
                        Text(
                          '${AppHelpers.getTranslation(TrKeys.thereAreNoItemsInThe)} ${AppHelpers.getTranslation(TrKeys.blogs).toLowerCase()}',
                          style: GoogleFonts.k2d(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                            letterSpacing: -14 * 0.02,
                            color:
                                isDarkMode ? AppColors.white : AppColors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
      ),
    );
  }
}
