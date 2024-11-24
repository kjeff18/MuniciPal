import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:municipal/DesingContstant.dart';
import 'package:municipal/Helper/IssueCatergory.dart';
import 'package:municipal/Helper/UserLocation.dart';
import 'package:municipal/models/ModelProvider.dart';
import 'package:municipal/widgets/LandingPadeWidgets/CustomFloatingButton.dart';
import 'package:municipal/widgets/LandingPadeWidgets/IssueContainer.dart';
import 'package:municipal/widgets/LandingPadeWidgets/QuickReportSection.dart';
import 'package:municipal/widgets/LandingPadeWidgets/QuickReportIcon.dart';
import 'package:municipal/widgets/LandingPadeWidgets/ReportMenuButton.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  double offTheScreenPos = -500;
  late IssueCategory issueCategoryClick;
  BitmapDescriptor customMarker = BitmapDescriptor.defaultMarker;
  late GoogleMapController mapController;
  String _mapstyle = ''; 
  
  CameraPosition? _currentCameraPosition;
  bool _isQuickReportVisible = false;
  bool _isIssueContainerVisible = false; // Track visibility of IssueContainer
  Set<Marker> markers = {};
  double position = 1;
  UserLocation userLocation = UserLocation();

  // Dummy Data
  List<Map<String, dynamic>> markerData = [
    {"name": IssueCategory.Pothole, "coordinate": LatLng(30.4076640376, -91.179755360)},
    {"name": IssueCategory.StreetLight, "coordinate": LatLng(30.4072694,-91.1823936)},
    {"name": IssueCategory.StreetSign, "coordinate": LatLng(30.4072093,-91.1839224)},
  ];

  // Map functions
  Future<void> _loadMapStyle() async {
    _mapstyle = await rootBundle.loadString('municipal/assets/map_styles/map_style.json');
  }

  void _customMarker() {
    for (int i = 0; i < markerData.length; i++) {
      IssueCategory markerName = markerData[i]["name"];
      LatLng coordinate = markerData[i]["coordinate"];
      String? iconPath = ReportType.getBubbleIconPath(markerName);
      if (iconPath != null) {
        BitmapDescriptor.asset(
          ImageConfiguration(size: Size(50, 50)),
          iconPath,
        ).then((icon) {
          customMarker = icon;
          markers.add(
            Marker(
              markerId: MarkerId('marker_$i'),
              position: coordinate,
              icon: customMarker,
              onTap: () => _mapMarkerButton(markerName),
            ),
          );
        });
      } else {
        print('Icon path not found for marker: $markerName');
      }
    }
  }

  void _mapMarkerButton(IssueCategory issueCategoryclicked) {
    setState(() {
      issueCategoryClick = issueCategoryclicked;
      _isIssueContainerVisible = true;
    });
  }

  void editAccountButtonFunc() {
    LatLng? currentPosition = userLocation.getCurrentPosition();
    if (currentPosition != null) {
      print('Current position: ${currentPosition.latitude}, ${currentPosition.longitude}');
    } else {
      print('Current position is null');
    }
  }

  void _XButtonIssueContainerClick()
  {
    setState(() {
    _isIssueContainerVisible = false;  
    });
    
  }

  void _reportMenuClick() {
    setState(() {
      if (_isQuickReportVisible) {
        position = 0.15;
        _isQuickReportVisible = false;
      } else {
        position = 1;
        _isQuickReportVisible = true;
      }
    });
  }

  void _quickReportButton(String quickReportIssueType) {
    print(quickReportIssueType);
  }

  @override
  void dispose() {
    userLocation.dispose(); 
    super.dispose();
  }

  @override
  void initState() {
    _customMarker();
    _loadMapStyle();
    super.initState();

    userLocation.startLocationStream((LatLng position) {
      setState(() {
        _currentCameraPosition = CameraPosition(target: position, zoom: 15);
      });
      
      if (mapController != null) {
        mapController.animateCamera(CameraUpdate.newLatLng(position));
      }
    }); 
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
                  child: IssueContainer(issueCategory: issueCategoryClick, destination: 3, onPressed: _XButtonIssueContainerClick,), 
                ),
              ),
        ],
      ),
    );
  }



  GoogleMap GoogleMapDisplay() {
    return GoogleMap(
          zoomControlsEnabled: true,
          initialCameraPosition: _currentCameraPosition ??
              const CameraPosition(
                target: LatLng(30.4076640376, -91.179755360), 
                zoom: 15.0,
              ),
          trafficEnabled: true,
          onMapCreated: (GoogleMapController controller) {
            mapController = controller;
          },
          myLocationEnabled: true,
          myLocationButtonEnabled: false,
          style: _mapstyle,
          markers: markers,
        );
  }
}
 