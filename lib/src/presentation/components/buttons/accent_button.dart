import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/constants/constants.dart';
import '../../../core/utils/utils.dart';
import '../../theme/theme.dart';

class AccentButton extends StatelessWidget {
  final Function() onTap;

  const AccentButton({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(8.r),
      color: AppColors.accentGreen,
      child: InkWell(
        borderRadius: BorderRadius.circular(8.r),
        onTap: onTap,
        child: Padding(
          padding: REdgeInsets.symmetric(
            horizontal: 30,
            vertical: 10,
          ),
          child: Text(
            AppHelpers.getTranslation(TrKeys.goToSale),
            style: GoogleFonts.k2d(
              fontWeight: FontWeight.w500,
              fontSize: 16.sp,
              color: AppColors.white,
              letterSpacing: -14 * 0.01,
            ),
          ),
        ),
      ),
    );
  }
}
