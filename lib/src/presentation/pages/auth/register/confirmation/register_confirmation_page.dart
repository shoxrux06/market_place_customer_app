import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sms_autofill/sms_autofill.dart';

import '../../../../../core/constants/constants.dart';
import '../../../../../core/routes/app_router.gr.dart';
import '../../../../../core/utils/utils.dart';
import '../../../../components/components.dart';
import '../../../../theme/theme.dart';
import '../enter_phone/riverpod/provider/enter_phone_provider.dart';
import 'riverpod/provider/register_confirmation_provider.dart';

class RegisterConfirmationPage extends ConsumerStatefulWidget {
  const RegisterConfirmationPage({Key? key}) : super(key: key);

  @override
  ConsumerState<RegisterConfirmationPage> createState() =>
      _RegisterConfirmationPageState();
}

class _RegisterConfirmationPageState
    extends ConsumerState<RegisterConfirmationPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      Duration.zero,
      () {
        ref.read(registerConfirmationProvider.notifier).startTimer();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final notifier = ref.read(registerConfirmationProvider.notifier);
    final state = ref.watch(registerConfirmationProvider);
    final enterPhoneState = ref.watch(enterPhoneProvider);
    final enterPhoneNotifier = ref.read(enterPhoneProvider.notifier);
    final bool isDarkMode = LocalStorage.instance.getAppThemeMode();
    final bool isLtr = LocalStorage.instance.getLangLtr();
    return Directionality(
      textDirection: isLtr ? TextDirection.ltr : TextDirection.rtl,
      child: AbsorbPointer(
        absorbing: state.isLoading || state.isResending || state.isInitializing,
        child: KeyboardDismisser(
          child: Scaffold(
            backgroundColor:
                isDarkMode ? AppColors.dontHaveAnAccBackDark : AppColors.white,
            appBar: AppBar(
              backgroundColor:
                  isDarkMode ? AppColors.dontHaveAnAccBackDark : AppColors.white,
              elevation: 0,
              centerTitle: true,
              title: Text(
                AppHelpers.getAppName() ?? 'Go shops',
                style: GoogleFonts.k2d(
                  fontWeight: FontWeight.w700,
                  fontSize: 14.sp,
                  letterSpacing: -1,
                  color: isDarkMode ? AppColors.white : AppColors.black,
                ),
              ),
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
            body: state.isInitializing
                ? JumpingDots(
                    color: isDarkMode ? AppColors.white : AppColors.black,
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 16.r,
                        color: isDarkMode
                            ? AppColors.mainBackDark
                            : AppColors.mainBack,
                      ),
                      Padding(
                        padding: REdgeInsets.symmetric(horizontal: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            18.verticalSpace,
                            Text(
                              AppHelpers.getTranslation(TrKeys.confirmation),
                              style: GoogleFonts.k2d(
                                fontWeight: FontWeight.w500,
                                fontSize: 18.sp,
                                color: isDarkMode
                                    ? AppColors.white
                                    : AppColors.black,
                              ),
                            ),
                            12.verticalSpace,
                            Text(
                              AppHelpers.getTranslation(
                                  TrKeys.enterTheCodeWeSentOverSmsTo),
                              style: GoogleFonts.k2d(
                                fontWeight: FontWeight.w500,
                                fontSize: 14.sp,
                                color: isDarkMode
                                    ? AppColors.white
                                    : AppColors.black,
                              ),
                            ),
                            Text(
                              enterPhoneState.phone,
                              style: GoogleFonts.k2d(
                                fontWeight: FontWeight.w500,
                                fontSize: 14.sp,
                                color: isDarkMode
                                    ? AppColors.white
                                    : AppColors.black,
                              ),
                            ),
                            60.verticalSpace,
                            SizedBox(
                              height: 56,
                              child: PinFieldAutoFill(
                                codeLength: 6,
                                currentCode: state.confirmCode,
                                onCodeChanged: notifier.setCode,
                                cursor: Cursor(
                                  width: 1,
                                  height: 24,
                                  color: isDarkMode
                                      ? AppColors.white
                                      : AppColors.black,
                                  enabled: true,
                                ),
                                decoration: BoxLooseDecoration(
                                  gapSpace: 10.r,
                                  textStyle: GoogleFonts.k2d(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15.sp,
                                    color: isDarkMode
                                        ? AppColors.white
                                        : AppColors.black,
                                  ),
                                  bgColorBuilder: FixedColorBuilder(
                                    isDarkMode
                                        ? AppColors.mainBackDark
                                        : AppColors.white,
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
                            if (state.isCodeError)
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  4.verticalSpace,
                                  Text(
                                    AppHelpers.getTranslation(
                                      TrKeys.confirmationCodeIsNotPresent,
                                    ),
                                    style: GoogleFonts.k2d(
                                      fontWeight: FontWeight.w400,
                                      letterSpacing: -0.3,
                                      fontSize: 12.sp,
                                      color: AppColors.red,
                                    ),
                                  ),
                                ],
                              ),
                            50.verticalSpace,
                            Row(
                              children: [
                                Expanded(
                                  child: AccentLoginButton(
                                    title: AppHelpers.getTranslation(
                                        TrKeys.sendSmsCode),
                                    isLoading: state.isLoading,
                                    onPressed: state.confirmCode.length > 5
                                        ? () => notifier.confirmCode(
                                              context,
                                              enterPhoneState.verifyId,
                                            )
                                        : null,
                                  ),
                                ),
                                10.horizontalSpace,
                                ResendButton(
                                  title: state.timerText,
                                  isTimeExpired: state.isTimeExpired,
                                  iconData: FlutterRemix.refresh_line,
                                  isResending: state.isResending,
                                  onPressed:
                                      state.isTimeExpired && !state.isResending
                                          ? () => notifier.resendConfirmation(
                                                context,
                                                enterPhoneState.phone,
                                                enterPhoneNotifier,
                                              )
                                          : null,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
            bottomNavigationBar: Padding(
              padding: REdgeInsets.only(left: 15, right: 15, bottom: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AppHelpers.getTranslation(TrKeys.youAlreadyHaveAnAccount),
                    style: GoogleFonts.k2d(
                      fontWeight: FontWeight.w500,
                      fontSize: 13.sp,
                      color: isDarkMode ? AppColors.white : AppColors.black,
                    ),
                  ),
                  8.horizontalSpace,
                  SignUpInButton(
                    title: AppHelpers.getTranslation(TrKeys.login),
                    onPressed: () {
                      context.router.popUntilRoot();
                      context.replaceRoute(const LoginRoute());
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
