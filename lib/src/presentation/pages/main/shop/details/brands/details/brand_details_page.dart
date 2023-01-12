import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../../../../../../core/constants/constants.dart';
import '../../../../../../../core/utils/utils.dart';
import '../../../../../../components/components.dart';
import '../../../../../../theme/theme.dart';
import 'riverpod/provider/brand_details_provider.dart';
import 'widgets/brand_details_body.dart';
import 'widgets/brand_products_search_filter_modal.dart';

class BrandDetailsPage extends ConsumerStatefulWidget {
  final int id;

  const BrandDetailsPage({Key? key, required this.id}) : super(key: key);

  @override
  ConsumerState<BrandDetailsPage> createState() => _BrandDetailsPageState();
}

class _BrandDetailsPageState extends ConsumerState<BrandDetailsPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      Duration.zero,
      () {
        ref
            .read(brandDetailsProvider.notifier)
            .fetchBrandDetails(context, widget.id);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(brandDetailsProvider);
    final notifier = ref.read(brandDetailsProvider.notifier);
    final bool isDarkMode = LocalStorage.instance.getAppThemeMode();
    return state.isLoading
        ? Scaffold(
            backgroundColor: isDarkMode
                ? AppColors.dontHaveAnAccBackDark
                : AppColors.mainBack,
            body: JumpingDots(
              color: isDarkMode ? AppColors.white : AppColors.black,
            ),
          )
        : KeyboardDismisser(
            child: Scaffold(
              backgroundColor: isDarkMode
                  ? AppColors.dontHaveAnAccBackDark
                  : AppColors.mainBack,
              appBar: AppBarWithProductCount(
                title: state.brand?.title ??
                    AppHelpers.getTranslation(TrKeys.brands),
                onSearchChanged: (value) =>
                    notifier.setQuery(context, value.trim()),
                onSearchFilterTapped: () {
                  // showCupertinoModalBottomSheet(
                  //   context: context,
                  //   builder: (context) =>
                  //       const BrandProductsSearchFilterModal(),
                  // );
                  AppHelpers.showCustomModalBottomSheet(
                    context: context,
                    modal: const BrandProductsSearchFilterModal(),
                    isDarkMode: isDarkMode,
                  );
                },
              ),
              body: state.isSearching
                  ? ProductSearchBody(
                      isSearchLoading: state.isSearchLoading,
                      searchedProducts: state.searchedProducts,
                      query: state.query.trim(),
                    )
                  : const BrandDetailsBody(),
            ),
          );
  }
}
