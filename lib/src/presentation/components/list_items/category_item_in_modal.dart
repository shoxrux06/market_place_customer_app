import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../riverpod/provider/app_provider.dart';
import '../../theme/theme.dart';

class CategoryItemInModal extends ConsumerWidget {
  final String title;
  final bool isSelected;
  final Function() onTap;

  const CategoryItemInModal({
    Key? key,
    required this.title,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(appProvider);
    return Material(
      borderRadius: BorderRadius.circular(10.r),
      color: isSelected
          ? AppColors.accentGreen
          : state.isDarkMode
              ? AppColors.mainBackDark
              : AppColors.mainBack,
      child: InkWell(
        borderRadius: BorderRadius.circular(10.r),
        onTap: onTap,
        child: Container(
          height: 39.r,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
          ),
          padding: REdgeInsets.symmetric(horizontal: 22, vertical: 10),
          child: Text(
            title,
            style: GoogleFonts.k2d(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              color: isSelected
                  ? AppColors.white
                  : state.isDarkMode
                      ? AppColors.white
                      : AppColors.black,
              letterSpacing: -14 * 0.02,
            ),
          ),
        ),
      ),
    );
  }
}
