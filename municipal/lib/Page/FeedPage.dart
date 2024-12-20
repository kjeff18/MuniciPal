import 'package:flutter/material.dart';
import 'package:municipal/DesingContstant.dart';
import 'package:municipal/models/IssueStatus.dart';
import 'package:municipal/models/ModelProvider.dart';
import 'package:municipal/widgets/CustomAppBar.dart';
import 'package:municipal/widgets/FeedPageWidgets/FeedContainer.dart';
import 'package:municipal/Helper/UserLocation.dart';
import 'package:municipal/Helper/DistanceCalculator.dart';
import 'package:municipal/Service/GeoHashService.dart';
import 'package:geohash_plus/geohash_plus.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart'
    as google_maps_flutter;

class FeedPage extends StatefulWidget {
  const FeedPage({super.key});

  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  final UserLocation userLocation = UserLocation();
  bool isLoading = true; // Indicates if location is being fetched
  bool hasError =
      false; // Tracks if an error occurred during location retrieval
  List<Issue> issues = []; // List of retrieved issues
  google_maps_flutter.LatLng? currentPosition;

  @override
  void initState() {
    super.initState();
    fetchLocationAndIssues();
  }

  Future<void> fetchLocationAndIssues() async {
    setState(() {
      isLoading = true;
      hasError = false;
    });

    try {
      // Fetch user's current location
      final position = await userLocation.getCurrentLocation();
      if (position == null) {
        throw Exception("Unable to fetch user's location.");
      }

      setState(() {
        currentPosition =
            google_maps_flutter.LatLng(position.latitude, position.longitude);
      });

      // Generate geohash prefix and fetch issues
      final geoHashPrefix = GeoHash.encode(
        position.latitude,
        position.longitude,
        precision: 3,
      ).hash;

      final fetchedIssues =
          await GeoHashService().fetchIssuesByGeoHash(geoHashPrefix);

      // Sort issues by proximity
      fetchedIssues.sort((a, b) {
        final distanceA = DistanceCalculator.calculateDistanceInMiles(
          userLatitude: position.latitude,
          userLongitude: position.longitude,
          issueLatitude: a.latitude,
          issueLongitude: a.longitude,
        );
        final distanceB = DistanceCalculator.calculateDistanceInMiles(
          userLatitude: position.latitude,
          userLongitude: position.longitude,
          issueLatitude: b.latitude,
          issueLongitude: b.longitude,
        );
        return distanceA.compareTo(distanceB);
      });

      setState(() {
        issues = fetchedIssues;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        hasError = true;
        isLoading = false;
      });
      debugPrint("Error fetching issues or location: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Feed"),
      backgroundColor: backgroundColor,
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : hasError
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Failed to fetch location or issues."),
                      const SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: fetchLocationAndIssues,
                        child: const Text("Retry"),
                      ),
                    ],
                  ),
                )
              : issues.isEmpty
                  ? const Center(child: Text("No issues found nearby."))
                  : RefreshIndicator(
                      onRefresh: () async {
                        await fetchLocationAndIssues(); // Refresh data on pull
                      },
                      child: ListView.builder(
                        itemCount: issues.length,
                        itemBuilder: (context, index) {
                          final issue = issues[index];
                          final distance = currentPosition == null
                              ? null // Handle the case when currentPosition is null
                              : DistanceCalculator.calculateDistanceInMiles(
                                  userLatitude: currentPosition!.latitude,
                                  userLongitude: currentPosition!.longitude,
                                  issueLatitude: issue
                                      .latitude, // Provide a default value for issue.latitude
                                  issueLongitude: issue
                                      .longitude, // Provide a default value for issue.longitude
                                );

                          return FeedContainer(
                            key: PageStorageKey(issue.id),
                            issue: issue,
                            userLocation: userLocation,
                            onIssueUpdated: (updatedIssue) {
                              setState(() {
                                issues[index] = updatedIssue;
                              });
                            },
                          );
                        },
                      ),
                    ),
    );
  }
}
