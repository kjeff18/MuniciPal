import 'package:flutter/material.dart';
import 'package:municipal/DesingContstant.dart';

class DescriptionSection extends StatelessWidget {
  final TextEditingController controller;

  const DescriptionSection({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Description',
              style: textFont.copyWith(
                fontSize: bodyTextSize,
                color: accentColor,
              ),
            ),
            const SizedBox(width: 8),
            Text(
              '(${controller.text.length}/200)',
              style: textFont.copyWith(
                fontSize: bodyTextSize,
                color: accentColor,
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: defaultPadding),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: accentColor,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(textFieldBorderRadius),
            ),
            width: double.infinity,
            height: 250, // Container height
            child: TextField(
              controller: controller,
              maxLines: null,  // Allow infinite lines
              expands: true,    // Expands to take up all available space
              maxLength: 300,
              textAlignVertical: TextAlignVertical.top, // Align text to the top
              decoration: const InputDecoration(
                hintText: "Enter your text here...",
                border: InputBorder.none, // Remove the default border
                contentPadding: EdgeInsets.all(defaultPadding), // Padding inside the TextField
                counterText: "", // Hide the maxLength counter
              ),
            ),
          ),
        ),
      ],
    );
  }
}