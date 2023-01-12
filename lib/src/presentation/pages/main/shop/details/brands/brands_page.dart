import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../core/constants/constants.dart';
import '../../../../../../core/utils/utils.dart';
import '../../../../../components/components.dart';
import '../../../../../theme/theme.dart';
import 'riverpod/provider/brands_provider.dart';
import 'widgets/brand_search_body.dart';
import 'widgets/brands_body.dart';

class BrandsPage extends ConsumerStatefulWidget {
  const BrandsPage({Key? key}) : super(key: key);

  @override
  ConsumerState<BrandsPage> createState() => _BrandsPageState();
}

class _BrandsPageState extends ConsumerState<BrandsPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      Duration.zero,
      () {
        ref.read(brandsProvider.notifier).fetchBrands(context);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(brandsProvider);
    final notifier = ref.read(brandsProvider.notifier);
    final bool isDarkMode = LocalStorage.instance.getAppThemeMode();
    return state.isLoading
        ? Scaffold(
            backgroundColor:
                isDarkMode ? AppColors.dontHaveAnAccBackDark : AppColors.white,
            body: JumpingDots(
              color: isDarkMode ? AppColors.white : AppColors.black,
            ),
          )
        : KeyboardDismisser(
            child: Scaffold(
              backgroundColor: isDarkMode
                  ? AppColors.dontHaveAnAccBackDark
                  : AppColors.white,
              appBar: AppBarWithProductCount(
                hasProductCount: false,
                hasSearchFilter: false,
                title: AppHelpers.getTranslation(TrKeys.brands),
                searchHintText:
                    '${AppHelpers.getTranslation(TrKeys.search)} ${AppHelpers.getTranslation(TrKeys.brands).toLowerCase()}',
                onSearchChanged: (value) =>
                    notifier.setQuery(context, value.trim()),
                onSearchFilterTapped: () {},
              ),
              body: state.isSearching
                  ? BrandSearchBody(
                      isSearchLoading: state.isSearchLoading,
                      searchedBrands: state.searchedBrands,
                      query: state.query,
                    )
                  : const BrandsBody(),
            ),
          );
  }
}
