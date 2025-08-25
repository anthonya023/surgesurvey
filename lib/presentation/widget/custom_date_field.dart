import 'package:flutter/material.dart';

class CustomDateField extends StatelessWidget {
  const CustomDateField({
    super.key,
    required this.controller,
    this.hintText,
    this.labelText,
    this.onDateSelected,
    this.firstDate,
    this.lastDate,
  });

  final TextEditingController controller;
  final String? hintText;
  final String? labelText;
  final ValueChanged<DateTime>? onDateSelected;
  final DateTime? firstDate;
  final DateTime? lastDate;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      readOnly: true,
      style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 24, color: Colors.white),
      onTap: () async {
        final DateTime? selectedDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: firstDate ?? DateTime(2000),
          lastDate: lastDate ?? DateTime(2100),
          builder: (context, child) {
            return Theme(
              data: Theme.of(context).copyWith(
                colorScheme: const ColorScheme.dark(
                  primary: Colors.blue,
                  onPrimary: Colors.white,
                  surface: Color(0xFF424242),
                  onSurface: Colors.white,
                ),
              ),
              child: child!,
            );
          },
        );

        if (selectedDate != null) {
          final formattedDate =
              '${selectedDate.month.toString().padLeft(2, '0')}/${selectedDate.day.toString().padLeft(2, '0')}/${selectedDate.year.toString().substring(2)}';
          controller.text = formattedDate;
          onDateSelected?.call(selectedDate);
        }
      },
      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText,
        suffixIcon: const Icon(Icons.calendar_today, color: Colors.grey),
        hintStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 24, color: Colors.grey),
        labelStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 24, color: Colors.grey),
        filled: true,
        fillColor: Colors.grey.shade800,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.blue, width: 2),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      ),
    );
  }
}
