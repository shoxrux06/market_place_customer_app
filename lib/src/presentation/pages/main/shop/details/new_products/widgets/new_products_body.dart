import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../../../../../../core/utils/utils.dart';
import '../../../../../../components/components.dart';
import '../../../../../../theme/theme.dart';
import '../riverpod/provider/new_products_provider.dart';
import 'new_products_filter_modal.dart';

class NewProductsBody extends ConsumerStatefulWidget {
  const NewProductsBody({Key? key}) : super(key: key);

  @override
  ConsumerState<NewProductsBody> createState() => _NewProductsBodyState();
}

class _NewProductsBodyState extends ConsumerState<NewProductsBody> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(
      () {
        if (_scrollController.position.maxScrollExtent ==
            _scrollController.position.pixels) {
          ref.read(newProductsProvider.notifier).fetchProducts(context);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(newProductsProvider);
    final notifier = ref.read(newProductsProvider.notifier);
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
                    // showCupertinoModalBottomSheet(
                    //   context: context,
                    //   builder: (context) => const NewProductsFilterModal(),
                    // );
                    AppHelpers.showCustomModalBottomSheet(
                      context: context,
                      modal: const NewProductsFilterModal(),
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
