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
import 'riverpod/provider/register_provider.dart';

class RegisterPage extends ConsumerWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(registerProvider.notifier);
    final state = ref.watch(registerProvider);
    final bool isDarkMode = LocalStorage.instance.getAppThemeMode();
    final bool isLtr = LocalStorage.instance.getLangLtr();
    return Directionality(
      textDirection: isLtr ? TextDirection.ltr : TextDirection.rtl,
      child: AbsorbPointer(
        absorbing: state.isLoading || state.isGoogleLoading,
        child: KeyboardDismisser(
          child: Scaffold(
            backgroundColor:
                isDarkMode ? AppColors.dontHaveAnAccBackDark : AppColors.white,
            body: SafeArea(
              child: SingleChildScrollView(
                physics: const CustomBouncingScrollPhysics(),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: REdgeInsets.symmetric(
                        vertical: 21,
                        horizontal: 15,
                      ),
                      child: Text(
                        AppHelpers.getAppName() ?? 'Go shops',
                        style: GoogleFonts.k2d(
                          fontWeight: FontWeight.w700,
                          fontSize: 14.sp,
                          letterSpacing: -1,
                          color: isDarkMode ? AppColors.white : AppColors.black,
                        ),
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
                            AppHelpers.getTranslation(TrKeys.register),
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
                            isError: state.isEmailInvalid,
                            descriptionText: state.isEmailInvalid
                                ? AppHelpers.getTranslation(
                                    TrKeys.emailIsNotValid)
                                : null,
                          ),
                          15.verticalSpace,
                          OutlinedBorderTextField(
                            label: AppHelpers.getTranslation(TrKeys.firstname),
                            onChanged: notifier.setFirstName,
                          ),
                          15.verticalSpace,
                          OutlinedBorderTextField(
                            label: AppHelpers.getTranslation(TrKeys.lastname),
                            onChanged: notifier.setLatName,
                          ),
                          15.verticalSpace,
                          OutlinedBorderTextField(
                            obscure: state.showPassword,
                            label: AppHelpers.getTranslation(TrKeys.password),
                            onChanged: notifier.setPassword,
                            textCapitalization: TextCapitalization.none,
                            isError: state.isPasswordInvalid,
                            descriptionText: state.isPasswordInvalid
                                ? AppHelpers.getTranslation(TrKeys
                                    .passwordShouldContainMinimum8Characters)
                                : null,
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
                              onPressed: notifier.toggleShowPassword,
                            ),
                          ),
                          15.verticalSpace,
                          OutlinedBorderTextField(
                            obscure: state.showConfirmPassword,
                            label:
                                AppHelpers.getTranslation(TrKeys.confirmPassword),
                            onChanged: notifier.setConfirmPassword,
                            textCapitalization: TextCapitalization.none,
                            isError: state.isConfirmPasswordInvalid,
                            descriptionText: state.isConfirmPasswordInvalid
                                ? AppHelpers.getTranslation(
                                    TrKeys.confirmPasswordIsNotTheSame)
                                : null,
                            suffixIcon: IconButton(
                              splashRadius: 25,
                              icon: Icon(
                                state.showConfirmPassword
                                    ? FlutterRemix.eye_line
                                    : FlutterRemix.eye_close_line,
                                color: isDarkMode
                                    ? AppColors.white
                                    : AppColors.black,
                                size: 20.r,
                              ),
                              onPressed: notifier.toggleShowConfirmPassword,
                            ),
                          ),
                          40.verticalSpace,
                          AccentLoginButton(
                            title: AppHelpers.getTranslation(TrKeys.register),
                            isLoading: state.isLoading,
                            onPressed: state.email.length > 2 &&
                                    state.firstName.isNotEmpty &&
                                    state.lastName.isNotEmpty &&
                                    state.password.isNotEmpty &&
                                    state.confirmPassword.isNotEmpty
                                ? () => notifier.register(context)
                                : null,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            bottomNavigationBar: Padding(
              padding: REdgeInsets.only(left: 15, right: 15, bottom: 30),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(),
                  10.verticalSpace,
                  Row(
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
