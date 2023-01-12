import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/utils/utils.dart';
import '../../../components/components.dart';
import '../../../theme/theme.dart';
import 'riverpod/provider/reset_password_provider.dart';

class ResetPasswordPage extends ConsumerWidget {
  const ResetPasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(resetPasswordProvider.notifier);
    final state = ref.watch(resetPasswordProvider);
    final bool isDarkMode = LocalStorage.instance.getAppThemeMode();
    final bool isLtr = LocalStorage.instance.getLangLtr();
    return Directionality(
      textDirection: isLtr ? TextDirection.ltr : TextDirection.rtl,
      child: AbsorbPointer(
        absorbing: state.isLoading,
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
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 16.r,
                  color:
                      isDarkMode ? AppColors.mainBackDark : AppColors.mainBack,
                ),
                Padding(
                  padding: REdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      18.verticalSpace,
                      Text(
                        AppHelpers.getTranslation(TrKeys.resetPassword),
                        style: GoogleFonts.k2d(
                          fontWeight: FontWeight.w500,
                          fontSize: 18.sp,
                          color: isDarkMode ? AppColors.white : AppColors.black,
                        ),
                      ),
                      26.verticalSpace,
                      OutlinedBorderTextField(
                        label: AppHelpers.getTranslation(TrKeys.phone),
                        onChanged: notifier.setPhone,
                        inputType: TextInputType.phone,
                        textCapitalization: TextCapitalization.none,
                        isError: state.isPhoneError,
                        descriptionText: state.isPhoneError
                            ? AppHelpers.getTranslation(
                                TrKeys.phoneNumberIsNotValid)
                            : null,
                      ),
                      50.verticalSpace,
                      AccentLoginButton(
                        title: AppHelpers.getTranslation(TrKeys.sendSmsCode),
                        isLoading: state.isLoading,
                        onPressed: state.phone.length > 3
                            ? () => notifier.sendCode(context)
                            : null,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
