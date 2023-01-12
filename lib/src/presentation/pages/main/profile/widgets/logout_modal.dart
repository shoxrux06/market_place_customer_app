import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../../../core/constants/constants.dart';
import '../../../../../core/routes/app_router.gr.dart';
import '../../../../../core/utils/utils.dart';
import '../../../../components/components.dart';
import '../../../../theme/theme.dart';

class LogoutModal extends StatelessWidget {
  const LogoutModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = LocalStorage.instance.getAppThemeMode();
    final bool isLtr = LocalStorage.instance.getLangLtr();
    return Directionality(
      textDirection: isLtr ? TextDirection.ltr : TextDirection.rtl,
      child: Padding(
        padding: REdgeInsets.symmetric(horizontal: 15),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            11.verticalSpace,
            Container(
              width: 49.r,
              height: 4.r,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(62.r),
                color: isDarkMode
                    ? AppColors.dragElementDark
                    : AppColors.dragElement,
              ),
            ),
            40.verticalSpace,
            Text(
              '${AppHelpers.getTranslation(TrKeys.doYouReallyWantToLogout)}?',
              style: GoogleFonts.k2d(
                fontSize: 18.sp,
                color: isDarkMode ? AppColors.white : AppColors.black,
                fontWeight: FontWeight.w500,
                letterSpacing: -14 * 0.02,
              ),
            ),
            36.verticalSpace,
            Row(
              children: [
                Expanded(
                  child: AccentLoginButton(
                    title: AppHelpers.getTranslation(TrKeys.cancel),
                    onPressed: () => context.popRoute(),
                  ),
                ),
                16.horizontalSpace,
                Expanded(
                  child: AccentLoginButton(
                    background: AppColors.red,
                    title: AppHelpers.getTranslation(TrKeys.yes),
                    onPressed: () {
                      if (LocalStorage.instance.getAuthenticatedWithSocial()) {
                        final GoogleSignIn signIn = GoogleSignIn();
                        signIn.disconnect();
                        signIn.signOut();
                      }
                      LocalStorage.instance.logout();
                      context.replaceRoute(const LoginRoute());
                    },
                  ),
                ),
              ],
            ),
            40.verticalSpace,
          ],
        ),
      ),
    );
  }
}
