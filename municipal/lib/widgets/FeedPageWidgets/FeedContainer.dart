import 'package:flutter/material.dart';
import 'package:municipal/DesingContstant.dart';
import 'package:municipal/Helper/IssueCategory.dart';
import 'package:municipal/models/ModelProvider.dart';
import 'package:municipal/widgets/FeedPageWidgets/CustomProgressIndicator.dart';
import 'package:municipal/Helper/DistanceCalculator.dart';
import 'package:municipal/Helper/UserLocation.dart';
import 'package:municipal/Page/PostPage.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

class FeedContainer extends StatefulWidget {
  Issue issue;
  final ValueChanged<Issue> onIssueUpdated;
  final UserLocation userLocation;

  FeedContainer({
    super.key,
    required this.issue,
    required this.onIssueUpdated,
    required this.userLocation,
  });

  @override
  State<FeedContainer> createState() => _FeedContainerState();
}

class _FeedContainerState extends State<FeedContainer> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(defaultPadding),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PostPage(
                  issue: widget.issue,
                  onIssueUpdated: (updatedIssue) {
                    setState(() {
                      // Replace the updated issue in the list
                      widget.issue = updatedIssue;
                    });
                  },
                ),
              ));
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
                      child: CachedNetworkImage(
                        imageUrl: widget.issue.imageUrls!.first,
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: 200,
                        placeholder: (context, url) => const Center(
                          child: CircularProgressIndicator(),
                        ),
                        errorWidget: (context, url, error) => const Center(
                          child: Icon(
                            Icons.broken_image,
                            size: 50,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  ),
                  CustomProgressIndicator(
                    issueStatus: widget.issue.status,
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
                            ReportType.getReportName(widget.issue.category!),
                            style: textFont.copyWith(
                                color: accentColor, fontSize: PostTitleSize),
                          ),
                          Text(
                            '${widget.userLocation.currentPosition == null ? "0.0" : DistanceCalculator.calculateDistanceInMiles(
                                  userLatitude: widget
                                      .userLocation.currentPosition!.latitude,
                                  userLongitude: widget
                                      .userLocation.currentPosition!.longitude,
                                  issueLatitude: widget.issue.latitude,
                                  issueLongitude: widget.issue.longitude,
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
                          "${widget.issue.upvotes} upvotes",
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
