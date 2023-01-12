import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../../core/utils/utils.dart';
import '../../../../../../../components/components.dart';
import '../../../../../../../theme/theme.dart';
import '../riverpod/provider/brand_details_provider.dart';
import 'brand_products_filter_modal.dart';

class BrandDetailsBody extends ConsumerStatefulWidget {
  const BrandDetailsBody({Key? key}) : super(key: key);

  @override
  ConsumerState<BrandDetailsBody> createState() => _BrandDetailsBodyState();
}

class _BrandDetailsBodyState extends ConsumerState<BrandDetailsBody> {
  late ScrollController scrollController;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    scrollController.addListener(
      () {
        if (scrollController.position.maxScrollExtent ==
            scrollController.position.pixels) {
          ref.read(brandDetailsProvider.notifier).fetchProducts(context);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(brandDetailsProvider);
    final notifier = ref.read(brandDetailsProvider.notifier);
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
                      modal: const BrandProductsFilterModal(),
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
            controller: scrollController,
            children: [
              10.verticalSpace,
              CommonImage(imageUrl: state.brand?.img, height: 140, radius: 0),
              10.verticalSpace,
              Container(
                color: isDarkMode
                    ? AppColors.dontHaveAnAccBackDark
                    : AppColors.white,
                padding: REdgeInsets.symmetric(horizontal: 15, vertical: 20),
                child: state.isProductsLoading
                    ? MainProductsShimmer(listAlignment: state.listAlignment)
                    : MainProductsBody(
                        listAlignment: state.listAlignment,
                        products: state.products,
                        onLikeTap: notifier.likeOrUnlikeProduct,
                      ),
              ),
              if (state.isMoreLoading)
                Container(
                  color: AppColors.white,
                  padding: REdgeInsets.symmetric(horizontal: 15),
                  child: MainProductsShimmer(
                    listAlignment: state.listAlignment,
                  ),
                )
            ],
          ),
        ),
      ],
    );
  }
}
