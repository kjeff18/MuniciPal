import 'package:flutter/material.dart';
import 'package:municipal/DesingContstant.dart';
import 'package:municipal/models/IssueStatus.dart';

class ProgressIndicatorChecker {

   Color getProgressColor(IssueStatus issueStatus)
  {
    if(issueStatus == IssueStatus.CLOSED)
    {
      return closedProgressColor;
    }
    else if (issueStatus == IssueStatus.IN_PROGRESS)
    {
      return inProgressColor;
    }
    else{
      return openProgressColor;
    }
  }

   String getProgress(IssueStatus issueStatus)
  {
    if(issueStatus == IssueStatus.CLOSED)
    {
      return "CLOSED";
    }
    else if (issueStatus == IssueStatus.IN_PROGRESS)
    {
      return 'IN PROGRESS';
    }
    else{
      return 'OPEN';
    }
  }
  
  
}