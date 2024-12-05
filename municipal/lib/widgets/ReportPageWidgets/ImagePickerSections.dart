import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:municipal/DesingContstant.dart';

class ImagePickerSection extends StatelessWidget {
  final VoidCallback onTap;
  final File? selectedImage; // Pass the selected image to this widget

  const ImagePickerSection({
    Key? key,
    required this.onTap,
    this.selectedImage, // Optional, can be null
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: defaultPadding),
      child: Container(
        width: double.infinity,
        height: 100,
        decoration: BoxDecoration(
          border: Border.all(
            color: accentColor,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(textFieldBorderRadius),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              child: Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: accentColor,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(textFieldBorderRadius),
                ),
                child: InkWell(
                  onTap: onTap,
                  child: selectedImage == null
                      ? Icon(CupertinoIcons.photo_fill, color: Colors.grey, size: 48) // Show icon if no image is selected
                      : ClipRRect(
                          borderRadius: BorderRadius.circular(textFieldBorderRadius - 2),
                          child: Image.file(
                            selectedImage!, // Display the selected image
                            fit: BoxFit.cover,
                          ),
                        ),
                ),
              ),
            ),
            Text(
              selectedImage == null ? "Add Photo" : "Change Photo", // Change text if image is selected
              style: textFont.copyWith(color: accentColor, fontSize: bodyTextSize + 6),
            ),
          ],
        ),
      ),
    );
  }
}
