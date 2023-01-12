import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../core/utils/utils.dart';
import '../../../../theme/theme.dart';

class SelectReviewImageButton extends StatelessWidget {
  final Function(XFile file) onChangePhoto;
  final XFile? file;

  const SelectReviewImageButton({
    Key? key,
    required this.onChangePhoto,
    this.file,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = LocalStorage.instance.getAppThemeMode();
    return Material(
      borderRadius: BorderRadius.circular(10.r),
      color: isDarkMode ? AppColors.mainBackDark : AppColors.white,
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
          width: 50.r,
          height: 50.r,
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
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                )
              : Icon(
                  FlutterRemix.attachment_2,
                  size: 22.r,
                  color: isDarkMode ? AppColors.white : AppColors.black,
                ),
        ),
      ),
    );
  }
}
