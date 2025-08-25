import 'package:flutter/material.dart';

class BottomButtonWidget extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const BottomButtonWidget({super.key, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.circular(12)),
        child: Center(child: Icon(icon, size: 30, color: Colors.white)),
      ),
    );
  }
}
