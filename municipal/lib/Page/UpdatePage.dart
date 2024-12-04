import 'package:flutter/material.dart';
import 'package:municipal/models/IssueCategory.dart';
import 'package:municipal/models/ModelProvider.dart';
import 'package:municipal/widgets/CustomAppBar.dart';
import 'package:municipal/widgets/UpdatePageWidgets/UpdateWidget.dart';

class UpdatePage extends StatelessWidget {
  const UpdatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Updates", showBackButton: true,),
      body: ListView(
        children: [
          UpdateWidget(
            issueCategory: IssueCategory.ParkMaintenance, 
            issueStatus: IssueStatus.IN_PROGRESS
          ),

        ],
      ),
    );
  }
}

