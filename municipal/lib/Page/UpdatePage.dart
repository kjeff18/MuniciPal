import 'package:flutter/material.dart';
import 'package:municipal/models/IssueCategory.dart';
import 'package:municipal/models/ModelProvider.dart';
import 'package:municipal/widgets/CustomAppBar.dart';
import 'package:municipal/widgets/UpdatePageWidgets/UpdateWidget.dart';
import 'package:municipal/Repositories/APIRepo.dart';
import 'package:municipal/HelperFunction/TimeAgoConverter.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'dart:convert';
import 'package:amplify_flutter/amplify_flutter.dart';

class UpdatePage extends StatefulWidget {
  final List<String> issueIds;
  const UpdatePage({super.key, required this.issueIds});

  @override
  State<UpdatePage> createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  bool isLoading = true;
  bool hasError = false;
  List<IssueStatusUpdate> myIssueStatusUpdates = [];

  @override
  void initState() {
    super.initState();
    _loadIssueStatusUpdates(); // Call the loading function
  }

  Future<void> _loadIssueStatusUpdates() async {
    try {
      final updates = await fetchIssueStatusUpdates(widget.issueIds);
      if (mounted) {
        setState(() {
          myIssueStatusUpdates = updates;
          isLoading = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          hasError = true;
          isLoading = false;
        });
      }
    }
  }

  Future<List<IssueStatusUpdate>> fetchIssueStatusUpdates(
      List<String> issueIds) async {
    print("Fetching status updates for issue IDs: $issueIds");
    List<IssueStatusUpdate> statusUpdates = [];

    try {
      for (final id in issueIds) {
        final String graphQLDocument = '''
        query StatusUpdatesByIssueId {
          listIssueStatusUpdates(filter: {issueId: {eq: "$id"}}) {
            items {
              id
              issueId
              issueCategory
              issueImageUrl
              status
              createdAt
            }
          }
        }
      ''';

        final response = await Amplify.API
            .query(
              request: GraphQLRequest<String>(
                document: graphQLDocument,
              ),
            )
            .response;

        if (response.errors.isNotEmpty) {
          throw Exception('GraphQL Error: ${response.errors.first.message}');
        }

        final data = response.data;

        if (data == null) continue;

        final decodedData = jsonDecode(data);
        final items = decodedData['listIssueStatusUpdates']?['items'] as List?;

        if (items != null) {
          statusUpdates
              .addAll(items.map((item) => IssueStatusUpdate.fromJson(item)));
        }
      }

      return statusUpdates;
    } catch (e) {
      print('Error fetching status updates by issue IDs: $e');
      rethrow;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Updates",
        showBackButton: true,
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : hasError
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Failed to fetch updates."),
                      const SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: () =>
                            fetchIssueStatusUpdates(widget.issueIds),
                        child: const Text("Retry"),
                      ),
                    ],
                  ),
                )
              : myIssueStatusUpdates.isEmpty
                  ? const Center(child: Text("You have no updates."))
                  : RefreshIndicator(
                      onRefresh: () async {
                        await _loadIssueStatusUpdates();
                      },
                      child: ListView.builder(
                        itemCount: myIssueStatusUpdates.length,
                        itemBuilder: (context, index) {
                          final update = myIssueStatusUpdates[index];
                          return UpdateWidget(
                            key: ValueKey(update.id),
                            issueStatusUpdate: update,
                          );
                        },
                      ),
                    ),
    );
  }
}
