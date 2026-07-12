import 'package:flutter/material.dart';

class SelectSize extends StatefulWidget {
  const SelectSize({super.key});

  @override
  State<SelectSize> createState() => _SelectSizeState();
}

class _SelectSizeState extends State<SelectSize> {
  final List<String> sizes = ['S', 'M', 'L', 'XL'];

  String? selectedSize;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Select Size',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 10),

        Wrap(
          spacing: 10,
          children: sizes.map((size) {
            return ChoiceChip(
              label: Text(size),
              selected: selectedSize == size,
              onSelected: (value) {
                setState(() {
                  selectedSize = size;
                });
              },
            );
          }).toList(),
        ),

        const SizedBox(height: 20),

        Text(
          selectedSize == null
              ? 'No size selected'
              : 'Selected Size: $selectedSize',
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}