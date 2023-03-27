import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sms_autofill/sms_autofill.dart';
import '../../../../../core/utils/local_storage.dart';
import '../../../../components/buttons/accent_login_button.dart';
import '../../../../theme/app_colors.dart';
import '../../shop/order/checkout/riverpod/provider/checkout_provider.dart';

class CardConfirmationPage extends ConsumerStatefulWidget {
  const CardConfirmationPage({Key? key}) : super(key: key);

  @override
  ConsumerState<CardConfirmationPage> createState() => _CardPageState();
}

class _CardPageState extends ConsumerState<CardConfirmationPage> {
  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = LocalStorage.instance.getAppThemeMode();

    final state = ref.watch(checkoutProvider);
    final notifier = ref.watch(checkoutProvider.notifier);
    return Scaffold(
      appBar: AppBar(
        backgroundColor:
          isDarkMode ? AppColors.dontHaveAnAccBackDark : AppColors.white,
        leading: IconButton(
          onPressed: context.popRoute,
          icon: Icon(
            FlutterRemix.arrow_left_s_line,
            color: isDarkMode ? AppColors.white : AppColors.black,
          ),
          splashRadius: 20.r,
          padding: EdgeInsets.zero,
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              10.verticalSpace,
              Text('Введите код, полученный в СМС', style: GoogleFonts.k2d(
                fontWeight: FontWeight.w500,
                fontSize: 15.sp,
                color: isDarkMode ? AppColors.white : AppColors.black,
              ),),
              20.verticalSpace,
              SizedBox(
                height: 56,
                child: PinFieldAutoFill(
                  codeLength: 6,
                  currentCode: state.confirmCode,
                  onCodeChanged: notifier.setCode,
                  cursor: Cursor(
                    width: 1,
                    height: 24,
                    color: isDarkMode ? AppColors.white : AppColors.black,
                    enabled: true,
                  ),
                  decoration: BoxLooseDecoration(
                    gapSpace: 10.r,
                    textStyle: GoogleFonts.k2d(
                      fontWeight: FontWeight.w500,
                      fontSize: 15.sp,
                      color: isDarkMode ? AppColors.white : AppColors.black,
                    ),
                    bgColorBuilder: FixedColorBuilder(
                      isDarkMode ? AppColors.mainBackDark : AppColors.white,
                    ),
                    strokeColorBuilder: FixedColorBuilder(
                      state.isCodeError
                          ? AppColors.red
                          : isDarkMode
                              ? AppColors.borderDark
                              : AppColors.outlineButtonBorder,
                    ),
                  ),
                ),
              ),
              40.verticalSpace,
              AccentLoginButton(
                title: 'Ввести данные',
                isLoading: state.isConfirmLoading,
                onPressed: () {
                  print('confirmCode <<${state.confirmCode}>>');
                  print('transactionId <<${state.bindCard?.transactionId}>>');
                  notifier.bindCardApply(
                    context,
                    state.bindCard?.transactionId.toString() ?? '',
                    state.confirmCode
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
