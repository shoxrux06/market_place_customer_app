import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../core/constants/constants.dart';
import '../../../../../core/utils/utils.dart';
import '../../../../components/components.dart';
import '../../../../theme/theme.dart';
import 'riverpod/provider/new_password_provider.dart';

class NewPasswordPage extends ConsumerWidget {
  const NewPasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(newPasswordProvider.notifier);
    final state = ref.watch(newPasswordProvider);
    final bool isDarkMode = LocalStorage.instance.getAppThemeMode();
    final bool isLtr = LocalStorage.instance.getLangLtr();
    return Directionality(
      textDirection: isLtr ? TextDirection.ltr : TextDirection.rtl,
      child: KeyboardDismisser(
        child: Scaffold(
          backgroundColor: AppColors.white,
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
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 16.r,
                color: AppColors.mainBack,
              ),
              Padding(
                padding: REdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    18.verticalSpace,
                    Text(
                      AppHelpers.getTranslation(TrKeys.createNewPassword),
                      style: GoogleFonts.k2d(
                        fontWeight: FontWeight.w500,
                        fontSize: 18.sp,
                        color: AppColors.black,
                      ),
                    ),
                    26.verticalSpace,
                    OutlinedBorderTextField(
                      obscure: state.showNewPassword,
                      label: AppHelpers.getTranslation(TrKeys.newPassword),
                      onChanged: notifier.setNewPassword,
                      suffixIcon: IconButton(
                        splashRadius: 25,
                        icon: Icon(
                          state.showNewPassword
                              ? FlutterRemix.eye_line
                              : FlutterRemix.eye_close_line,
                          color: AppColors.black,
                        ),
                        onPressed: notifier.toggleNewPassword,
                      ),
                    ),
                    16.verticalSpace,
                    OutlinedBorderTextField(
                      obscure: state.showConfirmNewPassword,
                      label: AppHelpers.getTranslation(TrKeys.confirmNewPassword),
                      onChanged: notifier.setConfirmPassword,
                      isError: !state.isConfirmPasswordSame,
                      descriptionText: !state.isConfirmPasswordSame
                          ? AppHelpers.getTranslation(
                              TrKeys.confirmPasswordDoesntMatchWithNewPassword,
                            )
                          : null,
                      suffixIcon: IconButton(
                        splashRadius: 25,
                        icon: Icon(
                          state.showConfirmNewPassword
                              ? FlutterRemix.eye_line
                              : FlutterRemix.eye_close_line,
                          color: AppColors.black,
                        ),
                        onPressed: notifier.toggleConfirmPassword,
                      ),
                    ),
                    40.verticalSpace,
                    AccentLoginButton(
                      title: AppHelpers.getTranslation(TrKeys.save),
                      isLoading: state.isLoading,
                      onPressed: state.newPassword.length > 7 &&
                              state.confirmNewPassword.length > 7
                          ? () => notifier.updatePassword(context)
                          : null,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
