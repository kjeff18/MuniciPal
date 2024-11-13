import 'package:flutter/material.dart';
import 'package:municipal/DesingContstant.dart';
import 'package:municipal/widgets/CustomAppBar.dart';
import 'package:municipal/widgets/IssueIcons.dart';

class IssueCategoryPage extends StatelessWidget {
  const IssueCategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: const CustomAppBar(
        title: 'Issue Category',
        showBackButton: true,
      ),
      backgroundColor: backgroundColor,
      body: Padding(
        padding: EdgeInsets.only(top:defaultPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
        
            // Row 1
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: Issueicons(iconPath: potholeIcon, iconName: 'Pothole')),
                Expanded(child: Issueicons(iconPath: streetLightIcon, iconName: 'Street Light')),
                Expanded(child: Issueicons(iconPath: waterLeakIcon, iconName: 'Water Leak')),
              ],
            ),
            // Row 2
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: Issueicons(iconPath: trafficLightIcon, iconName: 'Traffic Light')),
                Expanded(child: Issueicons(iconPath: roadwayIcon, iconName: 'Roadway')),
                Expanded(child: Issueicons(iconPath: sideWalkIcon, iconName: 'Sidewalk')),
              ],
            ),
            // Row 3
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: Issueicons(iconPath: drainageIcon, iconName: 'Drainage')),
                Expanded(child: Issueicons(iconPath: streetSignIcon, iconName: 'Street Sign')),
                Expanded(child: Issueicons(iconPath: graffitiIcon, iconName: 'Graffiti')),
              ],
            ),
            // Row 4
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: Issueicons(iconPath: parkMaintainanceIcon, iconName: 'Park Maintenance')),
                Expanded(child: Issueicons(iconPath: treeMantainaceIcon, iconName: 'Tree Maintenance')),
                Expanded(child: Issueicons(iconPath: pedestrainIcon, iconName: 'Pedestrian Crossing')),
              ],
            ),
            // Centered 'Other' Icon
            Center(child: Issueicons(iconPath: otherIcon, iconName: 'Other')),
          ],
        ),
      ),
    );
  }
}
