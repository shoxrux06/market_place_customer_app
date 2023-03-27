import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_customer/src/presentation/pages/main/profile/add_video/widgets/video_shimmer.dart';
import 'package:g_customer/src/presentation/pages/main/profile/add_video/widgets/video_watch.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../core/constants/constants.dart';
import '../../../../../../core/utils/app_helpers.dart';
import '../../../../../../core/utils/local_storage.dart';
import '../../../../../components/components.dart';
import '../../../../../theme/app_colors.dart';
import '../riverpod/provider/add_video_provider.dart';

class VideoWidget extends ConsumerStatefulWidget {
  const VideoWidget({Key? key}) : super(key: key);

  @override
  ConsumerState<VideoWidget> createState() => _VideoWidgetState();
}

class _VideoWidgetState extends ConsumerState<VideoWidget>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      final notifier = ref.watch(addVideoProvider.notifier);
      notifier.getVideoList();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = LocalStorage.instance.getAppThemeMode();
    final state = ref.watch(addVideoProvider);

    print('videoList **${state.videoList}**');
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Row(
              children: [
                Text(
                  'Stories',
                  style: GoogleFonts.k2d(
                    fontWeight: FontWeight.w500,
                    fontSize: 18.sp,
                    color: isDarkMode ? AppColors.white : AppColors.black,
                    letterSpacing: -14 * 0.02,
                  ),
                ),
                Spacer(),
                ForgotTextButton(
                  title: AppHelpers.getTranslation(TrKeys.seeAll).toUpperCase(),
                  fontSize: 12.sp,
                  fontColor: isDarkMode ? AppColors.white : AppColors.black,
                  onPressed: () {},
                ),
              ],
            ),
          ),
          Container(
              padding: const EdgeInsets.only(top: 15, bottom: 0),
              margin: const EdgeInsets.only(top: 0, bottom: 15),
              child: !state.isFetchingVideo
                  ? state.videoList.isEmpty
                      ? Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            2.verticalSpace,
                            Container(
                              width: 142.r,
                              height: 142.r,
                              decoration: BoxDecoration(
                                borderRadius:
                                BorderRadius.circular(8.r),
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
                              '${AppHelpers.getTranslation(TrKeys.thereAreNoItemsInThe)} ${AppHelpers.getTranslation(TrKeys.videoStory).toLowerCase()}',
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
                        )
                      : Column(
                          children: [
                            SizedBox(
                              height: 260.r,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: state.videoList.length,
                                physics: const CustomBouncingScrollPhysics(),
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: EdgeInsets.only(
                                        left: index == 0 ? 15 : 0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Container(
                                          padding:
                                              const EdgeInsets.only(right: 12),
                                          height: 230.r,
                                          width: 190.r,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: InkWell(
                                            onTap: () {
                                              showNewDialog(state.videoList[index].imageName);
                                            },
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              child: Image.asset(
                                                AppAssets.videoInit,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        Text(state.videoList[index].description
                                            .toString()),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            )
                          ],
                        )
                  : SizedBox(
                      height: 270.r,
                      child: VideoShimmer(),
                    ))
        ],
      ),
    );
  }

  Future<dynamic> showNewDialog(String imageName) {
    return showGeneralDialog(
      context: context,
      barrierColor: Colors.grey.withOpacity(0.95),
      // Background color
      barrierDismissible: true,
      barrierLabel: 'Dialog',
      transitionDuration: const Duration(milliseconds: 300),
      transitionBuilder: _buildNewTransition,
      pageBuilder: (_, __, ___) {
        return Center(
          child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 1.5,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(24),
                child: Card(
                    margin: const EdgeInsets.all(8),
                    child: VideoWatchScreen(
                      imageName: imageName,
                    )),
              )),
        );
      },
    );
  }

  Widget _buildNewTransition(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return ScaleTransition(
      scale: CurvedAnimation(
        parent: animation,
        curve: Curves.linear,
        reverseCurve: Curves.linear,
      ),
      child: child,
    );
  }
}
