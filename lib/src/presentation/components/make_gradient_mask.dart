import 'package:flutter/material.dart';

import '../theme/theme.dart';

class MakeGradientMask extends StatelessWidget {
  final Widget child;

  const MakeGradientMask({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcATop,
      shaderCallback: (Rect bounds) {
        return const LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [
            AppColors.bannerGradient1,
            AppColors.bannerGradient2,
          ],
        ).createShader(bounds);
      },
      child: child,
    );
  }
}
