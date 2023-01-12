import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../../../../../core/constants/constants.dart';
import '../../../../../../core/utils/utils.dart';
import '../../../../../components/components.dart';
import '../../../../../theme/theme.dart';
import 'riverpod/provider/new_products_provider.dart';
import 'widgets/new_products_body.dart';
import 'widgets/new_products_search_filter_modal.dart';

class NewProductsPage extends ConsumerStatefulWidget {
  const NewProductsPage({Key? key}) : super(key: key);

  @override
  ConsumerState<NewProductsPage> createState() => _NewProductsPageState();
}

class _NewProductsPageState extends ConsumerState<NewProductsPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      Duration.zero,
      () {
        ref.read(newProductsProvider.notifier).fetchProducts(context);
        ref.read(newProductsProvider.notifier).fetchCategories(context);
        ref.read(newProductsProvider.notifier).fetchBrands(context);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = LocalStorage.instance.getAppThemeMode();
    final state = ref.watch(newProductsProvider);
    final notifier = ref.read(newProductsProvider.notifier);
    return KeyboardDismisser(
      child: Scaffold(
        backgroundColor:
            isDarkMode ? AppColors.dontHaveAnAccBackDark : AppColors.white,
        appBar: AppBarWithProductCount(
          title: AppHelpers.getTranslation(TrKeys.newProducts),
          onSearchChanged: (value) => notifier.setQuery(context, value.trim()),
          hasProductCount: false,
          onSearchFilterTapped: () {
            // showCupertinoModalBottomSheet(
            //   context: context,
            //   builder: (context) => const NewProductsSearchFilterModal(),
            // );
            AppHelpers.showCustomModalBottomSheet(
              context: context,
              modal: const NewProductsSearchFilterModal(),
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
            : const NewProductsBody(),
      ),
    );
  }
}
