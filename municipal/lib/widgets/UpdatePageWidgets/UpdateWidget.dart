import 'package:flutter/material.dart';
import 'package:municipal/DesingContstant.dart';
import 'package:municipal/Helper/ProgressIndicatorChecker.dart';
import 'package:municipal/Helper/ReportType.dart';
import 'package:municipal/models/ModelProvider.dart';
import 'package:municipal/HelperFunction/TimeAgoConverter.dart';
import 'package:cached_network_image/cached_network_image.dart';

class UpdateWidget extends StatefulWidget {
  final IssueStatusUpdate issueStatusUpdate;

  // Constructor for UpdateWidget
  const UpdateWidget({super.key, required this.issueStatusUpdate});

  @override
  _UpdateWidgetState createState() => _UpdateWidgetState();
}

class _UpdateWidgetState extends State<UpdateWidget> {
  late ProgressIndicatorChecker _progressIndicatorChecker;
  late String reportTitle;
  late String issueImageUrl;
  late String issueStatusText;

  @override
  void initState() {
    super.initState();
    // Initialize the necessary objects here
    _progressIndicatorChecker =
        ProgressIndicatorChecker(); // Ensure this is initialized
    reportTitle =
        ReportType.getReportName(widget.issueStatusUpdate.issueCategory);
    issueImageUrl = widget.issueStatusUpdate.issueImageUrl;
    issueStatusText =
        _progressIndicatorChecker.getProgress(widget.issueStatusUpdate.status);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(defaultPadding),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image container with rounded corners and adjusted size
          Container(
            width: 80, // Increased width
            height: 80, // Increased height
            decoration: BoxDecoration(
              border: Border.all(
                color: secondaryColor, // Border color
                width: 2.0, // Border width
              ),
              borderRadius:
                  BorderRadius.circular(textFieldBorderRadius), // Border radius
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(textFieldBorderRadius -
                  4), // Ensure image corners are rounded
              child: CachedNetworkImage(
                imageUrl: issueImageUrl,
                fit: BoxFit.cover, // Ensure the image fills the container
                placeholder: (context, url) => const SizedBox.shrink(),
                errorWidget: (context, url, error) =>
                    const Icon(Icons.broken_image),
              ),
            ),
          ),
          const SizedBox(width: 8), // Add space between the image and text
          Expanded(
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'Report "$reportTitle" has been changed to ',
                    style: textFont.copyWith(
                      color: textColor,
                      fontSize: bodyTextSize,
                    ),
                  ),
                  TextSpan(
                    text: issueStatusText,
                    style: textFont.copyWith(
                      color: accentColor,
                      fontSize: bodyTextSize,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: '  ', // Add minimal space between lines
                  ),
                  TextSpan(
                    text:
                        '${TimeAgoConverter.calculateTimeAgo(widget.issueStatusUpdate.createdAt.toString())} ago',
                    style: textFont.copyWith(
                      color: hintTextColor,
                      fontSize: bodyTextSize,
                      height: 1.0, // Adjust line height for tighter spacing
                    ),
                  ),
                ],
              ),
              maxLines: null, // Allow the text to wrap if needed
              overflow: TextOverflow.visible, // Allow the text to expand fully
            ),
          ),
        ],
      ),
    );
  }
}
