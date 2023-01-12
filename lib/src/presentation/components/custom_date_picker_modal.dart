import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/constants/constants.dart';
import '../../core/utils/utils.dart';
import '../theme/theme.dart';
import 'buttons/accent_login_button.dart';

class CustomDatePickerModal extends StatefulWidget {
  final String initialDate;
  final Function(DateTime? date) onDateSaved;

  const CustomDatePickerModal({
    Key? key,
    required this.initialDate,
    required this.onDateSaved,
  }) : super(key: key);

  @override
  State<CustomDatePickerModal> createState() => _CustomDatePickerModalState();
}

class _CustomDatePickerModalState extends State<CustomDatePickerModal> {
  DateTime? date;

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = LocalStorage.instance.getAppThemeMode();
    return Material(
      color: isDarkMode ? AppColors.dontHaveAnAccBackDark : AppColors.white,
      child: Padding(
        padding: REdgeInsets.symmetric(horizontal: 15),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            24.verticalSpace,
            SizedBox(
              height: 300.r,
              child: CupertinoTheme(
                data: CupertinoThemeData(
                  brightness: isDarkMode ? Brightness.dark : Brightness.light,
                ),
                child: CupertinoDatePicker(
                  mode: CupertinoDatePickerMode.date,
                  initialDateTime: widget.initialDate.isEmpty
                      ? DateTime.now()
                      : DateTime.parse(widget.initialDate),
                  onDateTimeChanged: (DateTime value) {
                    date = value;
                  },
                ),
              ),
            ),
            16.verticalSpace,
            AccentLoginButton(
              background: isDarkMode ? AppColors.white : AppColors.black,
              title: AppHelpers.getTranslation(TrKeys.save),
              textColor: isDarkMode ? AppColors.black : AppColors.white,
              onPressed: () {
                widget.onDateSaved(date);
                context.popRoute();
              },
            ),
            24.verticalSpace,
          ],
        ),
      ),
    );
  }
}
