import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../core/constants/constants.dart';
import '../../../../../../core/utils/utils.dart';
import '../../../../../components/components.dart';
import '../../../../../theme/app_colors.dart';
import '../riverpod/provider/profile_settings_provider.dart';

class ChangePasswordModal extends ConsumerWidget {
  const ChangePasswordModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(profileSettingsProvider);
    final notifier = ref.read(profileSettingsProvider.notifier);
    final bool isDarkMode = LocalStorage.instance.getAppThemeMode();
    final bool isLtr = LocalStorage.instance.getLangLtr();
    return Directionality(
      textDirection: isLtr ? TextDirection.ltr : TextDirection.rtl,
      child: AbsorbPointer(
        absorbing: state.isSaving,
        child: KeyboardDismisser(
          child: AnimatedPadding(
            padding: REdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            duration: const Duration(milliseconds: 150),
            child: Padding(
              padding: REdgeInsets.symmetric(horizontal: 15),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  11.verticalSpace,
                  Container(
                    width: 49.r,
                    height: 3.r,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(62.r),
                      color: isDarkMode
                          ? AppColors.dragElementDark
                          : AppColors.dragElement,
                    ),
                  ),
                  13.verticalSpace,
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      AppHelpers.getTranslation(TrKeys.changePassword)
                          .toUpperCase(),
                      style: GoogleFonts.k2d(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500,
                        color: isDarkMode ? AppColors.white : AppColors.black,
                      ),
                    ),
                  ),
                  28.verticalSpace,
                  OutlinedBorderTextField(
                    label: AppHelpers.getTranslation(TrKeys.newPassword),
                    obscure: state.isVisibleNew,
                    onChanged: notifier.setNewPassword,
                    suffixIcon: IconButton(
                      splashRadius: 25,
                      icon: Icon(
                        state.isVisibleNew
                            ? FlutterRemix.eye_line
                            : FlutterRemix.eye_close_line,
                        color: isDarkMode ? AppColors.white : AppColors.black,
                        size: 20.r,
                      ),
                      onPressed: () => notifier.toggleNewPasswordVisibility(),
                    ),
                  ),
                  14.verticalSpace,
                  OutlinedBorderTextField(
                    label: AppHelpers.getTranslation(TrKeys.confirmNewPassword),
                    obscure: state.isVisibleConfirm,
                    onChanged: notifier.setConfirmPassword,
                    suffixIcon: IconButton(
                      splashRadius: 25,
                      icon: Icon(
                        state.isVisibleConfirm
                            ? FlutterRemix.eye_line
                            : FlutterRemix.eye_close_line,
                        color: isDarkMode ? AppColors.white : AppColors.black,
                        size: 20.r,
                      ),
                      onPressed: () =>
                          notifier.toggleConfirmPasswordVisibility(),
                    ),
                  ),
                  30.verticalSpace,
                  AccentLoginButton(
                    background: isDarkMode ? AppColors.white : AppColors.black,
                    title: AppHelpers.getTranslation(TrKeys.save),
                    isLoading: state.isSaving,
                    textColor: isDarkMode ? AppColors.black : AppColors.white,
                    onPressed: () => notifier.updatePassword(context),
                  ),
                  40.verticalSpace,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
