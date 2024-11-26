import 'package:flutter/material.dart';
import 'package:municipal/DesingContstant.dart';
import 'package:municipal/models/IssueStatus.dart';
import 'package:municipal/models/ModelProvider.dart';
import 'package:municipal/widgets/CustomAppBar.dart';
import 'package:municipal/widgets/FeedPageWidgets/FeedContainer.dart';
import 'package:municipal/Repositories/APIRepo.dart';
import 'package:provider/provider.dart';
import 'package:municipal/model/UserState.dart';
import 'package:municipal/Helper/UserLocation.dart';

class MyReportsPage extends StatefulWidget {
  const MyReportsPage({super.key});

  @override
  State<MyReportsPage> createState() => _MyReportsPageState();
}

class _MyReportsPageState extends State<MyReportsPage> {
  bool isLoading = true; // Indicates if data is being fetched
  bool hasError = false; // Tracks if an error occurred during data retrieval
  List<Issue> myReports = []; // List of retrieved reports
  final UserLocation userLocation = UserLocation();

  @override
  void initState() {
    super.initState();
    fetchUserReports();
  }

  Future<void> fetchUserReports() async {
    setState(() {
      isLoading = true;
      hasError = false;
    });

    try {
      // Get the current authenticated user's ID
      final authUser = Provider.of<UserState>(context, listen: false).authUser;
      if (authUser == null) {
        throw Exception("User not logged in.");
      }
      debugPrint("Authenticated user ID: ${authUser.userId}");

      // Fetch reports where citizenId matches the user's ID
      final reports = await APIWrapper().readData<Issue>(
        Issue.classType,
        filters: Issue.CITIZENID.eq(authUser.userId),
      );
      debugPrint("Reports retrieved: ${reports.length}");

      setState(() {
        myReports = reports;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        hasError = true;
        isLoading = false;
      });
      debugPrint("Error fetching reports: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "My Reports",
        showBellIcon: true,
        onPressed: () => print("Bell icon pressed"),
      ),
      backgroundColor: backgroundColor,
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : hasError
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Failed to fetch your reports."),
                      const SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: fetchUserReports,
                        child: const Text("Retry"),
                      ),
                    ],
                  ),
                )
              : myReports.isEmpty
                  ? const Center(child: Text("You have no reports."))
                  : ListView.builder(
                      itemCount: myReports.length,
                      itemBuilder: (context, index) {
                        final report = myReports[index];
                        return FeedContainer(
                          issue: report,
                          userLocation: userLocation,
                          onPressed: () => print("Clicked on ${report.id}"),
                        );
                      },
                    ),
    );
  }
}
