import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:g_customer/src/presentation/components/components.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../core/constants/app_assets.dart';
import '../../../../../core/constants/constants.dart';
import '../../../../../core/routes/app_router.gr.dart';
import '../../../../../core/utils/app_helpers.dart';
import '../../../../../core/utils/local_storage.dart';
import '../../../../theme/app_colors.dart';
import '../../shop/order/checkout/riverpod/provider/checkout_provider.dart';

class CardPage extends ConsumerStatefulWidget {
  const CardPage({Key? key}) : super(key: key);

  @override
  ConsumerState<CardPage> createState() => _CardPageState();
}

class _CardPageState extends ConsumerState<CardPage> {
  getCardList() async {
    final notifier = ref.watch(checkoutProvider.notifier);
    await notifier.getCardList(context, 1, 10);
  }

  @override
  void initState() {
    // TODO: implement initState
    Future.delayed(Duration.zero, () {
      getCardList();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = LocalStorage.instance.getAppThemeMode();
    final state = ref.watch(checkoutProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppHelpers.getTranslation(TrKeys.myCards),
          style: GoogleFonts.k2d(
            fontWeight: FontWeight.w500,
            fontSize: 15.sp,
            color: isDarkMode ? AppColors.white : AppColors.black,
          ),
        ),
        centerTitle: true,
        backgroundColor: isDarkMode ? AppColors.dontHaveAnAccBackDark : AppColors.white,
        leading: IconButton(
          onPressed: context.popRoute,
          icon: Icon(
            FlutterRemix.arrow_left_s_line,
            color: isDarkMode ? AppColors.white : AppColors.black,
          ),
          splashRadius: 20.r,
          padding: EdgeInsets.zero,
        ),
        actions: [
          IconButton(
            onPressed: () {
              context.router.push(const AddCardRoute());
            },
            icon: Icon(
              Icons.add,
              color: isDarkMode ? AppColors.white : AppColors.black,
            ),
          ),
        ],
      ),
      body: state.isCardListLoading
          ? Center(
              child: JumpingDots(
              color: isDarkMode ? AppColors.white : AppColors.black,
              radius: 10,
            ))
          : state.cardList.isEmpty
              ? Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      SizedBox(
                        height: 1.sw / 4,
                      ),
                      Image.asset(AppAssets.pngIcCard),
                      10.verticalSpace,
                      Text(
                        AppHelpers.getTranslation(TrKeys.youHaveNoAddedAnyCardsYet),
                        style: GoogleFonts.k2d(
                          fontWeight: FontWeight.w600,
                          fontSize: 16.sp,
                          color: isDarkMode ? AppColors.white : AppColors.black,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      InkWell(
                        onTap: () {
                          context.router.push(const AddCardRoute());
                        },
                        child: Text(
                          AppHelpers.getTranslation(TrKeys.pleaseAddCard),
                          style: GoogleFonts.k2d(
                            fontWeight: FontWeight.w600,
                            fontSize: 20.sp,
                            color: isDarkMode
                                ? AppColors.white
                                : const Color(0xff2C8FFC),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              : Container(
                  child: ListView.builder(
                    itemCount: state.cardList.length,
                    itemBuilder: (context, index) {
                      return Container(
                        width: 1.sw,
                        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        height: 74.r,
                        decoration: BoxDecoration(
                          color: isDarkMode
                              ? AppColors.mainBackDark
                              : AppColors.notDoneOrderStatus,
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: ListTile(
                          title: Text(state.cardList[index].pan,
                            style: GoogleFonts.k2d(
                            fontWeight: FontWeight.w600,
                            fontSize: 16.sp,
                            color: isDarkMode
                                ? AppColors.white
                                : AppColors.black,
                            letterSpacing: -14 * 0.01,
                          ),),
                          subtitle: Text(state.cardList[index].expiry,
                            style: GoogleFonts.k2d(
                            fontWeight: FontWeight.w500,
                            fontSize: 14.sp,
                            color: isDarkMode
                                ? AppColors.white
                                : AppColors.black,
                            letterSpacing: -14 * 0.01,
                          ),),
                        ),
                      );
                    },
                  ),
                ),
    );
  }
}
