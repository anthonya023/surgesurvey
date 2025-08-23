import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:surgesurvey/presentation/screen/home/widgets/bottom_section_widget.dart';
import 'package:surgesurvey/presentation/screen/home/widgets/main_buttons_widget.dart';
import '../../widget/surgesurvey_logo.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Gap(32),
            SurgeSurveyLogo(height: 60),
            Expanded(child: MainButtonsWidget()),
            BottomSectionWidget(),
            Gap(kBottomNavigationBarHeight),
          ],
        ),
      ),
    );
  }
}
