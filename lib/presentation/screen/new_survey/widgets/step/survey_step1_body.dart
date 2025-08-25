import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:surgesurvey/presentation/screen/new_survey/controller/controller.dart';
import 'package:surgesurvey/presentation/widget/custom_text_field.dart';
import 'package:surgesurvey/presentation/widget/custom_date_field.dart';
import 'package:surgesurvey/presentation/widget/custom_text_large.dart';

class SurveyStep1Body extends StatelessWidget {
  const SurveyStep1Body({
    super.key,
    required this.controller,
  });

  final NewSurveyController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // region Project Name
        const CustomTextLarge(text: 'PROJECT NAME'),
        const Gap(16),
        CustomTextField(
          controller: controller.projectNameController,
          hintText: 'Enter project name',
          onChanged: controller.updateProjectName,
        ),
        const Gap(24),

        //region Address
        const CustomTextLarge(text: 'ADDRESS'),
        const Gap(16),
        CustomTextField(
          controller: controller.addressNameController,
          hintText: 'Enter address',
          onChanged: controller.updateAddressName,
        ),
        const Gap(24),

        // region Project Date
        const CustomTextLarge(text: 'DATE'),
        const Gap(16),
        CustomDateField(
          controller: controller.dateController,
          hintText: 'Select date',
          onDateSelected: controller.updateSelectedDate,
        ),
        const Gap(24),
        // endregion Project Date
      ],
    );
  }
}