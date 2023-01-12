import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../../../../../core/utils/utils.dart';
import '../../../../../components/components.dart';
import '../../../../../theme/theme.dart';
import '../riverpod/provider/viewed_products_provider.dart';
import 'viewed_products_filter_modal.dart';

class ViewedProductsBody extends ConsumerWidget {
  const ViewedProductsBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(viewedProductsProvider);
    final notifier = ref.read(viewedProductsProvider.notifier);
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
                    //   builder: (context) => const ViewedProductsFilterModal(),
                    // );
                    AppHelpers.showCustomModalBottomSheet(
                      context: context,
                      modal: const ViewedProductsFilterModal(),
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
                padding: REdgeInsets.symmetric(horizontal: 15, vertical: 20),
                child: state.isViewedProductsLoading
                    ? MainProductsShimmer(listAlignment: state.listAlignment)
                    : MainProductsBody(
                        listAlignment: state.listAlignment,
                        products: state.filteredProducts,
                        onLikeTap: notifier.likeOrUnlikeProduct,
                      ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
