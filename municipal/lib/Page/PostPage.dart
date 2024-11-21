import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:municipal/DesingContstant.dart';
import 'package:municipal/models/ModelProvider.dart';
import 'package:municipal/widgets/CustomAppBar.dart';
import 'package:municipal/widgets/FeedPageWidgets/CustomProgressIndicator.dart';
import 'package:municipal/widgets/PostPageWidgets/PostNMapContainer.dart';

class PostPage extends StatelessWidget {
  int numberOfUpvotes;
  IssueStatus issueStatus;
   PostPage({super.key, required this.numberOfUpvotes, required this.issueStatus});

  void UpVoteButton ()
  {

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "", showBackButton: true),
      body: Padding(
        padding: const EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
           PostNMapContainer(),
           Row(
            children: [
              IconButton(onPressed:UpVoteButton , icon: Icon(CupertinoIcons.hand_thumbsup ,color: accentColor, size: 30,)),
              Text("${numberOfUpvotes} upvotes", style: textFont.copyWith(color: accentColor, fontSize: bodyTextSize,),),
              Spacer(),
              CustomProgressIndicator(issueStatus: issueStatus)
            ],
           )
          ],
        ),
      ),
    );
  }
}
