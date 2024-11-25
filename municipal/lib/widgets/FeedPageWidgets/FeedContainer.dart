import 'package:flutter/material.dart';
import 'package:municipal/DesingContstant.dart';
import 'package:municipal/Helper/IssueCategory.dart';
import 'package:municipal/models/ModelProvider.dart';
import 'package:municipal/widgets/FeedPageWidgets/CustomProgressIndicator.dart';

class FeedContainer extends StatelessWidget {
  final IssueCategory issueCategory;
  final VoidCallback onPressed;
  final double numberOfMilesAway;
  final int numberOfVote;
  final IssueStatus issueStatus;
  final String imageUrl; // New parameter for image URL

  FeedContainer({
    super.key,
    required this.onPressed,
    required this.issueCategory,
    required this.numberOfMilesAway,
    required this.numberOfVote,
    required this.issueStatus,
    required this.imageUrl, // Required for displaying the image
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(defaultPadding),
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          height: 304,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(textFieldBorderRadius + 3),
            border: Border.all(color: secondaryColor, width: 2.0),
          ),
          child: Column(
            children: [
              Stack(
                children: [
                  // Image container with a fixed height
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(textFieldBorderRadius),
                      topRight: Radius.circular(textFieldBorderRadius),
                    ),
                    child: Container(
                      height: 200, // Maintain consistent height
                      width: double.infinity,
                      color: Colors.grey[300], // Placeholder background color
                      child: Image.network(
                        imageUrl,
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: 200,
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        },
                        errorBuilder: (context, error, stackTrace) {
                          return const Center(
                            child: Icon(
                              Icons.broken_image,
                              size: 50,
                              color: Colors.grey,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  CustomProgressIndicator(
                    issueStatus: issueStatus,
                  ),
                ],
              ),
              Container(
                width: double.infinity,
                height: 100,
                decoration: const BoxDecoration(
                  color: backgroundColor,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(textFieldBorderRadius),
                    bottomRight: Radius.circular(textFieldBorderRadius),
                  ),
                ),
                padding: const EdgeInsets.all(textFieldBorderRadius),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            ReportType.getReportName(issueCategory),
                            style: textFont.copyWith(
                                color: accentColor, fontSize: PostTitleSize),
                          ),
                          Text(
                            '${numberOfMilesAway.toStringAsFixed(1)} miles away',
                            style: textFont.copyWith(
                                color: hintTextColor, fontSize: bodyTextSize),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "$numberOfVote upvotes",
                          style: textFont.copyWith(
                              color: accentColor, fontSize: bodyTextSize),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
