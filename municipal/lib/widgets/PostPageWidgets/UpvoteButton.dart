import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:municipal/DesingContstant.dart';
import 'package:municipal/models/ModelProvider.dart';
import 'package:municipal/model/UserState.dart';
import 'package:provider/provider.dart';
import 'dart:convert';

class UpvoteButton extends StatefulWidget {
  final Issue issue;
  final ValueChanged<int> onUpvoteChange;

  const UpvoteButton(
      {Key? key, required this.issue, required this.onUpvoteChange})
      : super(key: key);

  @override
  _UpvoteButtonState createState() => _UpvoteButtonState();
}

class _UpvoteButtonState extends State<UpvoteButton> {
  bool hasUpvoted = false;
  String? upvoteId;
  int? upvoteVersion;
  bool _isCooldownActive = false;
  final int cooldownDuration = 500; 

  @override
  void initState() {
    super.initState();
    checkIfUpvoted();
  }

  Future<void> checkIfUpvoted() async {
    final authUser = Provider.of<UserState>(context, listen: false).authUser;
    if (authUser == null || authUser.userId.isEmpty) return;

    try {
      final query = '''
        query ListUpvotes(\$filter: ModelUpvoteFilterInput) {
          listUpvotes(filter: \$filter) {
            items {
              id
              _version
            }
          }
        }
      ''';

      final response = await Amplify.API
          .query(
            request: GraphQLRequest<String>(
              document: query,
              variables: {
                'filter': {
                  'citizenId': {'eq': authUser.userId},
                  'issueId': {'eq': widget.issue.id},
                  '_deleted': {'ne': true},
                },
              },
            ),
          )
          .response;

      if (response.errors.isNotEmpty) {
        print("Error checking upvote: ${response.errors}");
        return;
      }
      final Map<String, dynamic> jsonData = jsonDecode(response.data!);
      final upvotes = jsonData['listUpvotes']['items'];
      print("Upvote Status: ${upvotes.isNotEmpty}");
      setState(() {
        hasUpvoted = upvotes.isNotEmpty;
        upvoteId = hasUpvoted ? upvotes.first['id'] : null;
        upvoteVersion = hasUpvoted ? upvotes.first['_version'] : null;
      });
    } catch (e) {
      print("Error in checkIfUpvoted: $e");
    }
  }

  Future<void> upVoteButton() async {
    // Check if cooldown is active
    if (_isCooldownActive) {
      return;
    }

    // Activate cooldown
    setState(() {
      _isCooldownActive = true;
    });

    // Start a timer to disable the button for a specific period (cooldown)
    Future.delayed(Duration(milliseconds: cooldownDuration), () {
      setState(() {
        _isCooldownActive = false;
      });
    });

    final authUser = Provider.of<UserState>(context, listen: false).authUser;

    if (authUser == null || authUser.userId.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("You must be logged in to upvote.")),
      );
      return;
    }

    try {
      // Fetch the latest issue
      const fetchQuery = '''
        query GetIssue(\$id: ID!) {
          getIssue(id: \$id) {
            id
            upvotes
            _version
          }
        }
      ''';

      final fetchResponse = await Amplify.API
          .query(
            request: GraphQLRequest<String>(
              document: fetchQuery,
              variables: {'id': widget.issue.id},
            ),
          )
          .response;

      if (fetchResponse.errors.isNotEmpty) {
        throw Exception(
            "Error fetching issue: ${fetchResponse.errors.first.message}");
      }

      final Map<String, dynamic> jsonData = jsonDecode(fetchResponse.data!);
      final issueData = jsonData['getIssue'];
      final currentUpvotes = issueData['upvotes'] as int;
      final currentVersion = issueData['_version'] as int;

      if (hasUpvoted) {
        // Decrement upvotes
        const updateMutation = '''
          mutation UpdateIssue(\$input: UpdateIssueInput!) {
            updateIssue(input: \$input) {
              id
              upvotes
              _version
            }
          }
        ''';

        final updateResponse = await Amplify.API
            .mutate(
              request: GraphQLRequest<String>(
                document: updateMutation,
                variables: {
                  'input': {
                    'id': widget.issue.id,
                    'upvotes': currentUpvotes - 1,
                    '_version': currentVersion,
                  },
                },
              ),
            )
            .response;

        if (updateResponse.errors.isNotEmpty) {
          throw Exception(
              "Error updating issue: ${updateResponse.errors.first.message}");
        }

        // Delete the upvote
        const deleteMutation = '''
          mutation DeleteUpvote(\$input: DeleteUpvoteInput!) {
            deleteUpvote(input: \$input) {
              id
              _version
            }
          }
        ''';
        // Add a small delay to ensure consistency
        await Future.delayed(const Duration(milliseconds: 300));

        final deleteResponse = await Amplify.API
            .mutate(
              request: GraphQLRequest<String>(
                document: deleteMutation,
                variables: {
                  'input': {'id': upvoteId, '_version': upvoteVersion},
                },
              ),
            )
            .response;

        widget.onUpvoteChange(currentUpvotes - 1);

        setState(() {
          hasUpvoted = false;
          upvoteId = null;
          upvoteVersion = null;
        });
        print("Upvote Status: $hasUpvoted");

        if (deleteResponse.errors.isNotEmpty) {
          throw Exception(
              "Error deleting upvote: ${deleteResponse.errors.first.message}");
        }
      } else {
        // Increment upvotes
        const updateMutation = '''
          mutation UpdateIssue(\$input: UpdateIssueInput!) {
            updateIssue(input: \$input) {
              id
              upvotes
              _version
            }
          }
        ''';

        final updateResponse = await Amplify.API
            .mutate(
              request: GraphQLRequest<String>(
                document: updateMutation,
                variables: {
                  'input': {
                    'id': widget.issue.id,
                    'upvotes': currentUpvotes + 1,
                    '_version': currentVersion,
                  },
                },
              ),
            )
            .response;

        if (updateResponse.errors.isNotEmpty) {
          throw Exception(
              "Error updating issue: ${updateResponse.errors.first.message}");
        }

        // Create the upvote
        const createMutation = '''
          mutation CreateUpvote(\$input: CreateUpvoteInput!) {
            createUpvote(input: \$input) {
              id
              citizenId
              issueId
              _version
            }
          }
        ''';

        final createResponse = await Amplify.API
            .mutate(
              request: GraphQLRequest<String>(
                document: createMutation,
                variables: {
                  'input': {
                    'citizenId': authUser.userId,
                    'issueId': widget.issue.id,
                  },
                },
              ),
            )
            .response;

        widget.onUpvoteChange(currentUpvotes + 1);
        final Map<String, dynamic> jsonData = jsonDecode(createResponse.data!);
        final newUpvote = jsonData['createUpvote'];
        upvoteId = newUpvote['id'];
        upvoteVersion = newUpvote['_version'];

        setState(() {
          hasUpvoted = true;
        });

        if (createResponse.errors.isNotEmpty) {
          throw Exception(
              "Error creating upvote: ${createResponse.errors.first.message}");
        }
      }
    } catch (e) {
      print("Error in upVoteButton: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Failed to toggle upvote: $e")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: upVoteButton,
      icon: Icon(
        hasUpvoted
            ? CupertinoIcons.hand_thumbsup_fill
            : CupertinoIcons.hand_thumbsup,
        color: accentColor,
        size: 30,
      ),
    );
  }
}
