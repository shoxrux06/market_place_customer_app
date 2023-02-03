import 'dart:io';
import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/constants/constants.dart';
import '../../../core/routes/app_router.gr.dart';
import '../../../core/utils/utils.dart';
import '../../../riverpod/provider/app_provider.dart';
import '../../components/components.dart';
import '../../theme/theme.dart';
import 'profile/profile_modal.dart';
import 'riverpod/provider/main_provider.dart';
import 'widgets/main_search_filter_modal.dart';

class MainPage extends ConsumerStatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  ConsumerState<MainPage> createState() => _MainPageState();
}

class _MainPageState extends ConsumerState<MainPage>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(mainProvider);
    final bool isDarkMode = ref.watch(appProvider).isDarkMode;
    final bool isLtr = ref.watch(appProvider).isLtr;
    final notifier = ref.read(mainProvider.notifier);
    return Directionality(
      textDirection: isLtr ? TextDirection.ltr : TextDirection.rtl,
      child: KeyboardDismisser(
        child: AutoTabsScaffold(
          lazyLoad: false,
          backgroundColor:
              isDarkMode ? AppColors.mainBackDark : AppColors.white,
          extendBody: true,
          appBarBuilder: (context, tabsRouter) {
            return AppBar(
              // backgroundColor:
              //     isDarkMode ? AppColors.mainBackDark : AppColors.white,
              elevation: 0,
              leadingWidth: 0,
              leading: const SizedBox(),
              centerTitle: false,
              title: Text(
                '${AppHelpers.getAppName()}',
                style: GoogleFonts.k2d(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w700,
                  color: isDarkMode ? AppColors.white : AppColors.black,
                  letterSpacing: -1,
                ),
              ),
              actions: [
                IconButton(
                  splashRadius: 18.r,
                  onPressed: () =>
                      context.pushRoute(const NotificationsRoute()),
                  icon: Icon(
                    FlutterRemix.notification_line,
                      color: isDarkMode ? AppColors.white : AppColors.black,
                    size: 22.r,
                  ),
                ),
              ],
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(56.r),
                child: Column(
                  children: [
                    Divider(
                      height: 0.r,
                      thickness: 1.r,
                      color: isDarkMode
                          ? AppColors.white.withOpacity(0.06)
                          : AppColors.mainBack,
                    ),
                    SizedBox(
                      height: 54.r,
                      child: SearchTextField(
                        onChanged: (value) =>
                            notifier.setQuery(context, value, tabsRouter),
                        suffixIcon: IconButton(
                          splashRadius: 10,
                          icon: Icon(
                            FlutterRemix.equalizer_line,
                            color: isDarkMode ? AppColors.white : AppColors.black,
                            size: 18.r,
                          ),
                          onPressed: () {
                            notifier.fetchCategories(context);
                            notifier.fetchBrands(context);
                            AppHelpers.showCustomModalBottomSheet(
                              context: context,
                              modal: const MainSearchFilterModal(),
                              isDarkMode: isDarkMode,
                            );
                          },
                        ),
                      ),
                    ),
                    Divider(
                      height: 0.r,
                      thickness: 1.r,
                      color: isDarkMode
                          ? AppColors.white.withOpacity(0.06)
                          : AppColors.mainBack,
                    ),
                  ],
                ),
              ),
            );
          },
          routes: const [
            ShopListRoute(),
            ViewMapRoute(),
            SearchRoute(),
          ],
          bottomNavigationBuilder: state.isSearching
              ? null
              : (context, tabRouter) {
                  return ClipRRect(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 3.5, sigmaY: 3.5),
                      child: Container(
                        height: Platform.isAndroid ? 67.r : 80.r,
                        decoration: BoxDecoration(
                          color: isDarkMode
                              ? AppColors.mainBackDark.withOpacity(0.7)
                              : AppColors.white.withOpacity(0.7),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.bottomNavigationShadow,
                              spreadRadius: 25.r,
                              blurRadius: 35.r,
                              offset: Offset(0.r, 0.r),
                            ),
                          ],
                        ),
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            BottomNavigationBarButton(
                              iconData: FlutterRemix.store_2_fill,
                              isSelected: tabRouter.activeIndex == 0,
                              label: AppHelpers.getTranslation(TrKeys.shopList),
                              onTap: () {
                                tabRouter.setActiveIndex(0);
                                notifier.setActiveTab(0);
                              },
                            ),
                            BottomNavigationBarButton(
                              iconData: FlutterRemix.map_2_fill,
                              isSelected: tabRouter.activeIndex == 1,
                              label: AppHelpers.getTranslation(TrKeys.viewMap),
                              onTap: () {
                                tabRouter.setActiveIndex(1);
                                notifier.setActiveTab(1);
                              },
                            ),
                            InkWell(
                              borderRadius: BorderRadius.circular(20.r),
                              onTap: () {
                                AppHelpers.showCustomModalBottomSheet(
                                  context: context,
                                  modal: const ProfileModal(),
                                  isDarkMode: isDarkMode,
                                  paddingTop: 50,
                                );
                              },
                              child: CommonImage(
                                imageUrl:
                                    LocalStorage.instance.getProfileImage(),
                                width: 40,
                                height: 40,
                                radius: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
        ),
      ),
    );
  }
}
