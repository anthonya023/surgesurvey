import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:surgesurvey/presentation/screen/new_survey/controller/controller.dart';
import 'package:surgesurvey/presentation/widget/custom_text_field.dart';
import 'package:surgesurvey/presentation/widget/custom_text_large.dart';
import 'package:surgesurvey/presentation/widget/custom_quantity_widget.dart';

class SurveyStep2Body extends StatelessWidget {
  const SurveyStep2Body({super.key, required this.controller});

  final NewSurveyController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Location/Room field
        const CustomTextLarge(text: 'LOCATION/ROOM'),
        const Gap(16),
        CustomTextField(
          controller: controller.locationController,
          hintText: 'Enter location or room',
          onChanged: controller.updateLocation,
        ),
        const Gap(24),

        // Panel ID/Equipment field
        const CustomTextLarge(text: 'PANEL ID/EQUIPMENT'),
        const Gap(16),
        CustomTextField(
          controller: controller.panelIdController,
          hintText: 'Enter panel ID or equipment',
          onChanged: controller.updatePanelId,
        ),
        const Gap(24),

        // Quantity and Photo row
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // Quantity field
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomTextLarge(text: 'QUANTITY'),
                  const Gap(16),
                  CustomQuantityWidget(
                    value: controller.quantity,
                    onChanged: controller.updateQuantity,
                  ),
                ],
              ),
            ),
            // Photo field
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const CustomTextLarge(text: 'PHOTO'),
                  const Gap(16),
                  GestureDetector(
                    onTap: controller.pickPhoto,
                    child: Container(
                      height: 56,
                      width: 56,
                      decoration: BoxDecoration(color: Colors.grey.shade800, borderRadius: BorderRadius.circular(12)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.camera_alt,
                            color: controller.selectedPhotoPath != null ? Colors.blue : Colors.grey,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const Gap(24),
      ],
    );
  }
}
