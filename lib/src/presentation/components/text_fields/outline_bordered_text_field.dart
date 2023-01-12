import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/utils/utils.dart';
import '../../theme/theme.dart';

class OutlinedBorderTextField extends StatelessWidget {
  final String label;
  final Widget? suffixIcon;
  final bool? obscure;
  final TextEditingController? textController;
  final Function(String)? onChanged;
  final TextInputType? inputType;
  final String? initialText;
  final String? descriptionText;
  final bool readOnly;
  final bool isError;
  final bool isSuccess;
  final TextCapitalization? textCapitalization;
  final TextInputAction? textInputAction;

  const OutlinedBorderTextField({
    Key? key,
    required this.label,
    this.suffixIcon,
    this.obscure,
    this.onChanged,
    this.textController,
    this.inputType,
    this.initialText,
    this.descriptionText,
    this.readOnly = false,
    this.isError = false,
    this.isSuccess = false,
    this.textCapitalization,
    this.textInputAction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = LocalStorage.instance.getAppThemeMode();
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: isDarkMode ? AppColors.mainBackDark : AppColors.white,
            borderRadius: BorderRadius.circular(8.r),
            border: Border.all(
              width: 1.r,
              style: BorderStyle.solid,
              color: isError
                  ? AppColors.red
                  : isSuccess
                      ? AppColors.accentGreen
                      : isDarkMode
                          ? AppColors.borderDark
                          : AppColors.borderColor,
            ),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.r),
            child: TextFormField(
              onChanged: onChanged,
              obscureText: !(obscure ?? true),
              obscuringCharacter: '*',
              controller: textController,
              style: GoogleFonts.k2d(
                fontWeight: FontWeight.w500,
                fontSize: 15.sp,
                color: isDarkMode ? AppColors.white : AppColors.black,
                letterSpacing: -14 * 0.01,
              ),
              cursorWidth: 1,
              cursorColor: isDarkMode ? AppColors.white : AppColors.black,
              keyboardType: inputType,
              initialValue: initialText,
              readOnly: readOnly,
              textCapitalization:
                  textCapitalization ?? TextCapitalization.sentences,
              textInputAction: textInputAction,
              decoration: InputDecoration(
                suffixIcon: suffixIcon,
                labelText: label,
                contentPadding:
                    REdgeInsets.symmetric(horizontal: 15, vertical: 13),
                floatingLabelStyle: GoogleFonts.k2d(
                  fontWeight: FontWeight.w400,
                  fontSize: 12.sp,
                  color: isDarkMode ? AppColors.white : AppColors.black,
                  letterSpacing: -14 * 0.01,
                ),
                fillColor: isDarkMode
                    ? AppColors.dontHaveAnAccBackDark
                    : AppColors.white,
                filled: true,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                border: InputBorder.none,
                focusedErrorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
            ),
          ),
        ),
        if (descriptionText != null)
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              4.verticalSpace,
              Text(
                descriptionText!,
                style: GoogleFonts.k2d(
                  fontWeight: FontWeight.w400,
                  letterSpacing: -0.3,
                  fontSize: 12.sp,
                  color: isError
                      ? AppColors.red
                      : isSuccess
                          ? AppColors.accentGreen
                          : AppColors.black,
                ),
              ),
            ],
          )
      ],
    );
  }
}
