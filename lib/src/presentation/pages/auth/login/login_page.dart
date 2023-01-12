import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/routes/app_router.gr.dart';
import '../../../../core/utils/utils.dart';
import '../../../components/components.dart';
import '../../../theme/theme.dart';
import 'riverpod/provider/login_provider.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(loginProvider.notifier);
    final state = ref.watch(loginProvider);
    final bool isDarkMode = LocalStorage.instance.getAppThemeMode();
    final bool isLtr = LocalStorage.instance.getLangLtr();
    return Directionality(
      textDirection: isLtr ? TextDirection.ltr : TextDirection.rtl,
      child: AbsorbPointer(
        absorbing: state.isGoogleLoading ||
            state.isLoading ||
            state.isCurrenciesLoading,
        child: KeyboardDismisser(
          child: Scaffold(
            backgroundColor:
                isDarkMode ? AppColors.dontHaveAnAccBackDark : AppColors.white,
            body: SafeArea(
              child: Column(
                children: [
                  Padding(
                    padding: REdgeInsets.symmetric(
                      vertical: 12,
                      horizontal: 15,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${AppHelpers.getAppName()}',
                          style: GoogleFonts.k2d(
                            fontWeight: FontWeight.w700,
                            fontSize: 14.sp,
                            letterSpacing: -1,
                            color:
                                isDarkMode ? AppColors.white : AppColors.black,
                          ),
                        ),
                        SkipAuthButton(
                          title: AppHelpers.getTranslation(TrKeys.skip),
                          onPressed: () => notifier.skipForNow(context),
                        ),
                      ],
                    ),
                  ),
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
                          AppHelpers.getTranslation(TrKeys.login),
                          style: GoogleFonts.k2d(
                            fontWeight: FontWeight.w500,
                            fontSize: 18.sp,
                            color:
                                isDarkMode ? AppColors.white : AppColors.black,
                          ),
                        ),
                        26.verticalSpace,
                        OutlinedBorderTextField(
                          label: AppHelpers.getTranslation(TrKeys.email),
                          onChanged: notifier.setEmail,
                          inputType: TextInputType.emailAddress,
                          textCapitalization: TextCapitalization.none,
                          isError: state.isLoginError || state.isEmailNotValid,
                          textInputAction: TextInputAction.next,
                          descriptionText: state.isEmailNotValid
                              ? AppHelpers.getTranslation(
                                  TrKeys.emailIsNotValid)
                              : (state.isLoginError
                                  ? AppHelpers.getTranslation(
                                      TrKeys.loginCredentialsAreNotValid)
                                  : null),
                        ),
                        16.verticalSpace,
                        OutlinedBorderTextField(
                          obscure: state.showPassword,
                          label: AppHelpers.getTranslation(TrKeys.password),
                          onChanged: notifier.setPassword,
                          textCapitalization: TextCapitalization.none,
                          isError:
                              state.isLoginError || state.isPasswordNotValid,
                          descriptionText: state.isPasswordNotValid
                              ? AppHelpers.getTranslation(TrKeys
                                  .passwordShouldContainMinimum8Characters)
                              : (state.isLoginError
                                  ? AppHelpers.getTranslation(
                                      TrKeys.loginCredentialsAreNotValid)
                                  : null),
                          suffixIcon: IconButton(
                            splashRadius: 25,
                            icon: Icon(
                              state.showPassword
                                  ? FlutterRemix.eye_line
                                  : FlutterRemix.eye_close_line,
                              color: isDarkMode
                                  ? AppColors.white
                                  : AppColors.black,
                              size: 20.r,
                            ),
                            onPressed: () =>
                                notifier.setShowPassword(!state.showPassword),
                          ),
                        ),
                        12.verticalSpace,
                        Align(
                          alignment: Alignment.centerRight,
                          child: ForgotTextButton(
                            title:
                                '${AppHelpers.getTranslation(TrKeys.forgotPassword)}?',
                            fontColor:
                                isDarkMode ? AppColors.white : AppColors.black,
                            onPressed: () =>
                                context.pushRoute(const ResetPasswordRoute()),
                          ),
                        ),
                        40.verticalSpace,
                        AccentLoginButton(
                          title: AppHelpers.getTranslation(TrKeys.login),
                          isLoading: state.isLoading,
                          onPressed: state.email.length > 2 &&
                                  state.password.length > 7
                              ? () => notifier.login(context)
                              : null,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            bottomNavigationBar: Padding(
              padding: REdgeInsets.only(left: 15, right: 15, bottom: 40),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: GoogleSignButton(
                          isLoading: state.isGoogleLoading,
                          onPressed: () => notifier.loginWithGoogle(context),
                        ),
                      ),
                      9.horizontalSpace,
                      Row(
                        children: [
                          AppleFbButton(
                            iconData: FlutterRemix.facebook_fill,
                            onPressed: () =>
                                notifier.loginWithFacebook(context),
                          ),
                          // 9.horizontalSpace,
                          // AppleFbButton(
                          //   iconData: FlutterRemix.apple_fill,
                          //   onPressed: () {},
                          // ),
                        ],
                      ),
                    ],
                  ),
                  28.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${AppHelpers.getTranslation(TrKeys.dontHaveAnAcc)}?',
                        style: GoogleFonts.k2d(
                          fontWeight: FontWeight.w500,
                          fontSize: 13.sp,
                          color: isDarkMode ? AppColors.white : AppColors.black,
                        ),
                      ),
                      8.horizontalSpace,
                      SignUpInButton(
                        title: AppHelpers.getTranslation(TrKeys.register),
                        onPressed: () =>
                            context.replaceRoute(const EnterPhoneRoute()),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
