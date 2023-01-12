import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../../../../../core/utils/utils.dart';
import '../../../../../components/components.dart';
import '../../../../../theme/theme.dart';
import 'riverpod/provider/category_products_provider.dart';
import 'widgets/category_products_body.dart';
import 'widgets/category_products_search_filter_modal.dart';

class CategoryProductsPage extends ConsumerStatefulWidget {
  final int? id;
  final String? title;

  const CategoryProductsPage({Key? key, this.id, this.title}) : super(key: key);

  @override
  ConsumerState<CategoryProductsPage> createState() =>
      _CategoryProductsPageState();
}

class _CategoryProductsPageState extends ConsumerState<CategoryProductsPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      Duration.zero,
      () {
        ref
            .read(categoryProductsProvider.notifier)
            .fetchProducts(context, widget.id);
        ref.read(categoryProductsProvider.notifier).fetchBrands(context);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(categoryProductsProvider);
    final notifier = ref.read(categoryProductsProvider.notifier);
    final bool isDarkMode = LocalStorage.instance.getAppThemeMode();
    return KeyboardDismisser(
      child: Scaffold(
        backgroundColor:
            isDarkMode ? AppColors.dontHaveAnAccBackDark : AppColors.white,
        appBar: AppBarWithProductCount(
          title: widget.title ?? '',
          count: state.productsCount,
          onSearchFilterTapped: () {
            AppHelpers.showCustomModalBottomSheet(
              context: context,
              modal: const CategoryProductsSearchFilterModal(),
              isDarkMode: isDarkMode,
            );
          },
          onSearchChanged: (value) =>
              notifier.setQuery(context, value.trim(), widget.id),
        ),
        body: state.isSearching
            ? ProductSearchBody(
                isSearchLoading: state.isSearchLoading,
                searchedProducts: state.searchedProducts,
                query: state.query.trim(),
              )
            : CategoryProductsBody(categoryId: widget.id),
      ),
    );
  }
}
