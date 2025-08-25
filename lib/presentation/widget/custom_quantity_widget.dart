import 'package:flutter/material.dart';

class CustomQuantityWidget extends StatelessWidget {
  const CustomQuantityWidget({
    super.key,
    required this.value,
    required this.onChanged,
    this.minValue = 0,
    this.maxValue = 9999,
  });

  final int value;
  final ValueChanged<int> onChanged;
  final int minValue;
  final int maxValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)),
      child: Row(
        children: [
          // Minus button
          Expanded(
            child: GestureDetector(
              onTap: () {
                if (value > minValue) {
                  onChanged(value - 1);
                }
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: const BorderRadius.only(topLeft: Radius.circular(12), bottomLeft: Radius.circular(12)),
                ),
                child: const Center(child: Icon(Icons.remove, color: Colors.white, size: 24)),
              ),
            ),
          ),

          // Number display
          Expanded(
            child: GestureDetector(
              onTap: () => _showQuantityDialog(context),
              child: Container(
                color: Colors.white,
                child: Center(
                  child: Text(
                    value.toString(),
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          ),

          // Plus button
          Expanded(
            child: GestureDetector(
              onTap: () {
                if (value < maxValue) {
                  onChanged(value + 1);
                }
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(12),
                    bottomRight: Radius.circular(12),
                  ),
                ),
                child: const Center(child: Icon(Icons.add, color: Colors.white, size: 24)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showQuantityDialog(BuildContext context) {
    final TextEditingController dialogController = TextEditingController(text: value.toString());

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.grey.shade800,
        title: Text(
          'Enter Quantity',
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        content: TextField(
          controller: dialogController,
          keyboardType: TextInputType.number,
          autofocus: true,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 18, color: Colors.white),
          decoration: InputDecoration(
            hintText: 'Enter quantity',
            hintStyle: TextStyle(color: Colors.grey.shade400),
            filled: true,
            fillColor: Colors.grey.shade700,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide.none),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Colors.blue, width: 2),
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('Cancel', style: TextStyle(color: Colors.grey.shade400)),
          ),
          ElevatedButton(
            onPressed: () {
              final newValue = int.tryParse(dialogController.text);
              if (newValue != null && newValue >= minValue && newValue <= maxValue) {
                onChanged(newValue);
                Navigator.of(context).pop();
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            ),
            child: const Text('OK', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}
