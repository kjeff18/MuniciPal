import 'package:flutter/material.dart';
import 'package:municipal/DesingContstant.dart';
import 'package:municipal/widgets/CustomAppBar.dart';
import 'package:municipal/widgets/IssueIcons.dart';
import 'package:municipal/HelperFunction/ReportNameChecker.dart';

class IssueCategoryPage extends StatelessWidget {
  const IssueCategoryPage({super.key});

  void _issueIconPressed(String iconName) {
    // Implement your button press logic here
    ReportNameChecker checker = ReportNameChecker();
    String reportName = checker.getReportName(iconName);    
    print(reportName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Issue Category',
        showBackButton: true,
      ),
      backgroundColor: backgroundColor,
      body: Padding(
        padding: const EdgeInsets.only(top: defaultPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // Row 1
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Issueicons(
                    iconPath: potholeIcon,
                    iconName: 'Pothole',
                    onPressed: () => _issueIconPressed('ph'),
                  ),
                ),
                Expanded(
                  child: Issueicons(
                    iconPath: streetLightIcon,
                    iconName: 'Street Light',
                    onPressed: () => _issueIconPressed('st'),
                  ),
                ),
                Expanded(
                  child: Issueicons(
                    iconPath: waterLeakIcon,
                    iconName: 'Water Leak',
                    onPressed: () => _issueIconPressed('wt'),
                  ),
                ),
              ],
            ),
            // Row 2
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Issueicons(
                    iconPath: trafficLightIcon,
                    iconName: 'Traffic Light',
                    onPressed: () => _issueIconPressed('tl'),
                  ),
                ),
                Expanded(
                  child: Issueicons(
                    iconPath: roadwayIcon,
                    iconName: 'Roadway',
                    onPressed: () => _issueIconPressed('rw'),
                  ),
                ),
                Expanded(
                  child: Issueicons(
                    iconPath: sideWalkIcon,
                    iconName: 'Sidewalk',
                    onPressed: () => _issueIconPressed('sw'),
                  ),
                ),
              ],
            ),
            // Row 3
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Issueicons(
                    iconPath: drainageIcon,
                    iconName: 'Drainage',
                    onPressed: () => _issueIconPressed('dr'),
                  ),
                ),
                Expanded(
                  child: Issueicons(
                    iconPath: streetSignIcon,
                    iconName: 'Street Sign',
                    onPressed: () => _issueIconPressed('ss'),
                  ),
                ),
                Expanded(
                  child: Issueicons(
                    iconPath: graffitiIcon,
                    iconName: 'Graffiti',
                    onPressed: () => _issueIconPressed('gr'),
                  ),
                ),
              ],
            ),
            // Row 4
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Issueicons(
                    iconPath: parkMaintainanceIcon,
                    iconName: 'Park Maintenance',
                    onPressed: () => _issueIconPressed('pm'),
                  ),
                ),
                Expanded(
                  child: Issueicons(
                    iconPath: treeMantainaceIcon,
                    iconName: 'Tree Maintenance',
                    onPressed: () => _issueIconPressed('tm'),
                  ),
                ),
                Expanded(
                  child: Issueicons(
                    iconPath: pedestrainIcon,
                    iconName: 'Pedestrian Crossing',
                    onPressed: () => _issueIconPressed('pc'),
                  ),
                ),
              ],
            ),
            // Centered 'Other' Icon
            Center(
              child: Issueicons(
                iconPath: otherIcon,
                iconName: 'Other',
                onPressed: () => _issueIconPressed('ot'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
