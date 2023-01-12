import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../../../../../core/constants/constants.dart';
import '../../../../../../core/utils/utils.dart';
import '../../../../../components/components.dart';
import '../../../../../theme/theme.dart';
import 'riverpod/provider/banner_details_provider.dart';
import 'widgets/banner_details_body.dart';
import 'widgets/banner_products_search_filter_modal.dart';

class BannerDetailsPage extends ConsumerStatefulWidget {
  final int? id;
  final String? imageUrl;

  const BannerDetailsPage({Key? key, this.id, this.imageUrl}) : super(key: key);

  @override
  ConsumerState<BannerDetailsPage> createState() => _BannerDetailsPageState();
}

class _BannerDetailsPageState extends ConsumerState<BannerDetailsPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      Duration.zero,
      () {
        ref
            .read(bannerDetailsProvider.notifier)
            .fetchBannerProducts(context, widget.id);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(bannerDetailsProvider);
    final notifier = ref.read(bannerDetailsProvider.notifier);
    final bool isDarkMode = LocalStorage.instance.getAppThemeMode();
    return state.isLoading
        ? Scaffold(
            backgroundColor: isDarkMode
                ? AppColors.dontHaveAnAccBackDark
                : AppColors.mainBack,
            body: JumpingDots(
              color: isDarkMode ? AppColors.white : AppColors.black,
            ),
          )
        : KeyboardDismisser(
            child: Scaffold(
              backgroundColor: isDarkMode
                  ? AppColors.dontHaveAnAccBackDark
                  : AppColors.mainBack,
              appBar: AppBar(
                elevation: 0,
                backgroundColor: isDarkMode
                    ? AppColors.dontHaveAnAccBackDark
                    : AppColors.white,
                leading: IconButton(
                  splashRadius: 20.r,
                  icon: Icon(
                    FlutterRemix.arrow_left_s_line,
                    size: 24.r,
                    color: isDarkMode ? AppColors.white : AppColors.black,
                  ),
                  onPressed: () => context.popRoute(),
                ),
                title: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      AppHelpers.getTranslation(TrKeys.banner).toUpperCase(),
                      style: GoogleFonts.k2d(
                        fontWeight: FontWeight.w500,
                        fontSize: 15.sp,
                        letterSpacing: -0.7,
                        color: isDarkMode ? AppColors.white : AppColors.black,
                      ),
                    ),
                    10.horizontalSpace,
                    Container(
                      width: 4.r,
                      height: 4.r,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2.r),
                        color: isDarkMode
                            ? AppColors.dragElementDark
                            : AppColors.brandTitleDivider.withOpacity(0.4),
                      ),
                    ),
                    7.horizontalSpace,
                    Text(
                      '${state.productsCount} ${AppHelpers.getTranslation(TrKeys.products).toLowerCase()}',
                      style: GoogleFonts.k2d(
                        fontWeight: FontWeight.w500,
                        fontSize: 12.sp,
                        letterSpacing: -0.7,
                        color: isDarkMode ? AppColors.white : AppColors.black,
                      ),
                    ),
                  ],
                ),
                centerTitle: true,
                bottom: PreferredSize(
                  preferredSize: Size.fromHeight(55.r),
                  child: Column(
                    children: [
                      Container(
                        height: 1.r,
                        color: isDarkMode
                            ? AppColors.white.withOpacity(0.5)
                            : AppColors.mainBack,
                      ),
                      SearchTextField(
                        onChanged: (value) => notifier.setQuery(context, value),
                        suffixIcon: IconButton(
                          splashRadius: 10,
                          icon: Icon(
                            FlutterRemix.equalizer_line,
                            color:
                                isDarkMode ? AppColors.white : AppColors.black,
                            size: 18.r,
                          ),
                          onPressed: () {
                            // showCupertinoModalBottomSheet(
                            //   context: context,
                            //   builder: (context) =>
                            //       const BannerProductsSearchFilterModal(),
                            // );
                            AppHelpers.showCustomModalBottomSheet(
                              context: context,
                              modal: const BannerProductsSearchFilterModal(),
                              isDarkMode: isDarkMode,
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              body: state.isSearching
                  ? ProductSearchBody(
                      isSearchLoading: state.isSearchLoading,
                      searchedProducts: state.searchedProducts,
                      query: state.query.trim(),
                    )
                  : BannerDetailsBody(imageUrl: widget.imageUrl),
            ),
          );
  }
}
