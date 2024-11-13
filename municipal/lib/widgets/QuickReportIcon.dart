import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class QuickReportIcon extends StatelessWidget {
  final String iconPath;
  final double size;
  const QuickReportIcon({super.key, required this.iconPath, this.size = 82});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(iconPath, height: size, width: size) 
    ;
  }
}