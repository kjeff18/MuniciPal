import 'package:flutter/material.dart';
import 'package:municipal/DesingContstant.dart';
import 'package:municipal/Helper/ProgressIndicatorChecker.dart';
import 'package:municipal/models/IssueStatus.dart';

class CustomProgressIndicator extends StatelessWidget {
 final IssueStatus issueStatus;
   CustomProgressIndicator({super.key, required this.issueStatus});





  @override
  Widget build(BuildContext context) {

    ProgressIndicatorChecker _progressIndicatorChecker = ProgressIndicatorChecker();


  final String getProgress = _progressIndicatorChecker.getProgress(issueStatus);
  final Color getProgressColor = _progressIndicatorChecker.getProgressColor(issueStatus);
  double spacer = 30;

          if(issueStatus == IssueStatus.IN_PROGRESS)
          {
            spacer = 18;
          }

    return Padding(
      padding:  EdgeInsets.all(defaultPadding / 2),
      child: Stack(
        children: [
          Container(
            height: 32,
            width: 100,
            decoration: const BoxDecoration(
              color: accentColor,
              borderRadius: BorderRadius.all(Radius.circular(15)),
            ),
          ),
          Positioned(
            left: 5, 
            top: 10,   
            child: Icon(
              Icons.circle,
              size: 10,
             color: getProgressColor,
            ),
          ),
           Positioned(
            left: spacer,  
            top: 7,   
              child: Text(
                '${getProgress}', 
                style: textFont.copyWith(
                  fontSize: 13,
                  fontWeight: FontWeight.w900,
                  color: Colors.white, // Adjust text color
              ),
            ),
          ),
        ],
      ),
    );
  }
}
