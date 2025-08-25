import 'package:flutter/material.dart';

class CustomTextLarge extends StatelessWidget {
  const CustomTextLarge({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(
        context,
      ).textTheme.headlineLarge?.copyWith(fontSize: 36, fontWeight: FontWeight.bold, color: Colors.white),
    );
  }
}
