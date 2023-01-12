import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../../../core/constants/constants.dart';
import '../../../../../../../../../core/utils/utils.dart';
import '../../../../../../../../../models/models.dart';
import '../../../../../../../../components/components.dart';
import '../../../../../../../../theme/theme.dart';
import '../riverpod/provider/look_products_provider.dart';

class LookProductExtras extends ConsumerWidget {
  final int productIndex;

  const LookProductExtras({Key? key, required this.productIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(lookProductsProvider);
    final notifier = ref.read(lookProductsProvider.notifier);
    final bool isDarkMode = LocalStorage.instance.getAppThemeMode();
    return ListView.builder(
      shrinkWrap: true,
      itemCount: state.listOfTypedExtras[productIndex].length,
      padding: EdgeInsets.zero,
      primary: false,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        final TypedExtra typedExtra =
            state.listOfTypedExtras[productIndex][index];
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
            color:
                isDarkMode ? AppColors.dontHaveAnAccBackDark : AppColors.white,
          ),
          padding: REdgeInsets.symmetric(vertical: 4),
          margin: REdgeInsets.only(bottom: 6),
          child: typedExtra.type == ExtrasType.text
              ? TextExtras(
                  uiExtras: typedExtra.uiExtras,
                  groupIndex: typedExtra.groupIndex,
                  onUpdate: (uiExtra) {
                    notifier.updateSelectedIndexes(
                      context,
                      index: typedExtra.groupIndex,
                      value: uiExtra.index,
                      productIndex: productIndex,
                    );
                  },
                )
              : typedExtra.type == ExtrasType.color
                  ? ColorExtras(
                      uiExtras: typedExtra.uiExtras,
                      groupIndex: typedExtra.groupIndex,
                      onUpdate: (uiExtra) {
                        notifier.updateSelectedIndexes(
                          context,
                          index: typedExtra.groupIndex,
                          value: uiExtra.index,
                          productIndex: productIndex,
                        );
                      },
                    )
                  : typedExtra.type == ExtrasType.image
                      ? ImageExtras(
                          uiExtras: typedExtra.uiExtras,
                          groupIndex: typedExtra.groupIndex,
                          updateImage: (url) {},
                          onUpdate: (uiExtra) {
                            notifier.updateSelectedIndexes(
                              context,
                              index: typedExtra.groupIndex,
                              value: uiExtra.index,
                              productIndex: productIndex,
                            );
                          },
                        )
                      : const SizedBox(),
        );
      },
    );
  }
}
