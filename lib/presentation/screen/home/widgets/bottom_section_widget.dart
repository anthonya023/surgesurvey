import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:surgesurvey/presentation/widget/omegapower_logo.dart';
import 'package:surgesurvey/utils/launcher_utils.dart';
import '../../../widget/bottom_button_widget.dart';

class BottomSectionWidget extends StatelessWidget {
  const BottomSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        BottomButtonWidget(icon: Icons.flash_on, onTap: () {}),
        const Row(children: [OmegaPowerLogo(height: 48), Gap(8)]),
        BottomButtonWidget(icon: Icons.phone, onTap: () => LauncherUtils.callSupport()),
      ],
    );
  }
}
