import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
// import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../../core/utils/utils.dart';
import '../../theme/theme.dart';
import '../date_picker_modal.dart';

class SelectDateButton extends StatelessWidget {
  final DateTime date;
  final Function(DateTime) onDateSaved;

  const SelectDateButton({
    Key? key,
    required this.date,
    required this.onDateSaved,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = LocalStorage.instance.getAppThemeMode();
    return Material(
      borderRadius: BorderRadius.circular(8.r),
      color: isDarkMode ? AppColors.mainBackDark : AppColors.dontHaveAccBtnBack,
      child: InkWell(
        onTap: () {
          AppHelpers.showCustomModalBottomSheet(
            context: context,
            modal: DatePickerModal(onDateSaved: onDateSaved),
            isDarkMode: isDarkMode,
          );
        },
        borderRadius: BorderRadius.circular(8.r),
        child: Container(
          height: 51.r,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
          ),
          padding: REdgeInsets.symmetric(horizontal: 16),
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                DateFormat('yyyy-MM-dd').format(date),
                style: GoogleFonts.k2d(
                  fontWeight: FontWeight.w500,
                  fontSize: 16.sp,
                  color: isDarkMode ? AppColors.white : AppColors.black,
                  letterSpacing: -0.4,
                ),
              ),
              Icon(
                FlutterRemix.calendar_fill,
                size: 24.r,
                color: isDarkMode ? AppColors.white : AppColors.black,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
