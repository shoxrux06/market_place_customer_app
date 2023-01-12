import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/constants/constants.dart';
import '../../core/utils/utils.dart';
import '../theme/theme.dart';
import 'buttons/accent_login_button.dart';

class TimePickerModal extends StatefulWidget {
  final Function(DateTime) onSaved;
  final String? openTime;
  final String? closeTime;

  const TimePickerModal({
    Key? key,
    required this.onSaved,
    this.openTime,
    this.closeTime,
  }) : super(key: key);

  @override
  State<TimePickerModal> createState() => _TimePickerModalState();
}

class _TimePickerModalState extends State<TimePickerModal> {
  DateTime time = DateTime.now();

  @override
  void initState() {
    super.initState();
    time = widget.openTime == null
        ? DateTime.now()
        : AppHelpers.getMinTime(widget.openTime!);
  }

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = LocalStorage.instance.getAppThemeMode();
    return Padding(
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
                mode: CupertinoDatePickerMode.time,
                minimumDate: widget.openTime == null
                    ? DateTime.now()
                    : AppHelpers.getMinTime(widget.openTime!),
                maximumDate: widget.closeTime == null
                    ? null
                    : AppHelpers.getMaxTime(widget.closeTime!),
                use24hFormat: true,
                initialDateTime: widget.openTime == null
                    ? DateTime.now()
                    : AppHelpers.getMinTime(widget.openTime!),
                onDateTimeChanged: (DateTime value) {
                  time = value;
                },
              ),
            ),
          ),
          16.verticalSpace,
          AccentLoginButton(
            background: AppColors.black,
            title: AppHelpers.getTranslation(TrKeys.save),
            onPressed: () {
              widget.onSaved(time);
            },
          ),
          24.verticalSpace,
        ],
      ),
    );
  }
}
