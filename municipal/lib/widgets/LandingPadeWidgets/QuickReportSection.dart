import 'package:flutter/material.dart';
import 'package:municipal/widgets/QuickReportIcon.dart';
import 'package:municipal/DesingContstant.dart';

class QuickReportSection extends StatelessWidget {
  final bool isVisible;
  final Function(String) onReportButtonPressed;

  const QuickReportSection({
    Key? key,
    required this.isVisible,
    required this.onReportButtonPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return AnimatedPositioned(
      bottom: screenSize.height * 0.15,
      right: isVisible ? screenSize.width * 0.02 : -500,
      curve: Curves.easeInOut,
      duration:  Duration(milliseconds: animationDuration),
      child: AnimatedOpacity(
        opacity: isVisible ? 1.0 : 0.0,
        duration:  Duration(milliseconds: animationDuration),
        curve: Curves.easeInOutCubicEmphasized,
        child: Column(
          children: [
            QuickReportIcon(iconPath: potholeIcon, onPressed: () => onReportButtonPressed("Pothole")),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: defaultPadding),
              child: QuickReportIcon(iconPath: trafficLightIcon, onPressed: () => onReportButtonPressed("Traffic Light")),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: defaultPadding),
              child: QuickReportIcon(iconPath: streetLightIcon, onPressed: () => onReportButtonPressed("Street Light")),
            ),
          ],
        ),
      ),
    );
  }
}
