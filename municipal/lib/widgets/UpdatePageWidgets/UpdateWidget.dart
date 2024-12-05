import 'package:flutter/material.dart';
import 'package:municipal/DesingContstant.dart';
import 'package:municipal/Helper/ProgressIndicatorChecker.dart';
import 'package:municipal/Helper/ReportType.dart';
import 'package:municipal/models/ModelProvider.dart';

class UpdateWidget extends StatefulWidget {
  final IssueStatus issueStatus;
  final IssueCategory issueCategory;

  // Constructor for UpdateWidget
  const UpdateWidget({super.key, required this.issueCategory, required this.issueStatus});

  @override
  _UpdateWidgetState createState() => _UpdateWidgetState();
}

class _UpdateWidgetState extends State<UpdateWidget> {
  late ProgressIndicatorChecker _progressIndicatorChecker;
  late String reportTitle;
  late String issueStatusText;

  @override
  void initState() {
    super.initState();
    // Initialize the necessary objects here
    _progressIndicatorChecker = ProgressIndicatorChecker();
    reportTitle = ReportType.getReportName(widget.issueCategory);
    issueStatusText = _progressIndicatorChecker.getProgress(widget.issueStatus);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(defaultPadding),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(textFieldBorderRadius),  // Rounding the corners
            child: Container(
              width: 70,
              height: 70,  // Height of the image container
              decoration: BoxDecoration(
                border: Border.all(
                  color: accentColor,  // Border color
                  width: 3.0,  // Border width
                ),
              ),
              child: Image.asset(
                'assets/IssueIcons/image.png',  // Image path
                fit: BoxFit.cover,  // Ensure the image fills the container
              ),
            ),
          ),
          const SizedBox(width: 8),  // Add space between the image and text
          Expanded(
            child: Text.rich(
              TextSpan(
                text: 'Report "$reportTitle" has been ',
                style: textFont.copyWith(color: textColor, fontSize: bodyTextSize),
                children: <InlineSpan>[
                  TextSpan(
                    text: issueStatusText,
                    style: textFont.copyWith(color: accentColor, fontSize: bodyTextSize, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              maxLines: null,  // Allow the text to wrap if needed
              overflow: TextOverflow.visible,  // Allow the text to expand fully
            ),
          ),
        ],
      ),
    );
  }
}
