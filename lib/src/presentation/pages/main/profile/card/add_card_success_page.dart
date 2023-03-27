import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_customer/src/core/constants/constants.dart';
import 'package:g_customer/src/core/utils/app_helpers.dart';
import '../../../../../core/constants/app_assets.dart';
import '../../../../../core/routes/app_router.gr.dart';

class AddCardSuccessPage extends ConsumerStatefulWidget {
  const AddCardSuccessPage({Key? key}) : super(key: key);

  @override
  ConsumerState<AddCardSuccessPage> createState() => _CardPageState();
}

class _CardPageState extends ConsumerState<AddCardSuccessPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(AppAssets.pngIcCard),
            10.verticalSpace,
            Text(AppHelpers.getTranslation(TrKeys.cardHasBeenAdded)),
            10.verticalSpace,
            TextButton(
                onPressed: () => context.router.push(const ShopMainRoute(),),
                child: Text(AppHelpers.getTranslation(TrKeys.goToHomePage))
            )
          ],
        ),
      ),
    );
  }
}
