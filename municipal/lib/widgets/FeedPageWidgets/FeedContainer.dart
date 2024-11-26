import 'package:flutter/material.dart';
import 'package:municipal/DesingContstant.dart';
import 'package:municipal/Helper/IssueCategory.dart';
import 'package:municipal/models/ModelProvider.dart';
import 'package:municipal/widgets/FeedPageWidgets/CustomProgressIndicator.dart';
import 'package:municipal/Helper/DistanceCalculator.dart';
import 'package:municipal/Helper/UserLocation.dart';
import 'package:municipal/Page/PostPage.dart';

class FeedContainer extends StatelessWidget {
  final Issue issue; // Pass the entire Issue object
  final UserLocation userLocation;
  final VoidCallback onPressed;

  FeedContainer({
    super.key,
    required this.issue,
    required this.userLocation,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(defaultPadding),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PostPage(issue: issue),
            ),
          );
        },
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
                        issue.imageUrls!.first,
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
                    issueStatus: issue.status,
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
                            ReportType.getReportName(issue.category!),
                            style: textFont.copyWith(
                                color: accentColor, fontSize: PostTitleSize),
                          ),
                          Text(
                            '${userLocation.currentPosition == null ? "0.0" : DistanceCalculator.calculateDistanceInMiles(
                                  userLatitude:
                                      userLocation.currentPosition!.latitude,
                                  userLongitude:
                                      userLocation.currentPosition!.longitude,
                                  issueLatitude: issue.latitude,
                                  issueLongitude: issue.longitude,
                                ) ?? "0.0"} miles away',
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
                          "${issue.upvotes} upvotes",
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
