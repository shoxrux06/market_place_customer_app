import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart' as intl;

import '../../../../../core/constants/constants.dart';
import '../../../../../core/utils/utils.dart';
import '../../../../components/components.dart';
import '../../../../theme/theme.dart';
import 'riverpod/provider/wallet_histories_provider.dart';

class WalletHistoriesPage extends ConsumerStatefulWidget {
  const WalletHistoriesPage({Key? key}) : super(key: key);

  @override
  ConsumerState<WalletHistoriesPage> createState() =>
      _WalletHistoriesPageState();
}

class _WalletHistoriesPageState extends ConsumerState<WalletHistoriesPage> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    Future.delayed(
      Duration.zero,
      () {
        ref
            .read(walletHistoriesProvider.notifier)
            .fetchWalletHistories(context);
      },
    );
    _scrollController = ScrollController();
    _scrollController.addListener(
      () {
        if (_scrollController.position.maxScrollExtent ==
            _scrollController.position.pixels) {
          ref
              .read(walletHistoriesProvider.notifier)
              .fetchWalletHistories(context);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(walletHistoriesProvider);
    final bool isDarkMode = LocalStorage.instance.getAppThemeMode();
    final bool isLtr = LocalStorage.instance.getLangLtr();
    return Directionality(
      textDirection: isLtr ? TextDirection.ltr : TextDirection.rtl,
      child: Scaffold(
        backgroundColor:
            isDarkMode ? AppColors.dontHaveAnAccBackDark : AppColors.white,
        appBar: CommonAppBar(
          title: AppHelpers.getTranslation(TrKeys.walletHistory),
          onLeadingPressed: context.popRoute,
        ),
        body: Column(
          children: [
            Container(
              height: 1.r,
              color: isDarkMode ? AppColors.mainBackDark : AppColors.mainBack,
            ),
            Expanded(
              child: state.isLoading
                  ? JumpingDots(
                      color: isDarkMode ? AppColors.white : AppColors.black,
                    )
                  : state.wallets.isNotEmpty
                      ? ListView.builder(
                          itemCount: state.wallets.length,
                          shrinkWrap: true,
                          physics: const CustomBouncingScrollPhysics(),
                          padding: REdgeInsets.all(15),
                          itemBuilder: (context, index) {
                            final wallet = state.wallets[index];
                            final isLast = index == state.wallets.length - 1;
                            return Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                15.verticalSpace,
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Id: ${wallet.id}',
                                      style: GoogleFonts.k2d(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14.sp,
                                        letterSpacing: -0.4,
                                        color: isDarkMode
                                            ? AppColors.white
                                            : AppColors.black,
                                      ),
                                    ),
                                    Text(
                                      intl.NumberFormat.currency(
                                        symbol: LocalStorage.instance
                                            .getSelectedCurrency()
                                            .symbol,
                                      ).format(wallet.price),
                                      style: GoogleFonts.k2d(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14.sp,
                                        letterSpacing: -0.4,
                                        color: AppColors.accentGreen,
                                      ),
                                    ),
                                  ],
                                ),
                                3.verticalSpace,
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '${wallet.note}',
                                      style: GoogleFonts.k2d(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14.sp,
                                        letterSpacing: -0.4,
                                        color: isDarkMode
                                            ? AppColors.white
                                            : AppColors.black,
                                      ),
                                    ),
                                    Text(
                                      '${wallet.createdAt?.substring(0, 16)}',
                                      style: GoogleFonts.k2d(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14.sp,
                                        letterSpacing: -0.4,
                                        color: isDarkMode
                                            ? AppColors.white
                                            : AppColors.black,
                                      ),
                                    ),
                                  ],
                                ),
                                15.verticalSpace,
                                if (!isLast)
                                  Divider(
                                    thickness: 1.r,
                                    height: 1.r,
                                    color: isDarkMode
                                        ? AppColors.dragElementDark
                                        : AppColors.black.withOpacity(0.05),
                                  ),
                              ],
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
                                '${AppHelpers.getTranslation(TrKeys.thereAreNoItemsInThe)} ${AppHelpers.getTranslation(TrKeys.walletHistory).toLowerCase()}',
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
          ],
        ),
      ),
    );
  }
}
