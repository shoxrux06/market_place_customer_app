import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/constants/constants.dart';
import '../../../../../core/utils/utils.dart';
import '../../../../components/components.dart';
import '../../../../theme/theme.dart';
import 'riverpod/provider/profile_settings_provider.dart';
import 'widgets/change_password_modal.dart';
import 'widgets/general_info_modal.dart';

class ProfileSettingsPage extends ConsumerStatefulWidget {
  const ProfileSettingsPage({Key? key}) : super(key: key);

  @override
  ConsumerState<ProfileSettingsPage> createState() =>
      _ProfileSettingsPageState();
}

class _ProfileSettingsPageState extends ConsumerState<ProfileSettingsPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      Duration.zero,
      () {
        ref.read(profileSettingsProvider.notifier).fetchProfileDetails(context);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(profileSettingsProvider);
    final notifier = ref.read(profileSettingsProvider.notifier);
    final bool isDarkMode = LocalStorage.instance.getAppThemeMode();
    final bool isLtr = LocalStorage.instance.getLangLtr();
    return Directionality(
      textDirection: isLtr ? TextDirection.ltr : TextDirection.rtl,
      child: AbsorbPointer(
        absorbing: state.isLoading || state.isSaving,
        child: Scaffold(
          backgroundColor:
              isDarkMode ? AppColors.mainBackDark : AppColors.white,
          appBar: CommonAppBar(
            title: AppHelpers.getTranslation(TrKeys.profileSettings),
            onLeadingPressed: context.popRoute,
          ),
          body: state.isLoading
              ? JumpingDots(
                  color: isDarkMode ? AppColors.white : AppColors.black,
                )
              : Column(
                  children: [
                    Container(
                      height: 1.r,
                      color: isDarkMode
                          ? AppColors.white.withOpacity(0.06)
                          : AppColors.mainBack,
                    ),
                    Padding(
                      padding: REdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        children: [
                          21.verticalSpace,
                          SelectImage(
                            imageUrl: state.imageUrl,
                            onChangePhoto: (file) =>
                                notifier.updateProfileImage(context, file),
                            isLoading: state.isUpdatingImage,
                          ),
                          20.verticalSpace,
                          OpenModalButton(
                            iconData: FlutterRemix.settings_4_fill,
                            title:
                                AppHelpers.getTranslation(TrKeys.generalInfo),
                            onTap: () {
                              AppHelpers.showCustomModalBottomSheet(
                                context: context,
                                modal: const GeneralInfoModal(),
                                isDarkMode: isDarkMode,
                              );
                            },
                          ),
                          10.verticalSpace,
                          if (!LocalStorage.instance
                              .getAuthenticatedWithSocial())
                            OpenModalButton(
                              iconData: FlutterRemix.lock_2_fill,
                              title: AppHelpers.getTranslation(
                                  TrKeys.changePassword),
                              onTap: () {
                                AppHelpers.showCustomModalBottomSheet(
                                  context: context,
                                  modal: const ChangePasswordModal(),
                                  isDarkMode: isDarkMode,
                                );
                              },
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
