import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:surgesurvey/core/di/injection.dart';
import 'package:surgesurvey/presentation/screen/new_survey/controller/controller.dart';
import 'package:surgesurvey/presentation/screen/new_survey/widgets/newsurvey_bottom_back_next.dart'
    show NewSurveyBottomBackNext;
import 'package:surgesurvey/presentation/screen/new_survey/step/survey_step1_body.dart';
import 'package:surgesurvey/presentation/screen/new_survey/step/survey_step2_body.dart';
import 'package:surgesurvey/presentation/screen/new_survey/step/survey_step3_body.dart';
import 'package:surgesurvey/core/enums/survey_enums.dart';

class NewSurveyScreen extends StatelessWidget {
  const NewSurveyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => getIt<NewSurveyController>(),
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(backgroundColor: Colors.black, foregroundColor: Colors.white),
        resizeToAvoidBottomInset: true,
        body: Consumer<NewSurveyController>(
          builder: (context, controller, child) {
            return Column(
              children: [
                // Scrollable content
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        switch (controller.currentStep) {
                          SurveyStep.projectDetails => SurveyStep1Body(controller: controller),
                          SurveyStep.equipmentDetails => SurveyStep2Body(controller: controller),
                          SurveyStep.applicationSelection => SurveyStep3Body(controller: controller),
                        },
                        const Gap(24),
                      ],
                    ),
                  ),
                ),

                //region Fixed bottom buttons
                NewSurveyBottomBackNext(
                  showNextButton: controller.currentStep != SurveyStep.applicationSelection,
                  onBack: () {
                    if (controller.currentStep != SurveyStep.projectDetails) {
                      controller.previousStep();
                    } else {
                      Navigator.of(context).pop();
                    }
                  },
                  onNext: controller.currentStep != SurveyStep.applicationSelection ? () {
                    controller.nextStep();
                  } : null,
                ),
                //endregion Fixed bottom buttons
              ],
            );
          },
        ),
      ),
    );
  }
}
