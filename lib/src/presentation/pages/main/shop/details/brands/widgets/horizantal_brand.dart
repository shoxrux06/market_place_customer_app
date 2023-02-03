import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../core/routes/app_router.gr.dart';
import '../../../../../../../core/utils/utils.dart';
import '../../../../../../components/components.dart';
import '../../../../../../theme/theme.dart';
import '../riverpod/provider/brands_provider.dart';

class HorizantalBrands extends ConsumerStatefulWidget {
  const HorizantalBrands({Key? key}) : super(key: key);

  @override
  ConsumerState<HorizantalBrands> createState() => _BrandsBodyState();
}

class _BrandsBodyState extends ConsumerState<HorizantalBrands> {
  late ScrollController scrollController;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    ref.read(brandsProvider.notifier).fetchBrands(context);
    // scrollController.addListener(
    //       () {
    //     if (scrollController.position.maxScrollExtent ==
    //         scrollController.position.pixels) {
    //       ref.read(brandsProvider.notifier).fetchBrands(context);
    //     }
    //   },
    // );
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(brandsProvider);
    final bool isDarkMode = LocalStorage.instance.getAppThemeMode();
    return Container(
      height: 54,
      width: 1.sw,
      color: isDarkMode ? AppColors.dontHaveAnAccBackDark : AppColors.bottomNavigationShadow,
      padding: REdgeInsets.symmetric(horizontal: 15, vertical: 4),
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: state.brands.length,
        itemBuilder: (context, index) {
          final brand = state.brands[index];
          print('Brands *** $brand***');
          print('Brands length *** ${state.brands.length}***');
          return InkWell(
            onTap: () => context.pushRoute(
              BrandDetailsRoute(id: brand.id ?? 0),
            ),
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: CommonImage(imageUrl: brand.img, width: 48, height: 48,),)
          );
        },
      ),
    );
  }
}
