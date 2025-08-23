import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ActionButtonWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const ActionButtonWidget({super.key, required this.icon, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.sizeOf(context).width / 3,
        height: MediaQuery.sizeOf(context).width / 3,
        decoration: BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.circular(8)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 50, color: Colors.white),
            const Gap(8),
            Text(
              title,
              style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
