import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

import '../../theme/theme.dart';
import '../components.dart';

class SelectImage extends StatelessWidget {
  final Function(XFile file) onChangePhoto;
  final XFile? file;
  final String? imageUrl;
  final bool isLoading;

  const SelectImage({
    Key? key,
    required this.onChangePhoto,
    this.file,
    this.imageUrl,
    this.isLoading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130.r,
      width: 130.r,
      alignment: Alignment.center,
      child: Stack(
        fit: StackFit.passthrough,
        children: <Widget>[
          Positioned(
            top: 0,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.r),
              child: Container(
                width: 110.r,
                height: 110.r,
                decoration: BoxDecoration(
                  color: AppColors.mainBack,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Stack(
                  children: [
                    file != null
                        ? Image.file(
                            File(file!.path),
                            width: 110,
                            height: 110,
                            fit: BoxFit.cover,
                          )
                        : CommonImage(
                            imageUrl: imageUrl,
                            width: 110,
                            height: 110,
                            radius: 0,
                          ),
                    if (isLoading)
                      const JumpingDots(color: AppColors.accentGreen)
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 80.r,
            left: 87.r,
            child: Material(
              color: AppColors.black.withOpacity(0.62),
              borderRadius: BorderRadius.circular(20.r),
              child: InkWell(
                borderRadius: BorderRadius.circular(22),
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
                  height: 40.r,
                  width: 40.r,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.r),
                    border: Border.all(
                      width: 3,
                      color: AppColors.white,
                    ),
                  ),
                  child: Icon(
                    FlutterRemix.pencil_line,
                    color: AppColors.white,
                    size: 20.r,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
