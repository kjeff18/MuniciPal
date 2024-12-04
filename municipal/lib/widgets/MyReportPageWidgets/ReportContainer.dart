import 'package:flutter/material.dart';
import 'package:municipal/DesingContstant.dart';
import 'package:municipal/Helper/ReportType.dart';
import 'package:municipal/models/ModelProvider.dart';
import 'package:municipal/widgets/FeedPageWidgets/CustomProgressIndicator.dart';
import 'package:municipal/Helper/DistanceCalculator.dart';
import 'package:municipal/Helper/UserLocation.dart';
import 'package:municipal/Page/PostPage.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:municipal/HelperFunction/TimeAgoConverter.dart';
import 'package:municipal/Repositories/APIRepo.dart';

class ReportContainer extends StatefulWidget {
  Report report;
  final UserLocation userLocation;

  ReportContainer({
    super.key,
    required this.report,
    required this.userLocation,
  });

  @override
  State<ReportContainer> createState() => _ReportContainerState();
}

class _ReportContainerState extends State<ReportContainer> {
  Future<Issue> fetchIssue() async {
    final issue = await APIWrapper().readData(
      Issue.classType,
      filters: Issue.ID.eq(widget.report.issueId),
    );
    return issue.first;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(defaultPadding),
      child: GestureDetector(
        onTap: () async {
          try {
            // Fetch the issue asynchronously
            final issue = await fetchIssue();

            // Check if the widget is still mounted before navigating
            if (!mounted) return;

            // Navigate to the PostPage once the issue is fetched
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PostPage(
                  issue: issue,
                  onIssueUpdated: (updatedIssue) {
                    // Handle the issue update
                  },
                ),
              ),
            );
          } catch (e) {
            if (!mounted) return;
            // Handle errors gracefully
            print('Error fetching issue: $e');
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Failed to load the issue')),
            );
          }
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(textFieldBorderRadius + 3),
            border: Border.all(color: secondaryColor, width: 2.0),
          ),
          child: Column(
            children: [
              if (widget.report.imageUrl != null &&
                  widget.report.imageUrl!.isNotEmpty)
                // Display the image if imageUrl is not null and not empty
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
                      imageUrl: widget.report.imageUrl!,
                      fit: BoxFit.cover,
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
                )
              else
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(textFieldBorderRadius),
                    topRight: Radius.circular(textFieldBorderRadius),
                  ),
                  child: Container(
                    width: double.infinity,
                    color: Colors.grey[50], // Background color for text
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 12.0,
                    ), // Add padding around the text
                    child: Text(
                      widget.report.description ?? "No description available",
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              Container(
                width: double.infinity,
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
                            ReportType.getReportName(widget.report.category),
                            style: textFont.copyWith(
                                color: accentColor, fontSize: PostTitleSize),
                          ),
                          Text(
                            '${widget.userLocation.currentPosition == null ? "0.0" : DistanceCalculator.calculateDistanceInMiles(
                                  userLatitude: widget
                                      .userLocation.currentPosition!.latitude,
                                  userLongitude: widget
                                      .userLocation.currentPosition!.longitude,
                                  issueLatitude: widget.report.latitude,
                                  issueLongitude: widget.report.longitude,
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
                        Container(
                          padding: const EdgeInsets.only(bottom: 35),
                          child: Text(
                            "${TimeAgoConverter.calculateTimeAgo(widget.report.createdAt.toString())} ago",
                            style: textFont.copyWith(
                                color: hintTextColor, fontSize: bodyTextSize),
                          ),
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
