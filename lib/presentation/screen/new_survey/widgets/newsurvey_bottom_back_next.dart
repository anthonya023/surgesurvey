import 'package:flutter/material.dart';
import 'package:gap/gap.dart' show Gap;
import 'package:google_fonts/google_fonts.dart';

class NewSurveyBottomBackNext extends StatelessWidget {
  const NewSurveyBottomBackNext({
    super.key, 
    required this.onBack, 
    this.onNext,
    this.showNextButton = true,
  });

  final VoidCallback onBack;
  final VoidCallback? onNext;
  final bool showNextButton;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      color: Colors.black,
      child: SafeArea(
        top: false,
        child: Row(
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: () => onBack.call(),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  side: const BorderSide(color: Colors.white, width: 2),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                child: Text(
                  'BACK',
                  style: GoogleFonts.anton(fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const Gap(16),
            if (showNextButton)
              Expanded(
                child: ElevatedButton(
                  onPressed: () => onNext?.call(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  child: const Text(
                    'NEXT',
                    style: TextStyle(fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              )
            else
              const Expanded(child: SizedBox()),
          ],
        ),
      ),
    );
  }
}
