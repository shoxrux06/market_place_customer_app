import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../../../../../../core/utils/utils.dart';
import '../../../../../../components/components.dart';
import '../../../../../../theme/theme.dart';
import '../riverpod/provider/category_products_provider.dart';
import 'category_products_filter_modal.dart';

class CategoryProductsBody extends ConsumerStatefulWidget {
  final int? categoryId;

  const CategoryProductsBody({Key? key, this.categoryId}) : super(key: key);

  @override
  ConsumerState<CategoryProductsBody> createState() =>
      _CategoryProductsBodyState();
}

class _CategoryProductsBodyState extends ConsumerState<CategoryProductsBody> {
  late ScrollController scrollController;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    scrollController.addListener(
      () {
        if (scrollController.position.maxScrollExtent ==
            scrollController.position.pixels) {
          ref
              .read(categoryProductsProvider.notifier)
              .fetchProducts(context, widget.categoryId);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(categoryProductsProvider);
    final notifier = ref.read(categoryProductsProvider.notifier);
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
                    showModalBottomSheet(
                      context: context,
                      builder: (context) => CategoryProductsFilterModal(
                        categoryId: widget.categoryId,
                      ),
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
        Container(
          height: 1.r,
          color: isDarkMode ? AppColors.mainBackDark : AppColors.mainBack,
        ),
        Expanded(
          child: ListView(
            physics: const CustomBouncingScrollPhysics(),
            shrinkWrap: true,
            children: [
              10.verticalSpace,
              Container(
                color: isDarkMode
                    ? AppColors.dontHaveAnAccBackDark
                    : AppColors.white,
                padding: REdgeInsets.only(left: 15, right: 15),
                child: state.isLoading
                    ? MainProductsShimmer(listAlignment: state.listAlignment)
                    : MainProductsBody(
                        listAlignment: state.listAlignment,
                        products: state.products,
                        onLikeTap: notifier.likeOrUnlikeProduct,
                      ),
              ),
              if (state.isMoreLoading)
                Container(
                  color: isDarkMode
                      ? AppColors.dontHaveAnAccBackDark
                      : AppColors.white,
                  padding: REdgeInsets.symmetric(horizontal: 15),
                  child: MainProductsShimmer(
                    listAlignment: state.listAlignment,
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
