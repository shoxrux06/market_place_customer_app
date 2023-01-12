import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../core/constants/constants.dart';
import '../../../../../../../core/routes/app_router.gr.dart';
import '../../../../../../components/components.dart';
import '../riverpod/provider/most_sold_products_provider.dart';

class MostSoldProductsBody extends ConsumerWidget {
  const MostSoldProductsBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(mostSoldProductsProvider);
    final notifier = ref.read(mostSoldProductsProvider.notifier);
    return state.listAlignment == ListAlignment.vertically
        ? GridView.builder(
            physics: const CustomBouncingScrollPhysics(),
            shrinkWrap: true,
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
                physics: const CustomBouncingScrollPhysics(),
                padding: REdgeInsets.symmetric(vertical: 20),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final product = state.products[index];
                  return ProductHorizontalItem(
                    product: product,
                    onLikePressed: (int? id) =>
                        notifier.likeOrUnlikeProduct(id),
                  );
                },
              )
            : ListView.builder(
                itemCount: state.products.length,
                physics: const CustomBouncingScrollPhysics(),
                padding: REdgeInsets.symmetric(vertical: 20),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final product = state.products[index];
                  return BigProductItem(
                    product: product,
                    onLikePressed: () =>
                        notifier.likeOrUnlikeProduct(product.id),
                  );
                },
              );
  }
}
