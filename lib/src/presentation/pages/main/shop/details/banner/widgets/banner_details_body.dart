import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../core/constants/constants.dart';
import '../../../../../../../core/routes/app_router.gr.dart';
import '../../../../../../../core/utils/utils.dart';
import '../../../../../../components/components.dart';
import '../../../../../../theme/theme.dart';
import '../riverpod/provider/banner_details_provider.dart';
import 'banner_products_filter_modal.dart';

class BannerDetailsBody extends ConsumerWidget {
  final String? imageUrl;

  const BannerDetailsBody({Key? key, this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(bannerDetailsProvider);
    final notifier = ref.read(bannerDetailsProvider.notifier);
    final bool isDarkMode = LocalStorage.instance.getAppThemeMode();
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 1.r,
          color:
              isDarkMode ? AppColors.dontHaveAnAccBackDark : AppColors.mainBack,
        ),
        Container(
          height: 54.r,
          color: isDarkMode ? AppColors.dontHaveAnAccBackDark : AppColors.white,
          padding: REdgeInsets.symmetric(
            horizontal: 15,
            vertical: 9,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: MainFilterButton(
                  onTap: () {
                    AppHelpers.showCustomModalBottomSheet(
                      context: context,
                      modal: const BannerProductsFilterModal(),
                      isDarkMode: isDarkMode,
                    );
                  },
                ),
              ),
              10.horizontalSpace,
              ChangeAlignmentListButton(
                alignment: state.listAlignment,
                onChange: notifier.setListAlignment,
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView(
            physics: const CustomBouncingScrollPhysics(),
            shrinkWrap: true,
            children: [
              10.verticalSpace,
              CommonImage(
                imageUrl: imageUrl,
                width: 1.sw,
                height: 140,
                radius: 0,
              ),
              10.verticalSpace,
              Container(
                color: isDarkMode
                    ? AppColors.dontHaveAnAccBackDark
                    : AppColors.white,
                padding: REdgeInsets.symmetric(horizontal: 15, vertical: 20),
                child: state.isLoading
                    ? const ProductGridListShimmer()
                    : state.listAlignment == ListAlignment.vertically
                        ? GridView.builder(
                            shrinkWrap: true,
                            primary: false,
                            itemCount: state.filteredProducts.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              childAspectRatio: 168 / 272,
                              mainAxisSpacing: 30.r,
                              crossAxisSpacing: 9.r,
                              crossAxisCount: 2,
                            ),
                            itemBuilder: (context, index) {
                              final product = state.filteredProducts[index];
                              return ProductGridItem(
                                product: product,
                                onTap: () => context.pushRoute(
                                  ProductRoute(uuid: product.uuid ?? ''),
                                ),
                                onLikeTap: () =>
                                    notifier.likeOrUnlikeProduct(product.id),
                              );
                            },
                          )
                        : state.listAlignment == ListAlignment.horizontally
                            ? ListView.builder(
                                shrinkWrap: true,
                                primary: false,
                                itemCount: state.filteredProducts.length,
                                itemBuilder: (context, index) {
                                  final product = state.filteredProducts[index];
                                  return ProductHorizontalItem(
                                    product: product,
                                    onLikePressed: notifier.likeOrUnlikeProduct,
                                  );
                                },
                              )
                            : ListView.builder(
                                itemCount: state.filteredProducts.length,
                                physics: const CustomBouncingScrollPhysics(),
                                padding: REdgeInsets.symmetric(vertical: 20),
                                shrinkWrap: true,
                                primary: false,
                                itemBuilder: (context, index) {
                                  final product = state.filteredProducts[index];
                                  return BigProductItem(
                                    product: product,
                                    onLikePressed: () => notifier
                                        .likeOrUnlikeProduct(product.id),
                                  );
                                },
                              ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
