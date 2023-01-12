import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/routes/app_router.gr.dart';
import '../../../../core/utils/utils.dart';
import '../../../theme/theme.dart';

class NoConnectionPage extends ConsumerWidget {
  const NoConnectionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        children: [
          const SizedBox(height: 200, width: double.infinity),
          const Icon(
            FlutterRemix.wifi_off_fill,
            size: 120,
            color: AppColors.black,
          ),
          const SizedBox(height: 20),
          Text(
            AppHelpers.getTranslation(TrKeys.noInternetConnection),
            style: GoogleFonts.k2d(
              fontSize: 18.sp,
              color: AppColors.black,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 40),
          ElevatedButton(
            onPressed: () => context.replaceRoute(const SplashRoute()),
            child: const Icon(
              FlutterRemix.restart_fill,
              color: AppColors.black,
              size: 40,
            ),
          ),
        ],
      ),
    );
  }
}
