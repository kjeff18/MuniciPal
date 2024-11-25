import 'package:flutter/material.dart';
import 'package:municipal/DesingContstant.dart';
import 'package:municipal/Page/ReportPage.dart';
import 'package:municipal/widgets/CustomAppBar.dart';
import 'package:municipal/widgets/IssueCaterogryPageWidgets/IssueIcons.dart';
import 'package:municipal/Helper/ReportNameChecker.dart';

class IssueCategoryPage extends StatelessWidget {
  const IssueCategoryPage({super.key});

  void _issueIconPressed(String iconName, BuildContext context) {
    // Implement your button press logic here
    ReportNameChecker checker = ReportNameChecker();
    String reportName = checker.getReportName(iconName);
    print(reportName);
    String reportIcon = checker.getReportIconPath(iconName);
    print(reportIcon);

    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => ReportPage(
                iconPath: reportIcon,
                reportName: reportName,
              )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Issue Category',
        showBackButton: false,
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
                    onPressed: () => _issueIconPressed('ph', context),
                  ),
                ),
                Expanded(
                  child: Issueicons(
                    iconPath: streetLightIcon,
                    iconName: 'Street Light',
                    onPressed: () => _issueIconPressed('st', context),
                  ),
                ),
                Expanded(
                  child: Issueicons(
                    iconPath: waterLeakIcon,
                    iconName: 'Water Leak',
                    onPressed: () => _issueIconPressed('wt', context),
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
                    onPressed: () => _issueIconPressed('tl', context),
                  ),
                ),
                Expanded(
                  child: Issueicons(
                    iconPath: roadwayIcon,
                    iconName: 'Roadway',
                    onPressed: () => _issueIconPressed('rw', context),
                  ),
                ),
                Expanded(
                  child: Issueicons(
                    iconPath: sideWalkIcon,
                    iconName: 'Sidewalk',
                    onPressed: () => _issueIconPressed('sw', context),
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
                    onPressed: () => _issueIconPressed('dr', context),
                  ),
                ),
                Expanded(
                  child: Issueicons(
                    iconPath: streetSignIcon,
                    iconName: 'Street Sign',
                    onPressed: () => _issueIconPressed('ss', context),
                  ),
                ),
                Expanded(
                  child: Issueicons(
                    iconPath: graffitiIcon,
                    iconName: 'Graffiti',
                    onPressed: () => _issueIconPressed('gr', context),
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
                    onPressed: () => _issueIconPressed('pm', context),
                  ),
                ),
                Expanded(
                  child: Issueicons(
                    iconPath: treeMantainaceIcon,
                    iconName: 'Tree Maintenance',
                    onPressed: () => _issueIconPressed('tm', context),
                  ),
                ),
                Expanded(
                  child: Issueicons(
                    iconPath: pedestrainIcon,
                    iconName: 'Pedestrian Crossing',
                    onPressed: () => _issueIconPressed('pc', context),
                  ),
                ),
              ],
            ),
            // Centered 'Other' Icon
            Center(
              child: Issueicons(
                iconPath: otherIcon,
                iconName: 'Other',
                onPressed: () => _issueIconPressed('ot', context),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
