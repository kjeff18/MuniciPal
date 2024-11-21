import 'package:flutter/material.dart';
import 'package:municipal/DesingContstant.dart';
import 'package:municipal/Page/PostPage.dart';
import 'package:municipal/models/IssueStatus.dart';
import 'package:municipal/widgets/CustomAppBar.dart';
import 'package:municipal/widgets/FeedPageWidgets/FeedContainer.dart';

class MyReportPage extends StatelessWidget {
  const MyReportPage({super.key});


void postClick(BuildContext context){
   Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PostPage(numberOfUpvotes: 5, issueStatus: IssueStatus.IN_PROGRESS,)),
    );

}

void bellButton()
{

}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "My Report",showBellIcon: true, onPressed:  () => bellButton,),
      backgroundColor: backgroundColor,
      body: ListView(
        children: [
         FeedContainer(postTitle: 'Pothole', numberOfMilesAway: 4, numberOfVote: 5, issueStatus: IssueStatus.OPEN, onPressed: () => postClick(context),),
        ]
      ),
    );
  }
}