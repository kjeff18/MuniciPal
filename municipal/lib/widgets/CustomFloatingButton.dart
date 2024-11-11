import 'package:flutter/material.dart';
import 'package:municipal/DesingContstant.dart';

class CustomFloatingButton extends StatelessWidget {
  final VoidCallback onPressed; 

  const CustomFloatingButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      child: const Icon(Icons.menu, color: backgroundColor),
      backgroundColor: accentColor, // Hamburger icon
    );
  }
}
