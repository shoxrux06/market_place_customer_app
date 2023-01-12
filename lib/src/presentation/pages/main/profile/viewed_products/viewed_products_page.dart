import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../../../../core/constants/constants.dart';
import '../../../../../core/utils/utils.dart';
import '../../../../components/components.dart';
import '../../../../theme/theme.dart';
import 'riverpod/provider/viewed_products_provider.dart';
import 'widgets/viewed_products_body.dart';
import 'widgets/viewed_products_search_filter_modal.dart';

class ViewedProductsPage extends ConsumerStatefulWidget {
  const ViewedProductsPage({Key? key}) : super(key: key);

  @override
  ConsumerState<ViewedProductsPage> createState() => _ViewedProductsPageState();
}

class _ViewedProductsPageState extends ConsumerState<ViewedProductsPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      Duration.zero,
      () {
        ref.read(viewedProductsProvider.notifier).fetchViewedProducts(context);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(viewedProductsProvider);
    final notifier = ref.read(viewedProductsProvider.notifier);
    final bool isDarkMode = LocalStorage.instance.getAppThemeMode();
    final bool isLtr = LocalStorage.instance.getLangLtr();
    return Directionality(
      textDirection: isLtr ? TextDirection.ltr : TextDirection.rtl,
      child: KeyboardDismisser(
        child: Scaffold(
          backgroundColor:
              isDarkMode ? AppColors.dontHaveAnAccBackDark : AppColors.white,
          appBar: AppBarWithProductCount(
            title: AppHelpers.getTranslation(TrKeys.viewedProducts),
            count: state.filteredProducts.length,
            onSearchChanged: (String value) =>
                notifier.setQuery(context, value.trim()),
            onSearchFilterTapped: () {
              AppHelpers.showCustomModalBottomSheet(
                context: context,
                modal: const ViewedProductsSearchFilterModal(),
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
              : const ViewedProductsBody(),
        ),
      ),
    );
  }
}
