import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../../../core/constants/constants.dart';
import '../../../../../../core/utils/app_helpers.dart';
import '../../../../../../core/utils/local_storage.dart';
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

  Future<void> baseFunc({required ImageSource source}) async {
    XFile? theVideo = await ImagePicker().pickVideo(source: source);

    File? inFile;

    inFile = File(theVideo?.path ?? '');

    if(theVideo != null) {
      Navigator.of(context).pop();
      AppHelpers.showCustomModalBottomSheetVideo(
        context: context,
        modal: AddVideoPage(videoFile: inFile,),
        isDarkMode: false,
      );
    }
  }

  getFromCamera() async {
    await baseFunc(source: ImageSource.camera);
  }

  getFromGallery() async {
    await baseFunc(source: ImageSource.gallery);
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(addVideoProvider);
    final bool isDarkMode = LocalStorage.instance.getAppThemeMode();
    if(state.isCompressingVideo){
      print('Compressed ***');
      Navigator.of(context).pop();
    }
    final bool isLtr = LocalStorage.instance.getLangLtr();
    return Directionality(
      textDirection: isLtr ? TextDirection.ltr : TextDirection.rtl,
      child: Padding(
        padding: REdgeInsets.symmetric(horizontal: 15),
        child: Column(
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
              style: ButtonStyle(
                overlayColor: MaterialStateColor.resolveWith(
                      (states) => isDarkMode
                      ? AppColors.mainBackDark
                      : AppColors.dontHaveAccBtnBack,
                ),
              ),
              onPressed: () async {
                getFromCamera();
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
              onPressed: () {
                getFromGallery();
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
