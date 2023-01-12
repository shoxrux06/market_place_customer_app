import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/utils/utils.dart';
import '../../../../riverpod/provider/app_provider.dart';
import '../../../components/components.dart';
import '../../../theme/theme.dart';
import '../../main/view_map/riverpod/provider/view_map_provider.dart';
import 'riverpod/provider/select_lang_provider.dart';
import 'widgets/language_item.dart';

class SelectLanguagePage extends ConsumerStatefulWidget {
  final bool isRequired;

  const SelectLanguagePage({Key? key, this.isRequired = false})
      : super(key: key);

  @override
  ConsumerState<SelectLanguagePage> createState() => _SelectLanguagePageState();
}

class _SelectLanguagePageState extends ConsumerState<SelectLanguagePage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      Duration.zero,
      () {
        ref
            .read(selectLangProvider.notifier)
            .getLanguages(context, widget.isRequired);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(selectLangProvider);
    final notifier = ref.read(selectLangProvider.notifier);
    final appNotifier = ref.read(appProvider.notifier);
    final appState = ref.watch(appProvider);
    final bool isDarkMode = LocalStorage.instance.getAppThemeMode();
    return Directionality(
      textDirection: appState.isLtr ? TextDirection.ltr : TextDirection.rtl,
      child: Scaffold(
        backgroundColor:
            isDarkMode ? AppColors.dontHaveAnAccBackDark : AppColors.white,
        appBar: AppBar(
          leading: widget.isRequired
              ? const SizedBox()
              : IconButton(
                  splashRadius: 18.r,
                  onPressed: context.popRoute,
                  icon: Icon(
                    appState.isLtr
                        ? FlutterRemix.arrow_left_s_line
                        : FlutterRemix.arrow_right_s_line,
                    size: 24.r,
                    color: isDarkMode ? AppColors.white : AppColors.black,
                  ),
                ),
          leadingWidth: widget.isRequired ? 0 : null,
          title: Text(
            AppHelpers.getTranslation(TrKeys.selectLanguage),
            style: GoogleFonts.k2d(
              fontWeight: FontWeight.w600,
              fontSize: 16.sp,
              letterSpacing: -0.4,
              color: isDarkMode ? AppColors.white : AppColors.black,
            ),
          ),
          elevation: 0,
          backgroundColor:
              isDarkMode ? AppColors.dontHaveAnAccBackDark : AppColors.white,
        ),
        body: Stack(
          children: [
            state.isLoading
                ? JumpingDots(
                    color: isDarkMode ? AppColors.white : AppColors.black,
                  )
                : Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Divider(
                        height: 1.r,
                        thickness: 1.r,
                        color: AppColors.mainBack,
                      ),
                      Expanded(
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: state.languages.length,
                          physics: const CustomBouncingScrollPhysics(),
                          padding: REdgeInsets.symmetric(
                            horizontal: 15,
                            vertical: 20,
                          ),
                          itemBuilder: (context, index) {
                            final language = state.languages[index];
                            final bool isSelected =
                                state.selectedIndex == index;
                            return LanguageItem(
                              isSelected: isSelected,
                              language: language,
                              onTap: () => notifier.setLangIndex(index),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
            BlurLoadingWidget(isLoading: state.isSaving),
          ],
        ),
        bottomNavigationBar: Padding(
          padding: REdgeInsets.only(left: 15, right: 15, bottom: 30),
          child: AccentLoginButton(
            background: AppColors.black,
            title: AppHelpers.getTranslation(
              widget.isRequired ? TrKeys.next : TrKeys.save,
            ),
            onPressed: () {
              if (widget.isRequired) {
                notifier.makeSelectedLang(context, widget.isRequired);
                appNotifier.changeLocale(state.languages[state.selectedIndex]);
              } else {
                notifier.changeLang(
                  context,
                  appNotifier,
                  widget.isRequired,
                  afterUpdating: () {
                    ref.read(viewMapProvider.notifier).fetchShops(context);
                  },
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
