import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart'
    as google_maps_flutter;
import 'package:municipal/DesingContstant.dart';
import 'package:municipal/Helper/IssueCategory.dart';
import 'package:municipal/Helper/UserLocation.dart';
import 'package:municipal/models/ModelProvider.dart';
import 'package:geohash_plus/geohash_plus.dart';
import 'package:municipal/Service/GeoHashService.dart';
import 'package:municipal/widgets/LandingPadeWidgets/CustomFloatingButton.dart';
import 'package:municipal/widgets/LandingPadeWidgets/IssueContainer.dart';
import 'package:municipal/widgets/LandingPadeWidgets/QuickReportSection.dart';
import 'package:municipal/widgets/LandingPadeWidgets/QuickReportIcon.dart';
import 'package:municipal/widgets/LandingPadeWidgets/ReportMenuButton.dart';
import 'package:municipal/Helper/DistanceCalculator.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  double offTheScreenPos = -500;
  late IssueCategory issueCategoryClick;
  late Issue selectedIssue;
  google_maps_flutter.BitmapDescriptor customMarker =
      google_maps_flutter.BitmapDescriptor.defaultMarker;
  late google_maps_flutter.GoogleMapController mapController;
  String _mapstyle = '';
  final Map<IssueCategory, google_maps_flutter.BitmapDescriptor> _markerIcons =
      {};

  google_maps_flutter.CameraPosition? _currentCameraPosition;
  bool _isQuickReportVisible = false;
  bool _isIssueContainerVisible = false; // Track visibility of IssueContainer
  bool _isUserInteractingWithMap = false; // Prevent recentering when true
  Timer? _recenterTimer;

  Set<google_maps_flutter.Marker> markers = {};
  double position = 1;
  UserLocation userLocation = UserLocation();

  @override
  void dispose() {
    userLocation.dispose();
    _recenterTimer?.cancel();
    super.dispose();
  }

  @override
  void initState() {
    _loadMapStyle();
    _preloadMarkerIcons();
    super.initState();

    userLocation.startLocationStream((google_maps_flutter.LatLng position) {
      if (!_isUserInteractingWithMap) {
        setState(() {
          _currentCameraPosition =
              google_maps_flutter.CameraPosition(target: position, zoom: 15);
        });

        if (mapController != null) {
          mapController.animateCamera(
              google_maps_flutter.CameraUpdate.newLatLng(position));
        }
      }
    });
  }

  Future<void> _loadMapStyle() async {
    _mapstyle = await rootBundle
        .loadString('municipal/assets/map_styles/map_style.json');
  }

  /// Preload marker icons for all categories
  Future<void> _preloadMarkerIcons() async {
    for (var category in IssueCategory.values) {
      final iconPath = ReportType.getBubbleIconPath(category);
      if (iconPath != null) {
        _markerIcons[category] =
            await google_maps_flutter.BitmapDescriptor.asset(
          const ImageConfiguration(size: Size(50, 50)),
          iconPath,
        );
      }
    }
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
        _updateMarkers(issues);
      } catch (e) {
        print('Error fetching issues: $e');
      }
    }
  }

  int getGeoHashPrefixLength(double zoomLevel) {
    if (zoomLevel >= 15) return 5; // High zoom: more granular geohash
    if (zoomLevel >= 10) return 3; // Medium zoom: moderate geohash
    return 1; // Low zoom: broader geohash
  }

  void _updateMarkers(List<Issue> issues) {
    final newMarkers = <google_maps_flutter.Marker>{};
    for (var issue in issues) {
      final category = issue.category;
      if (category != null && _markerIcons.containsKey(category)) {
        final icon = _markerIcons[category]!;
        final marker = google_maps_flutter.Marker(
          markerId: google_maps_flutter.MarkerId(issue.id),
          position: google_maps_flutter.LatLng(issue.latitude, issue.longitude),
          icon: icon,
          onTap: () => _mapMarkerButton(issue),
        );
        newMarkers.add(marker);
      }
    }
    setState(() {
      markers = newMarkers;
    });
  }

  void _mapMarkerButton(Issue issue) {
    setState(() {
      issueCategoryClick = issue.category!;
      selectedIssue = issue;
      _isIssueContainerVisible = true;
    });
  }

  void editAccountButtonFunc() {
    google_maps_flutter.LatLng? currentPosition =
        userLocation.getCurrentPosition();
    if (currentPosition != null) {
      print(
          'Current position: ${currentPosition.latitude}, ${currentPosition.longitude}');
    } else {
      print('Current position is null');
    }
  }

  void _XButtonIssueContainerClick() {
    setState(() {
      _isIssueContainerVisible = false;
    });
  }

  void _reportMenuClick() {
    setState(() {
      _isQuickReportVisible = !_isQuickReportVisible;
      position = _isQuickReportVisible ? 1 : 0.15;
    });
  }

  void _quickReportButton(String quickReportIssueType) {
    print(quickReportIssueType);
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          GoogleMapDisplay(),
          Positioned(
            top: screenSize.height * 0.07,
            right: screenSize.width * 0.02,
            child: CustomFloatingButton(onPressed: editAccountButtonFunc),
          ),
          Positioned(
            bottom: screenSize.height * 0.05,
            right: screenSize.width * 0.02,
            child: ReportMenuButton(onPressed: _reportMenuClick),
          ),
          QuickReportSection(
            isVisible: _isQuickReportVisible,
            onReportButtonPressed: _quickReportButton,
          ),
          if (_isIssueContainerVisible)
            Positioned(
              bottom: screenSize.height * 0.005,
              child: Container(
                width: screenSize.width,
                height: 330,
                child: IssueContainer(
                  issue: selectedIssue,
                  destination: userLocation.currentPosition != null
                      ? DistanceCalculator.calculateDistanceInMiles(
                          userLatitude: userLocation.currentPosition!.latitude,
                          userLongitude:
                              userLocation.currentPosition!.longitude,
                          issueLatitude: selectedIssue.latitude,
                          issueLongitude: selectedIssue.longitude,
                        )
                      : 0.0,
                  onPressed: _XButtonIssueContainerClick,
                ),
              ),
            ),
        ],
      ),
    );
  }

  google_maps_flutter.GoogleMap GoogleMapDisplay() {
    return google_maps_flutter.GoogleMap(
      zoomControlsEnabled: true,
      initialCameraPosition: _currentCameraPosition ??
          google_maps_flutter.CameraPosition(
            target: userLocation.getCurrentPosition() ??
                const google_maps_flutter.LatLng(0.0, 0.0),
            zoom: 15.0,
          ),
      trafficEnabled: false,
      onMapCreated: (google_maps_flutter.GoogleMapController controller) {
        mapController = controller;
      },
      onCameraMove: onCameraMove,
      onCameraIdle: onCameraIdle,
      myLocationEnabled: true,
      myLocationButtonEnabled: false,
      markers: markers,
      style: _mapstyle,
    );
  }
}
