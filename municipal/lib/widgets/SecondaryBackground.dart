import 'package:flutter/material.dart';
import 'package:municipal/DesingContstant.dart';

class Secondarybackground extends StatelessWidget {
  const Secondarybackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.8 ,  // Ensure full screen height
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(secondaryBackgroundBorderRadius),
        ),
      ),
    );
  }
}
