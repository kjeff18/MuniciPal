import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class QuickReportIcon extends StatelessWidget {
  final String iconPath;
  final double size;
  final VoidCallback onPressed;
  const QuickReportIcon(
      {super.key,
      required this.iconPath,
      required this.onPressed,
      this.size = 60});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onPressed,
        child: SvgPicture.asset(iconPath, height: size, width: size * 0.5));
  }
}
