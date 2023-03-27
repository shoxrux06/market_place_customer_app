import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_customer/src/presentation/pages/main/profile/card/add_card_page.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../../core/utils/local_storage.dart';
import '../../../../../../components/components.dart';
import '../../../../../../theme/app_colors.dart';
import '../riverpod/provider/checkout_provider.dart';
import 'payment_card_item_widget.dart';

class PaymentBodyWidget extends ConsumerStatefulWidget {
  const PaymentBodyWidget({Key? key}) : super(key: key);

  @override
  ConsumerState<PaymentBodyWidget> createState() => _PaymentBodyWidgetState();
}

class _PaymentBodyWidgetState extends ConsumerState<PaymentBodyWidget> {
  getCardList() async {
    final notifier = ref.watch(checkoutProvider.notifier);
    await notifier.getCardList(context, 1, 10);
  }

  @override
  void initState() {
  print('INIT STATE PAYMENT WIDGET');
  Future.delayed(Duration.zero, () {
      getCardList();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = LocalStorage.instance.getAppThemeMode();

    final state = ref.watch(checkoutProvider);
    final notifier = ref.read(checkoutProvider.notifier);
    return Padding(
      padding: REdgeInsets.symmetric(horizontal: 15),
      child: state.isPaymentsLoading
          ? const ProductHorizontalListShimmer(
              height: 74,
              itemCount: 5,
              spacing: 13,
              verticalPadding: 20,
            )
          : SingleChildScrollView(
              physics: const CustomBouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 48),
                child: Column(
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      padding: REdgeInsets.symmetric(vertical: 20),
                      physics: const CustomBouncingScrollPhysics(),
                      itemCount: state.payments.length,
                      itemBuilder: (context, index) {
                        final payment = state.payments[index];
                        return Column(
                          children: [
                            PaymentCardItemWidget(
                              payment: payment,
                              isSelected: state.selectedPaymentIndex == index,
                              onTap: () =>
                                  notifier.setSelectedPaymentIndex(index),
                            ),
                            (index == state.payments.length - 1 && state.cardList.isEmpty)
                                ? InkWell(
                                    onTap: () {
                                      Navigator.of(context).push(MaterialPageRoute(builder: (_) => const AddCardPage()));
                                    },
                                    child: Material(
                                      child: Container(
                                          height: 74.r,
                                          decoration: BoxDecoration(
                                            color: isDarkMode
                                                ? AppColors.mainBackDark
                                                : AppColors.notDoneOrderStatus,
                                            borderRadius:
                                                BorderRadius.circular(8.r),
                                          ),
                                          child: Center(
                                              child: Text(
                                            'Add card',
                                            style: GoogleFonts.k2d(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 16.sp,
                                              color: isDarkMode
                                                  ? AppColors.white
                                                  : AppColors.black,
                                              letterSpacing: -14 * 0.01,
                                            ),
                                          ))),
                                    ),
                                  )
                                : Container(),
                          ],
                        );
                      },
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: state.cardList.length,
                      physics: const CustomBouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        final cardList = state.cardList[index];
                        return Column(
                          children: [
                            Container(
                              width: 1.sw,
                              height: 74.r,
                              margin: const EdgeInsets.only(bottom: 12),
                              decoration: BoxDecoration(
                                color: isDarkMode
                                    ? AppColors.mainBackDark
                                    : AppColors.notDoneOrderStatus,
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                              child: ListTile(
                                title: Text(cardList.pan, style: GoogleFonts.k2d(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16.sp,
                                  color: isDarkMode
                                      ? AppColors.white
                                      : AppColors.black,
                                  letterSpacing: -14 * 0.01,
                                ),),
                                subtitle: Text(cardList.expiry, style: GoogleFonts.k2d(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14.sp,
                                  color: isDarkMode
                                      ? AppColors.white
                                      : AppColors.black,
                                  letterSpacing: -14 * 0.01,
                                ),),
                              ),
                            ),
                            (index == state.cardList.length - 1 && state.cardList.isNotEmpty)
                                ? InkWell(
                                    onTap: () {
                                      Navigator.of(context).push(MaterialPageRoute(builder: (_) => const AddCardPage()));
                                    },
                                    child: Material(
                                      child: Container(
                                        height: 74.r,
                                        decoration: BoxDecoration(
                                          color: isDarkMode
                                              ? AppColors.mainBackDark
                                              : AppColors.notDoneOrderStatus,
                                          borderRadius:
                                              BorderRadius.circular(8.r),
                                        ),
                                        child: Center(
                                          child: Text(
                                            'Add card',
                                            style: GoogleFonts.k2d(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 16.sp,
                                              color: isDarkMode
                                                  ? AppColors.white
                                                  : AppColors.black,
                                              letterSpacing: -14 * 0.01,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                : Container(),

                          ],
                        );
                      },
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
