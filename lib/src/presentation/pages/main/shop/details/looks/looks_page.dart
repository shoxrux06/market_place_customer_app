import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../core/constants/constants.dart';
import '../../../../../../core/utils/utils.dart';
import '../../../../../components/components.dart';
import '../../../../../theme/theme.dart';
import 'riverpod/provider/looks_provider.dart';
import 'widgets/look_item.dart';
import 'widgets/products/look_products_modal.dart';

class LooksPage extends ConsumerStatefulWidget {
  const LooksPage({Key? key}) : super(key: key);

  @override
  ConsumerState<LooksPage> createState() => _LooksPageState();
}

class _LooksPageState extends ConsumerState<LooksPage> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    Future.delayed(
      Duration.zero,
      () {
        ref.read(looksProvider.notifier).fetchLooks(context);
      },
    );
    _scrollController = ScrollController();
    _scrollController.addListener(
      () {
        if (_scrollController.position.maxScrollExtent ==
            _scrollController.position.pixels) {
          ref.read(looksProvider.notifier).fetchLooks(context);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(looksProvider);
    final notifier = ref.read(looksProvider.notifier);
    final bool isDarkMode = LocalStorage.instance.getAppThemeMode();
    return Scaffold(
      backgroundColor:
          isDarkMode ? AppColors.dontHaveAnAccBackDark : AppColors.mainBack,
      appBar: CommonAppBar(
        title: AppHelpers.getTranslation(TrKeys.looks),
        onLeadingPressed: context.popRoute,
      ),
      body: state.isLoading
          ? const ProductHorizontalListShimmer(
              height: 370,
              spacing: 10,
              verticalPadding: 15,
              horizontalPadding: 15,
            )
          : state.looks.isNotEmpty
              ? ListView.builder(
                  itemCount: state.looks.length,
                  shrinkWrap: true,
                  physics: const CustomBouncingScrollPhysics(),
                  padding: REdgeInsets.all(15),
                  itemBuilder: (context, index) {
                    final look = state.looks[index];
                    final isLiking = state.lookLikes[index].isLiking;
                    return LookItem(
                      look: look,
                      isLiking: isLiking,
                      onTap: () {
                        AppHelpers.showCustomModalBottomSheet(
                          context: context,
                          modal: LookProductsModal(look: look),
                          isDarkMode: isDarkMode,
                          paddingTop: 140,
                        );
                      },
                      onLikeTap: () {
                        notifier.likeLook(
                          index,
                          checkYourNetwork: () {
                            AppHelpers.showCheckFlash(
                              context,
                              AppHelpers.getTranslation(
                                  TrKeys.checkYourNetworkConnection),
                            );
                          },
                          youNeedToLoginFirst: () {
                            AppHelpers.showCheckFlash(
                              context,
                              AppHelpers.getTranslation(
                                  TrKeys.youNeedToLoginFirst),
                            );
                          },
                        );
                      },
                    );
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
                          color: isDarkMode ? AppColors.white : AppColors.black,
                        ),
                      ),
                    ],
                  ),
                ),
    );
  }
}
