import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:surgesurvey/presentation/screen/new_survey/controller/controller.dart';
import 'package:surgesurvey/presentation/widget/custom_text_large.dart';
import 'package:surgesurvey/core/enums/survey_enums.dart';

class SurveyStep3Body extends StatelessWidget {
  const SurveyStep3Body({super.key, required this.controller});

  final NewSurveyController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Center(child: CustomTextLarge(text: 'APPLICATION')),
        const Gap(32),

        // Application buttons
        ...ApplicationType.values.map(
          (app) => Column(
            children: [
              _buildApplicationButton(
                context: context,
                applicationType: app,
                isSelected: controller.selectedApplication == app,
                onTap: () => controller.selectApplication(app),
              ),
              if (app != ApplicationType.values.last) const Gap(16),
            ],
          ),
        ),
        const Gap(32),
      ],
    );
  }

  Widget _buildApplicationButton({
    required BuildContext context,
    required ApplicationType applicationType,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue.shade100 : Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: isSelected ? Border.all(color: Colors.blue, width: 2) : null,
          boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.1), blurRadius: 4, offset: const Offset(0, 2))],
        ),
        child: Center(
          child: Text(
            applicationType.displayName,
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: isSelected ? Colors.blue.shade800 : Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
