import 'package:flutter/material.dart';
import 'package:surgesurvey/generated/assets.dart';

class OmegaPowerLogo extends StatelessWidget {
  final double? height;
  final double? width;
  final BoxFit? fit;

  const OmegaPowerLogo(
      {super.key, this.height, this.width, this.fit = BoxFit.contain});

  @override
  Widget build(BuildContext context) {
    return Image.asset(Assets.logoOmegaPower,
        height: height, width: width, fit: fit);
  }
}
