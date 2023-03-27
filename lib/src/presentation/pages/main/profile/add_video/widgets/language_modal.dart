import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_customer/src/presentation/components/blur_loading.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../../../core/constants/constants.dart';
import '../../../../../../core/utils/app_helpers.dart';
import '../../../../../../core/utils/local_storage.dart';
import '../../../../../components/components.dart';
import '../../../../../theme/app_colors.dart';
import 'package:video_compress/video_compress.dart';


import '../add_video_page.dart';
import '../riverpod/provider/add_video_provider.dart';

class LanguageModal extends ConsumerStatefulWidget {
  const LanguageModal({Key? key}) : super(key: key);

  @override
  ConsumerState<LanguageModal> createState() => _LanguageModalState();
}

class _LanguageModalState extends ConsumerState<LanguageModal> {


  @override
  Widget build(BuildContext context) {
    final  state = ref.watch(addVideoProvider);
    final notifier = ref.watch(addVideoProvider.notifier);
    final bool isDarkMode = LocalStorage.instance.getAppThemeMode();

    final bool isLtr = LocalStorage.instance.getLangLtr();
    return Directionality(
      textDirection: isLtr ? TextDirection.ltr : TextDirection.rtl,
      child: Padding(
        padding: REdgeInsets.symmetric(horizontal: 15),
        child: state.isCompressingVideo?Center(child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            JumpingDots(
              color: isDarkMode ? AppColors.white : AppColors.black,
            ),
            SizedBox(height: 12,),
            Text(
              AppHelpers.getTranslation(TrKeys.pleaseWaitVideoIsComp),
              textAlign: TextAlign.center,
              style: GoogleFonts.k2d(
                fontWeight: FontWeight.w500,
                fontSize: 18.sp,
                color: isDarkMode ? AppColors.white : AppColors.black,
                letterSpacing: -14 * 0.03,
              ),
            ),
          ],
        )):Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            11.verticalSpace,
            Text(
              AppHelpers.getTranslation(TrKeys.selectSource),
              style: GoogleFonts.k2d(
                fontWeight: FontWeight.w500,
                fontSize: 14.sp,
                color: isDarkMode ? AppColors.white : AppColors.black,
                letterSpacing: -14 * 0.03,
              ),
            ),
            16.verticalSpace,
            TextButton(
              style: ButtonStyle  (
                overlayColor: MaterialStateColor.resolveWith(
                      (states) => isDarkMode
                      ? AppColors.mainBackDark
                      : AppColors.dontHaveAccBtnBack,
                ),
              ),
              onPressed: () {
                notifier.getFromCamera(context);
                if(!mounted) return;
                print('videoFile in modal --> ${state.videoFile}');
              },
              child: Row(
                children: [
                  Icon(
                    Icons.camera_alt,
                    size: 20.r,
                    color: isDarkMode ? AppColors.white : AppColors.black,
                  ),
                  5.horizontalSpace,
                  Text(
                    AppHelpers.getTranslation(TrKeys.fromCamera),
                    style: GoogleFonts.k2d(
                      fontWeight: FontWeight.w500,
                      fontSize: 14.sp,
                      color: isDarkMode ? AppColors.white : AppColors.black,
                      letterSpacing: -14 * 0.03,
                    ),
                  ),
                ],
              ),
            ),
            TextButton(
              style: ButtonStyle(
                overlayColor: MaterialStateColor.resolveWith(
                      (states) => isDarkMode
                      ? AppColors.mainBackDark
                      : AppColors.dontHaveAccBtnBack,
                ),
              ),
              onPressed: (){
                notifier.getFromGallery(context);
                if(!mounted) return;
                print('videoFile in modal --> ${state.videoFile}');
              },
              child: Row(
                children: [
                  Icon(
                    Icons.file_copy,
                    size: 20.r,
                    color: isDarkMode ? AppColors.white : AppColors.black,
                  ),
                  5.horizontalSpace,
                  Text(
                    AppHelpers.getTranslation(TrKeys.fromGallery),
                    style: GoogleFonts.k2d(
                      fontWeight: FontWeight.w500,
                      fontSize: 14.sp,
                      color: isDarkMode ? AppColors.white : AppColors.black,
                      letterSpacing: -14 * 0.03,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
