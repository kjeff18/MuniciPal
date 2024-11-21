import 'package:flutter/material.dart';
import 'package:municipal/DesingContstant.dart';
import 'package:municipal/models/IssueStatus.dart';
import 'package:municipal/widgets/CustomAppBar.dart';
import 'package:municipal/widgets/FeedPageWidgets/FeedContainer.dart';

class FeedPage extends StatelessWidget {
  const FeedPage({super.key});

  void postClick(){

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Feed"),
      backgroundColor: backgroundColor,
      body: ListView(
        children: [
          FeedContainer(postTitle: 'Pothole', numberOfMilesAway: 4, numberOfVote: 5, issueStatus: IssueStatus.OPEN, onPressed: () => postClick, ),
          
        ],
      ),
    );
  }
}