import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/constants/constants.dart';
import '../../../../../core/routes/app_router.gr.dart';
import '../../../../../core/utils/utils.dart';
import '../../../../../riverpod/provider/app_provider.dart';
import '../../../../components/components.dart';
import '../../../../theme/theme.dart';
import 'riverpod/provider/system_settings_provider.dart';
import 'widgets/change_theme_button.dart';
import 'widgets/currencies_modal.dart';

class SystemSettingsPage extends ConsumerWidget {
  const SystemSettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(systemSettingsProvider.notifier);
    final appState = ref.watch(appProvider);
    final appNotifier = ref.read(appProvider.notifier);
    return Directionality(
      textDirection: appState.isLtr ? TextDirection.ltr : TextDirection.rtl,
      child: Scaffold(
        backgroundColor:
            appState.isDarkMode ? AppColors.mainBackDark : AppColors.white,
        appBar: CommonAppBar(
          title: AppHelpers.getTranslation(TrKeys.systemSettings),
          onLeadingPressed: context.popRoute,
        ),
        body: Column(
          children: [
            Divider(
              height: 1.r,
              thickness: 1.r,
              color: appState.isDarkMode
                  ? AppColors.white.withOpacity(0.06)
                  : AppColors.mainBack,
            ),
            30.verticalSpace,
            Padding(
              padding: REdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  OpenModalButton(
                    iconData: FlutterRemix.global_fill,
                    title:
                        '${AppHelpers.getTranslation(TrKeys.language)} - ${LocalStorage.instance.getLanguage()?.title}',
                    onTap: () => context.pushRoute(SelectLanguageRoute()),
                  ),
                  10.verticalSpace,
                  OpenModalButton(
                    iconData: FlutterRemix.money_dollar_circle_fill,
                    title:
                        '${AppHelpers.getTranslation(TrKeys.currency)} - ${LocalStorage.instance.getSelectedCurrency().title}',
                    onTap: () {
                      notifier.fetchCurrencies(context);
                      AppHelpers.showCustomModalBottomSheet(
                        context: context,
                        modal: const CurrenciesModal(),
                        isDarkMode: appState.isDarkMode,
                      );
                    },
                  ),
                  10.verticalSpace,
                  ChangeThemeButton(
                    isDarkMode: appState.isDarkMode,
                    onToggle: appNotifier.changeTheme,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
