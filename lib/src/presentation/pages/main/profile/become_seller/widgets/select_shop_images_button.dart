import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../../core/utils/utils.dart';
import '../../../../../theme/theme.dart';

class SelectShopImagesButton extends StatelessWidget {
  final Function(XFile file) onChangePhoto;
  final XFile? file;
  final String title;

  const SelectShopImagesButton({
    Key? key,
    required this.onChangePhoto,
    required this.title,
    this.file,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = LocalStorage.instance.getAppThemeMode();
    return Material(
      borderRadius: BorderRadius.circular(10.r),
      color: isDarkMode ? AppColors.dontHaveAnAccBackDark : AppColors.white,
      child: InkWell(
        borderRadius: BorderRadius.circular(10.r),
        onTap: () async {
          final XFile? pickedFile = await ImagePicker().pickImage(
            source: ImageSource.gallery,
            maxWidth: 1000,
            maxHeight: 1000,
            imageQuality: 90,
          );
          if (pickedFile != null) {
            onChangePhoto(pickedFile);
          }
        },
        child: Container(
          height: 130.r,
          decoration: BoxDecoration(
            border: Border.all(
              width: 1.r,
              color: isDarkMode
                  ? AppColors.borderDark
                  : AppColors.attachmentBorder,
            ),
            borderRadius: BorderRadius.circular(10.r),
          ),
          alignment: Alignment.center,
          child: file != null
              ? ClipRRect(
                  borderRadius: BorderRadius.circular(10.r),
                  child: Image.file(
                    File(file!.path),
                    width: double.infinity,
                    height: 130,
                    fit: BoxFit.cover,
                  ),
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      FlutterRemix.upload_cloud_2_line,
                      size: 26.r,
                      color: isDarkMode ? AppColors.white : AppColors.black,
                    ),
                    8.verticalSpace,
                    Text(
                      title,
                      style: GoogleFonts.k2d(
                        fontWeight: FontWeight.w400,
                        fontSize: 12.sp,
                        letterSpacing: -14 * 0.01,
                        color: isDarkMode ? AppColors.white : AppColors.black,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
