import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../core/routes/app_router.gr.dart';
import '../../../../../../../core/utils/utils.dart';
import '../../../../../../components/components.dart';
import '../../../../../../theme/theme.dart';
import '../riverpod/provider/brands_provider.dart';

class BrandsBody extends ConsumerStatefulWidget {
  const BrandsBody({Key? key}) : super(key: key);

  @override
  ConsumerState<BrandsBody> createState() => _BrandsBodyState();
}

class _BrandsBodyState extends ConsumerState<BrandsBody> {
  late ScrollController scrollController;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    scrollController.addListener(
      () {
        if (scrollController.position.maxScrollExtent ==
            scrollController.position.pixels) {
          ref.read(brandsProvider.notifier).fetchBrands(context);
        }
      },
    );
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
    return ListView(
      physics: const CustomBouncingScrollPhysics(),
      shrinkWrap: true,
      controller: scrollController,
      children: [
        16.verticalSpace,
        Container(
          color: isDarkMode ? AppColors.dontHaveAnAccBackDark : AppColors.white,
          padding: REdgeInsets.symmetric(horizontal: 15),
          child: GridView.builder(
            shrinkWrap: true,
            primary: false,
            itemCount: state.brands.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 1,
              mainAxisSpacing: 9.r,
              crossAxisSpacing: 9.r,
              crossAxisCount: 3,
            ),
            itemBuilder: (context, index) {
              final brand = state.brands[index];
              return InkWell(
                onTap: () => context.pushRoute(
                  BrandDetailsRoute(id: brand.id ?? 0),
                ),
                child: CommonImage(imageUrl: brand.img, width: double.infinity),
              );
            },
          ),
        ),
        if (state.isMoreLoading)
          GridView.builder(
            shrinkWrap: true,
            primary: false,
            itemCount: 18,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 1,
              mainAxisSpacing: 9.r,
              crossAxisSpacing: 9.r,
              crossAxisCount: 3,
            ),
            padding: REdgeInsets.symmetric(horizontal: 15, vertical: 9),
            itemBuilder: (context, index) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(8.r),
                child: MakeShimmer(
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.r),
                      color: AppColors.white,
                    ),
                  ),
                ),
              );
            },
          )
      ],
    );
  }
}
