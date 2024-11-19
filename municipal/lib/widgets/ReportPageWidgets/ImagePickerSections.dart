
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:municipal/DesingContstant.dart';

class ImagePickerSection extends StatelessWidget {
  final VoidCallback onTap;

  const ImagePickerSection({
    Key? key,
    required this.onTap,
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
                  child: Icon(CupertinoIcons.photo_fill, color: Colors.grey, size: 48),
                ),
              ),
            ),
            Text(
              "Add Photo",
              style: textFont.copyWith(color: accentColor, fontSize: HeadlineSize),
            ),
          ],
        ),
      ),
    );
  }
}
