import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:surgesurvey/utils/app_constants.dart';
import 'package:surgesurvey/utils/launcher_utils.dart';
import 'package:surgesurvey/utils/loading_utils.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../widget/action_button_widget.dart';

class MainButtonsWidget extends StatelessWidget {
  const MainButtonsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ActionButtonWidget(
          icon: Icons.search,
          title: 'RESEARCH',
          onTap: () => LauncherUtils.launchURL(AppConstants.omegaAppHomePage,mode: LaunchMode.inAppBrowserView),
        ),
        const Gap(30),
        ActionButtonWidget(
          icon: Icons.folder,
          title: 'PROJECT FILES',
          onTap: () => LoadingUtils.showInfo("In Progress"),
        ),
        const Gap(30),
        ActionButtonWidget(icon: Icons.add_box, title: 'NEW SURVEY', onTap: () => LoadingUtils.showInfo("In Progress")),
      ],
    );
  }
}
