import 'package:flutter/material.dart';
import 'package:municipal/DesingContstant.dart';
import 'package:municipal/Helper/ReportType.dart';
import 'package:municipal/models/ModelProvider.dart';
import 'package:municipal/widgets/CustomAppBar.dart';
import 'package:municipal/widgets/FeedPageWidgets/CustomProgressIndicator.dart';
import 'package:municipal/widgets/PostPageWidgets/PostNMapContainer.dart';
import 'package:municipal/widgets/PostPageWidgets/SimilarPostDescription.dart';
import 'package:municipal/Repositories/APIRepo.dart';
import 'package:municipal/widgets/PostPageWidgets/UpvoteButton.dart';

class PostPage extends StatefulWidget {
  Issue issue;
  final ValueChanged<Issue> onIssueUpdated;

  PostPage({
    super.key,
    required this.issue,
    required this.onIssueUpdated,
  });

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  final APIWrapper apiWrapper = APIWrapper();
  bool isLoading = true;
  bool hasError = false;
  List<Report> relatedReports = [];
  bool isProcessingUpvote = false; // Flag to track upvote processing

  @override
  void initState() {
    super.initState();
    fetchRelatedReports();
  }

  Future<void> fetchRelatedReports() async {
    setState(() {
      isLoading = true;
      hasError = false;
    });

    try {
      final reports = await apiWrapper.readData<Report>(
        Report.classType,
        filters: Report.ISSUEID.eq(widget.issue.id),
      );
      debugPrint("Related reports retrieved: ${reports.length}");

      setState(() {
        relatedReports = reports;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        hasError = true;
        isLoading = false;
      });
      debugPrint("Error fetching related reports: $e");
    }
  }

  // Function to handle upvote change
  void _handleUpvoteChange(int upvotes) async {
    // Prevent multiple fast clicks
    if (isProcessingUpvote) return;

    setState(() {
      isProcessingUpvote = true; // Set flag to prevent multiple clicks
    });

    // Store the current upvotes locally (before making API calls or changes)
    setState(() {
      widget.issue = widget.issue.copyWith(upvotes: upvotes);
    });

    await Future.delayed(const Duration(milliseconds: 500)); // Simulate a delay for network request

    widget.onIssueUpdated(widget.issue);

    setState(() {
      isProcessingUpvote = false; // Reset flag after processing
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: ReportType.getReportName(
            widget.issue.category ?? IssueCategory.Other),
        showBackButton: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            // Constrain PostNMapContainer to a fixed height
            SizedBox(
              height: 300,
              child: PostNMapContainer(issue: widget.issue),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                // Disable the button when processing upvotes
                UpvoteButton(
                  issue: widget.issue,
                  onUpvoteChange: (upvotes) {
                    _handleUpvoteChange(upvotes); // Pass the upvotes value
                  },
                ),
                Text(
                  "${widget.issue.upvotes} upvotes",
                  style: textFont.copyWith(
                    color: accentColor,
                    fontSize: bodyTextSize,
                  ),
                ),
                const Spacer(),
                CustomProgressIndicator(issueStatus: widget.issue.status),
              ],
            ),
            const SizedBox(height: 16),
            // Display related reports dynamically
            isLoading
                ? const Center(child: CircularProgressIndicator())
                : hasError
                    ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Failed to fetch related reports."),
                            const SizedBox(height: 10),
                            ElevatedButton(
                              onPressed: fetchRelatedReports,
                              child: const Text("Retry"),
                            ),
                          ],
                        ),
                      )
                    : relatedReports.isEmpty
                        ? const Center(child: Text("No related reports found."))
                        : Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Filter reports with non-null descriptions
                                if (relatedReports.any(
                                    (report) => report.description != null))
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 8.0),
                                    child: Text(
                                      "Issue Descriptions (${relatedReports.where((report) => report.description != null).length})",
                                      style: textFont.copyWith(
                                        fontSize: bodyTextSize,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                Expanded(
                                  child: ListView.builder(
                                    itemCount: relatedReports.length,
                                    itemBuilder: (context, index) {
                                      final report = relatedReports[index];
                                      if (report.description == null) {
                                        return const SizedBox.shrink();
                                      }
                                      return SimilarPostDescription(
                                        username:
                                            report.citizenName,
                                        description: report.description!,
                                        createdAt: report.createdAt.toString(),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
          ],
        ),
      ),
    );
  }
}
