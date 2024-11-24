import 'package:flutter/material.dart';
import 'package:municipal/DesingContstant.dart';
import 'package:municipal/Helper/IssueCatergory.dart';
import 'package:municipal/models/ModelProvider.dart';
import 'package:municipal/widgets/FeedPageWidgets/CustomProgressIndicator.dart';

class FeedContainer extends StatelessWidget {
  IssueCategory issueCategory;
  VoidCallback onPressed;
  double numberOfMilesAway;
  int numberOfVote;
  IssueStatus issueStatus;
  
   FeedContainer({super.key, required this.onPressed, required this.issueCategory, required this.numberOfMilesAway, required this.numberOfVote, required this.issueStatus });


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
            border: Border.all(color: secondaryColor, width: 2.0)
          ),
          child: Column(
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(textFieldBorderRadius),
                      topRight: Radius.circular(textFieldBorderRadius),
                    ),
                    child: Image.asset(
                      "assets/IssueIcons/image.png",
                      fit: BoxFit.cover, 
                      width: double.infinity,
                      height: 200, 
                    ),
                  ),
                  CustomProgressIndicator(issueStatus: issueStatus,),
                ],
              ),
              Container(
                width: double.infinity,
                height: 100 ,
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
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                         ReportType.getReportName(issueCategory) ,
                          style: textFont.copyWith(color: accentColor, fontSize: PostTitleSize),
                        ),
                        Text(
                          '${numberOfMilesAway} miles away',
                          style: textFont.copyWith(color: hintTextColor, fontSize: bodyTextSize),
                        ),
                      ],
                    ),
                    Spacer(),
        
                    Text("${numberOfVote} upvotes", style: textFont.copyWith(color: accentColor, fontSize: bodyTextSize),),
                  
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
