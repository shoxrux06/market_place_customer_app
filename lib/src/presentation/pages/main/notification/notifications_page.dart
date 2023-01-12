import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/utils/utils.dart';
import '../../../components/components.dart';
import '../../../theme/theme.dart';
import 'riverpod/provider/notifications_provider.dart';
import 'widgets/notification_item.dart';

class NotificationsPage extends ConsumerStatefulWidget {
  const NotificationsPage({Key? key}) : super(key: key);

  @override
  ConsumerState<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends ConsumerState<NotificationsPage> {
  late ScrollController _scrollController;

  @override
  void initState() {
    Future.delayed(
      Duration.zero,
      () {
        ref.read(notificationsProvider.notifier).fetchNotifications(context);
      },
    );
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(
      () {
        if (_scrollController.position.maxScrollExtent ==
            _scrollController.position.pixels) {
          ref.read(notificationsProvider.notifier).fetchNotifications(context);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(notificationsProvider);
    final bool isDarkMode = LocalStorage.instance.getAppThemeMode();
    final bool isLtr = LocalStorage.instance.getLangLtr();
    return Directionality(
      textDirection: isLtr ? TextDirection.ltr : TextDirection.rtl,
      child: Scaffold(
        extendBody: true,
        backgroundColor: isDarkMode ? AppColors.mainBackDark : AppColors.white,
        appBar: CommonAppBar(
          title: AppHelpers.getTranslation(TrKeys.notifications),
          onLeadingPressed: context.popRoute,
        ),
        body: state.isLoading
            ? JumpingDots(color: isDarkMode ? AppColors.white : AppColors.black)
            : Column(
                children: [
                  Container(
                    height: 16.r,
                    color:
                        isDarkMode ? AppColors.mainBackDark : AppColors.mainBack,
                  ),
                  Expanded(
                    child: Container(
                      color: isDarkMode
                          ? AppColors.dontHaveAnAccBackDark
                          : AppColors.white,
                      padding: REdgeInsets.symmetric(horizontal: 15),
                      child: state.notifications.isNotEmpty
                          ? ListView.builder(
                              shrinkWrap: true,
                              padding: REdgeInsets.only(top: 20, bottom: 60),
                              physics: const CustomBouncingScrollPhysics(),
                              itemCount: state.notifications.length,
                              controller: _scrollController,
                              itemBuilder: (context, index) {
                                final notification = state.notifications[index];
                                return NotificationItem(
                                    notification: notification);
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
                                          : AppColors.mainBack,
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
                                    '${AppHelpers.getTranslation(TrKeys.thereAreNoItemsInThe)} ${AppHelpers.getTranslation(TrKeys.notifications).toLowerCase()}',
                                    style: GoogleFonts.k2d(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: -14 * 0.02,
                                      color: isDarkMode
                                          ? AppColors.white
                                          : AppColors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
