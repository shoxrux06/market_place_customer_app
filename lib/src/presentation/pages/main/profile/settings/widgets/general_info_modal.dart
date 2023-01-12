import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../core/constants/constants.dart';
import '../../../../../../core/utils/utils.dart';
import '../../../../../components/components.dart';
import '../../../../../theme/theme.dart';
import '../riverpod/provider/profile_settings_provider.dart';

class GeneralInfoModal extends ConsumerWidget {
  const GeneralInfoModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(profileSettingsProvider);
    final notifier = ref.read(profileSettingsProvider.notifier);
    final bool isDarkMode = LocalStorage.instance.getAppThemeMode();
    final bool isLtr = LocalStorage.instance.getLangLtr();
    return Directionality(
      textDirection: isLtr ? TextDirection.ltr : TextDirection.rtl,
      child: AbsorbPointer(
        absorbing: state.isSaving,
        child: KeyboardDismisser(
          child: AnimatedPadding(
            padding: REdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            duration: const Duration(milliseconds: 150),
            child: Padding(
              padding: REdgeInsets.symmetric(horizontal: 15),
              child: SingleChildScrollView(
                physics: const CustomBouncingScrollPhysics(),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    11.verticalSpace,
                    Container(
                      width: 49.r,
                      height: 3.r,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(62.r),
                        color: isDarkMode
                            ? AppColors.dragElementDark
                            : AppColors.dragElement,
                      ),
                    ),
                    13.verticalSpace,
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        AppHelpers.getTranslation(TrKeys.generalInfo)
                            .toUpperCase(),
                        style: GoogleFonts.k2d(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500,
                          color: isDarkMode ? AppColors.white : AppColors.black,
                          letterSpacing: -14 * 0.01,
                        ),
                      ),
                    ),
                    28.verticalSpace,
                    OutlinedBorderTextField(
                      label: AppHelpers.getTranslation(TrKeys.firstname),
                      initialText: state.firstName,
                      onChanged: notifier.setFirstName,
                    ),
                    14.verticalSpace,
                    OutlinedBorderTextField(
                      label: AppHelpers.getTranslation(TrKeys.lastname),
                      initialText: state.lastName,
                      onChanged: notifier.setLastName,
                    ),
                    14.verticalSpace,
                    PopupMenuButton<String>(
                      initialValue: state.male,
                      elevation: 0,
                      itemBuilder: (context) {
                        return [
                          PopupMenuItem<String>(
                            value: 'male',
                            child: Text(
                              AppHelpers.getTranslation(TrKeys.male),
                              style: GoogleFonts.k2d(
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w500,
                                color: isDarkMode
                                    ? AppColors.white
                                    : AppColors.black,
                              ),
                            ),
                          ),
                          PopupMenuItem<String>(
                            value: 'female',
                            child: Text(
                              AppHelpers.getTranslation(TrKeys.female),
                              style: GoogleFonts.k2d(
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w500,
                                color: isDarkMode
                                    ? AppColors.white
                                    : AppColors.black,
                              ),
                            ),
                          ),
                        ];
                      },
                      onSelected: notifier.setMale,
                      child: Container(
                        height: 58.r,
                        padding: REdgeInsets.symmetric(horizontal: 15),
                        decoration: BoxDecoration(
                          color: isDarkMode
                              ? AppColors.dontHaveAnAccBackDark
                              : AppColors.white,
                          borderRadius: BorderRadius.circular(8.r),
                          border: Border.all(
                            color: isDarkMode
                                ? AppColors.borderDark
                                : AppColors.borderColor,
                            width: 1.r,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  AppHelpers.getTranslation(TrKeys.gender),
                                  style: GoogleFonts.k2d(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w400,
                                    color: isDarkMode
                                        ? AppColors.white
                                        : AppColors.black,
                                    letterSpacing: -14 * 0.01,
                                  ),
                                ),
                                5.verticalSpace,
                                Text(
                                  state.male == 'male'
                                      ? AppHelpers.getTranslation(TrKeys.male)
                                      : AppHelpers.getTranslation(
                                          TrKeys.female,
                                        ),
                                  style: GoogleFonts.k2d(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w500,
                                    color: isDarkMode
                                        ? AppColors.white
                                        : AppColors.black,
                                    letterSpacing: -14 * 0.01,
                                  ),
                                ),
                              ],
                            ),
                            Icon(
                              FlutterRemix.arrow_down_s_line,
                              color: isDarkMode
                                  ? AppColors.white
                                  : AppColors.black,
                              size: 18.r,
                            ),
                          ],
                        ),
                      ),
                    ),
                    14.verticalSpace,
                    OutlinedSelectButton(
                      label: AppHelpers.getTranslation(TrKeys.dateOfBirth),
                      text: state.dob,
                      trailingIconData: FlutterRemix.calendar_event_line,
                      onPressed: () {
                        // showCupertinoModalBottomSheet(
                        //   context: context,
                        //   builder: (context) => CustomDatePickerModal(
                        //     initialDate: state.dob,
                        //     onDateSaved: notifier.setDob,
                        //   ),
                        // );
                        showModalBottomSheet(
                          context: context,
                          builder: (context) => CustomDatePickerModal(
                            initialDate: state.dob,
                            onDateSaved: notifier.setDob,
                          ),
                        );
                      },
                    ),
                    14.verticalSpace,
                    OutlinedBorderTextField(
                      label: AppHelpers.getTranslation(TrKeys.phoneNumber),
                      initialText: state.phone,
                      inputType: TextInputType.phone,
                      readOnly: !state.isPhoneEditable,
                      onChanged: notifier.setPhone,
                    ),
                    14.verticalSpace,
                    OutlinedBorderTextField(
                      label: AppHelpers.getTranslation(TrKeys.email),
                      initialText: state.email,
                      inputType: TextInputType.emailAddress,
                      readOnly: state.email.isNotEmpty,
                    ),
                    30.verticalSpace,
                    AccentLoginButton(
                      isLoading: state.isSaving,
                      background:
                          isDarkMode ? AppColors.white : AppColors.black,
                      title: AppHelpers.getTranslation(TrKeys.save),
                      textColor: isDarkMode ? AppColors.black : AppColors.white,
                      onPressed: () => notifier.updateGeneralInfo(context),
                    ),
                    40.verticalSpace,
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
