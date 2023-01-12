import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/constants/constants.dart';
import '../../../../../../core/routes/app_router.gr.dart';
import '../../../../../components/components.dart';
import '../riverpod/provider/discount_products_provider.dart';

class DiscountProductsBody extends ConsumerStatefulWidget {
  const DiscountProductsBody({Key? key}) : super(key: key);

  @override
  ConsumerState<DiscountProductsBody> createState() =>
      _DiscountProductsBodyState();
}

class _DiscountProductsBodyState extends ConsumerState<DiscountProductsBody> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(
      () {
        if (_scrollController.position.maxScrollExtent ==
            _scrollController.position.pixels) {
          ref.read(discountProductsProvider.notifier).fetchProducts(context);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(discountProductsProvider);
    final notifier = ref.read(discountProductsProvider.notifier);
    return ListView(
      shrinkWrap: true,
      controller: _scrollController,
      physics: const CustomBouncingScrollPhysics(),
      children: [
        state.listAlignment == ListAlignment.vertically
            ? GridView.builder(
                physics: const CustomBouncingScrollPhysics(),
                shrinkWrap: true,
                primary: false,
                itemCount: state.products.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 168 / 272,
                  mainAxisSpacing: 30.r,
                  crossAxisSpacing: 9.r,
                  crossAxisCount: 2,
                ),
                padding: REdgeInsets.symmetric(vertical: 20),
                itemBuilder: (context, index) {
                  final product = state.products[index];
                  return ProductGridItem(
                    product: product,
                    onTap: () => context
                        .pushRoute(ProductRoute(uuid: product.uuid ?? '')),
                    onLikeTap: () => notifier.likeOrUnlikeProduct(product.id),
                  );
                },
              )
            : state.listAlignment == ListAlignment.horizontally
                ? ListView.builder(
                    itemCount: state.products.length,
                    primary: false,
                    physics: const CustomBouncingScrollPhysics(),
                    padding: REdgeInsets.symmetric(vertical: 20),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      final product = state.products[index];
                      return ProductHorizontalItem(
                        product: product,
                        onLikePressed: notifier.likeOrUnlikeProduct,
                      );
                    },
                  )
                : ListView.builder(
                    itemCount: state.products.length,
                    physics: const CustomBouncingScrollPhysics(),
                    padding: REdgeInsets.symmetric(vertical: 20),
                    primary: false,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      final product = state.products[index];
                      return BigProductItem(
                        product: product,
                        onLikePressed: () =>
                            notifier.likeOrUnlikeProduct(product.id),
                      );
                    },
                  ),
        if (state.isMoreLoading)
          state.listAlignment == ListAlignment.vertically
              ? const ProductGridListShimmer(itemCount: 14)
              : state.listAlignment == ListAlignment.horizontally
                  ? const ProductHorizontalListShimmer(itemCount: 14)
                  : const ProductHorizontalListShimmer(
                      height: 412,
                      itemCount: 14,
                    ),
      ],
    );
  }
}
