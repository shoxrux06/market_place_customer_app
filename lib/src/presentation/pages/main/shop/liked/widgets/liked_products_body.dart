import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/constants/constants.dart';
import '../../../../../../core/routes/app_router.gr.dart';
import '../../../../../components/components.dart';
import '../riverpod/provider/liked_provider.dart';

class LikedProductsBody extends ConsumerWidget {
  const LikedProductsBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(likedProvider);
    final notifier = ref.read(likedProvider.notifier);
    return state.listAlignment == ListAlignment.vertically
        ? GridView.builder(
            physics: const CustomBouncingScrollPhysics(),
            shrinkWrap: true,
            primary: false,
            itemCount: state.filteredProducts.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 157 / 272,
              mainAxisSpacing: 30.r,
              crossAxisSpacing: 9.r,
              crossAxisCount: 2,
            ),
            padding: REdgeInsets.only(top: 20, bottom: 80),
            itemBuilder: (context, index) {
              final product = state.filteredProducts[index];
              return ProductGridItem(
                product: product,
                onTap: () =>
                    context.pushRoute(ProductRoute(uuid: product.uuid ?? '')),
                onLikeTap: () => notifier.likeOrUnlikeProduct(product.id),
              );
            },
          )
        : state.listAlignment == ListAlignment.horizontally
            ? ListView.builder(
                itemCount: state.filteredProducts.length,
                physics: const CustomBouncingScrollPhysics(),
                padding: REdgeInsets.only(top: 20, bottom: 50),
                itemBuilder: (context, index) {
                  final product = state.filteredProducts[index];
                  return ProductHorizontalItem(
                    product: product,
                    onLikePressed: (int? id) =>
                        notifier.likeOrUnlikeProduct(id),
                  );
                },
              )
            : ListView.builder(
                itemCount: state.filteredProducts.length,
                physics: const CustomBouncingScrollPhysics(),
                padding: REdgeInsets.only(top: 20, bottom: 60),
                itemBuilder: (context, index) {
                  final product = state.filteredProducts[index];
                  return BigProductItem(
                    product: product,
                    onLikePressed: () =>
                        notifier.likeOrUnlikeProduct(product.id),
                  );
                },
              );
  }
}
