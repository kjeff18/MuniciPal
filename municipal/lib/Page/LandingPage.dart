import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' as google_maps_flutter;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:municipal/DesingContstant.dart';
import 'package:municipal/Helper/BubbleSizeCalculator.dart';
import 'package:municipal/Helper/ReportType.dart';
import 'package:municipal/Page/ProfilePage.dart';
import 'package:municipal/models/ModelProvider.dart';
import 'package:geohash_plus/geohash_plus.dart';
import 'package:municipal/Service/GeoHashService.dart';
import 'package:municipal/widgets/LandingPadeWidgets/CustomFloatingButton.dart';
import 'package:municipal/widgets/LandingPadeWidgets/IssueContainer.dart';
import 'package:municipal/widgets/LandingPadeWidgets/QuickReportSection.dart';
import 'package:municipal/widgets/LandingPadeWidgets/ReportMenuButton.dart';
import 'package:municipal/Helper/DistanceCalculator.dart';
import 'package:provider/provider.dart';
import 'package:municipal/Helper/UserLocation.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  google_maps_flutter.BitmapDescriptor customMarker =
      google_maps_flutter.BitmapDescriptor.defaultMarker;

  bool isMapControllerInitialized = false;
  late IssueCategory issueCategoryClick;
  late google_maps_flutter.GoogleMapController mapController;
  Set<google_maps_flutter.Marker> markers = {};
  double offTheScreenPos = -500;
  double position = 1;
  Issue? selectedIssue;  // Initialize as nullable

  google_maps_flutter.CameraPosition? _currentCameraPosition;
  bool _hasCenteredOnUser = false;
  bool _isIssueContainerVisible = false;  // Controls visibility
  bool _isQuickReportVisible = false;
  bool _isUserInteractingWithMap = false;
  String _mapstyle = '';
  final Map<IssueCategory, google_maps_flutter.BitmapDescriptor> _markerIcons =
      {};

  Timer? _recenterTimer;

  @override
  void dispose() {
    final userLocation = Provider.of<UserLocation>(context, listen: false);
    userLocation.dispose();
    _recenterTimer?.cancel();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
     _loadMapStyle();
    startLocationUpdates();
  }

  void startLocationUpdates() {
    final userLocation = Provider.of<UserLocation>(context, listen: false);
    userLocation.startLocationStream((google_maps_flutter.LatLng position) {
      if (!_hasCenteredOnUser && isMapControllerInitialized) {
        // Center the map only once when the location is first loaded
        mapController.animateCamera(
          google_maps_flutter.CameraUpdate.newCameraPosition(
            google_maps_flutter.CameraPosition(target: position, zoom: 15),
          ),
        );
        _hasCenteredOnUser = true; // Mark that the map has been centered
      }

      // Update the camera position only if the user is not interacting
      if (!_isUserInteractingWithMap) {
        setState(() {
          _currentCameraPosition =
              google_maps_flutter.CameraPosition(target: position, zoom: 15);
        });
      }
    });
  }

  void onCameraMove(google_maps_flutter.CameraPosition position) {
    _currentCameraPosition = position;
    setState(() {
      _isUserInteractingWithMap = true;
    });
    _recenterTimer?.cancel();
  }

  void onCameraIdle() async {
    _recenterTimer = Timer(const Duration(seconds: 5), () {
      setState(() {
        _isUserInteractingWithMap = false;
      });
    });

    if (_currentCameraPosition != null) {
      final zoomLevel = _currentCameraPosition!.zoom;
      final geoHashPrefixLength = getGeoHashPrefixLength(zoomLevel);

      final geoHashPrefix = GeoHash.encode(
        _currentCameraPosition!.target.latitude,
        _currentCameraPosition!.target.longitude,
        precision: geoHashPrefixLength,
      ).hash;

      try {
        final issues =
            await GeoHashService().fetchIssuesByGeoHash(geoHashPrefix);
        _customMarker(issues);
      } catch (e) {
        print('Error fetching issues: $e');
      }
    }
  }

  int getGeoHashPrefixLength(double zoomLevel) {
    if (zoomLevel >= 15) return 5;
    if (zoomLevel >= 10) return 3;
    return 1;
  }

  void editAccountButtonFunc() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ProfilePage()),
    );
  }

  google_maps_flutter.GoogleMap GoogleMapDisplay(
      {required UserLocation userLocation}) {
    return google_maps_flutter.GoogleMap(
      zoomControlsEnabled: true,
      initialCameraPosition: _currentCameraPosition ??
          google_maps_flutter.CameraPosition(
            target: userLocation.getCurrentPosition() ??
                const google_maps_flutter.LatLng(30.408773, -91.17815),
            zoom: 15.0,
          ),
      trafficEnabled: false,
      onMapCreated: (google_maps_flutter.GoogleMapController controller) {
        mapController = controller;
        isMapControllerInitialized = true;
      },
      onCameraMove: onCameraMove,
      onCameraIdle: onCameraIdle,
      myLocationEnabled: true,
      myLocationButtonEnabled: false,
      markers: markers,
      style: _mapstyle,
    );
  }

  Future<void> _loadMapStyle() async {
    try {
      _mapstyle =
          await rootBundle.loadString('assets/map_styles/map_style.json');
    } catch (e) {
      _mapstyle = ''; // Fallback to no styling
    }
  }

  // Future<void> _preloadMarkerIcons(int upvote) async {
  //   for (var category in IssueCategory.values) {
  //     final iconPath = ReportType.getBubbleIconPath(category);
  //     if (iconPath != null) {
  //       _markerIcons[category] =
  //           await google_maps_flutter.BitmapDescriptor.asset(
  //         const ImageConfiguration(size: Size(50, 50)),
  //         iconPath,
  //       );
  //     }
  //   }
  // }

void _customMarker(List<Issue> issues) {
  final newMarkers = <google_maps_flutter.Marker>{}; // Temporary list to hold the markers

  for (int i = 0; i < issues.length; i++) {
    final catergory = issues[i].category;
    String markerName = ReportType.getReportName(catergory);  
    google_maps_flutter.LatLng coordinate = google_maps_flutter.LatLng(issues[i].latitude, issues[i].longitude); 
    double iconSize = BubbleSizeCalculator.getIconsize(issues[i].upvotes);
    String? iconPath = ReportType.getBubbleIconPath(catergory); 

    if (iconPath != null) {
      // Asynchronously load the icon and add the marker
      BitmapDescriptor.asset(
        ImageConfiguration(size: Size(iconSize, iconSize)), // Icon size
        iconPath,
      ).then((icon) {
        // Create the marker with the icon
        newMarkers.add(
          Marker(
            markerId: MarkerId('marker_$i'),
            position: coordinate,
            icon: icon,
            onTap: () => _mapMarkerButton(issues[i]), // Assuming _mapMarkerButton is defined
          ),
        );

        // Once all markers are added, update the state
        if (i == issues.length - 1) {
          setState(() {
            markers = newMarkers; // Update the markers list in state
          });
        }
      });
    } else {
      print('Icon path not found for marker: $markerName');
    }
  }
}

  // Future<void> _updateMarkers(List<Issue> issues) async {
  //   final newMarkers = <google_maps_flutter.Marker>{};
  //   for (var issue in issues) {
  //     final category = issue.category;
  //     if (category != null && _markerIcons.containsKey(category)) {
  //       final icon = _markerIcons[category]!;
  //       final marker = google_maps_flutter.Marker(
  //         markerId: google_maps_flutter.MarkerId(issue.id),
  //         position: google_maps_flutter.LatLng(issue.latitude, issue.longitude),
  //         icon: icon,
  //         onTap: () => _mapMarkerButton(issue),
  //       );
  //       newMarkers.add(marker);
  //     }
  //   }
  //   setState(() {
  //     markers = newMarkers;
  //   });
  // }

  void _mapMarkerButton(Issue issue) {
    setState(() {
      selectedIssue = issue;
    });
    // Only show the issue container after the issue is selected
    if (selectedIssue != null) {
      setState(() {
        _isIssueContainerVisible = true;
      });
    }
  }

  void _XButtonIssueContainerClick() {
    setState(() {
      _isIssueContainerVisible = false;  // Hide the issue container
    });
  }

  void _reportMenuClick() {
    setState(() {
      _isQuickReportVisible = !_isQuickReportVisible;
      position = _isQuickReportVisible ? 1 : 0.15;
    });
  }

  @override
  Widget build(BuildContext context) {
    final userLocation = Provider.of<UserLocation>(context);
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          GoogleMapDisplay(userLocation: userLocation),
          Positioned(
            top: screenSize.height * 0.07,
            right: screenSize.width * 0.05,
            child: CustomFloatingButton(onPressed: editAccountButtonFunc),
          ),
          Positioned(
            bottom: screenSize.height * 0.02,
            right: screenSize.width * 0.05,
            child: ReportMenuButton(onPressed: _reportMenuClick),
          ),
          QuickReportSection(
            isVisible: _isQuickReportVisible,
            onReportButtonPressed: (issueType) {
              print(issueType);
            },
          ),
          // IssueContainer Animation
         AnimatedPositioned(
          duration:  Duration(milliseconds: animationDuration ),
          curve: Curves.easeInOut,
          bottom: _isIssueContainerVisible ? screenSize.height * 0.02 : -100,
            child: Visibility(
                  visible: _isIssueContainerVisible && selectedIssue != null,
                  child: Container(
                    width: screenSize.width,
                    height: 330,
                    child: selectedIssue != null && userLocation.currentPosition != null
                        ? IssueContainer(
                            issue: selectedIssue!,
                            destination: DistanceCalculator.calculateDistanceInMiles(
                              userLatitude: userLocation.currentPosition!.latitude,
                              userLongitude: userLocation.currentPosition!.longitude,
                              issueLatitude: selectedIssue!.latitude,
                              issueLongitude: selectedIssue!.longitude,
                            ),
                            onPressed: _XButtonIssueContainerClick,
                          )
                        : SizedBox.shrink(), // Returns an empty widget if either is null
                  ),
                )
          )

        ],
      ),
    );
  }
}
