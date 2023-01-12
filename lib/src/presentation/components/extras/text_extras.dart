import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../models/models.dart';
import '../../theme/theme.dart';

class TextExtras extends StatelessWidget {
  final int groupIndex;
  final List<UiExtra> uiExtras;
  final Function(UiExtra) onUpdate;

  const TextExtras({
    Key? key,
    required this.groupIndex,
    required this.uiExtras,
    required this.onUpdate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8.r,
      runSpacing: 10.r,
      children: uiExtras
          .map(
            (uiExtra) => Material(
              borderRadius: BorderRadius.circular(8.r),
              color: uiExtra.isSelected ? AppColors.black : AppColors.white,
              child: InkWell(
                borderRadius: BorderRadius.circular(8.r),
                onTap: () {
                  if (uiExtra.isSelected) {
                    return;
                  }
                  onUpdate(uiExtra);
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.r),
                    border: Border.all(color: AppColors.black.withOpacity(0.1)),
                  ),
                  padding: REdgeInsets.all(12),
                  child: Text(
                    uiExtra.value,
                    style: GoogleFonts.k2d(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: uiExtra.isSelected
                          ? AppColors.white
                          : AppColors.black,
                      letterSpacing: -14 * 0.01,
                    ),
                  ),
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}
