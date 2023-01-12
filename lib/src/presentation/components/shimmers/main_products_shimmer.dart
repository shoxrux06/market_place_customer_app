import 'package:flutter/material.dart';

import '../../../core/constants/constants.dart';
import 'product_grid_list_shimmer.dart';
import 'product_horizontal_list_shimmer.dart';

class MainProductsShimmer extends StatelessWidget {
  final ListAlignment listAlignment;

  const MainProductsShimmer({Key? key, required this.listAlignment})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return listAlignment == ListAlignment.vertically
        ? const ProductGridListShimmer(
            itemCount: 14,
            verticalPadding: 0,
          )
        : listAlignment == ListAlignment.horizontally
            ? const ProductHorizontalListShimmer(
                itemCount: 14,
              )
            : const ProductHorizontalListShimmer(
                height: 412,
                itemCount: 14,
              );
  }
}
