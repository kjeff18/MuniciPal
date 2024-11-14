import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:municipal/DesingContstant.dart';
import 'package:municipal/HelperFunction/UserLocation.dart';
import 'package:municipal/widgets/CustomFloatingButton.dart';
import 'package:municipal/widgets/QuickReportIcon.dart';
import 'package:municipal/widgets/ReportMenuButton.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  BitmapDescriptor customMarker = BitmapDescriptor.defaultMarker;

  late GoogleMapController mapController;




   List<Map<String, dynamic>> markerData = [
    {"name": "pothole", "coordinate": LatLng(30.4076640376, -91.179755360)},
    {"name": "traffic_light", "coordinate": LatLng(30.42456, -91.189755360)},
    {"name": "street_light", "coordinate": LatLng(30.4475540376, -91.199755360)},
    // Add more markers with different names and coordinates
  ];

  
  final Map<String, String> markerIconPaths = {
    "pothole": pothole,
    "traffic_light":drainage,
    "street_light": graffiti,
    // Add more mappings for other types
  };

  Set<Marker> markers = {};
  double position = 1;
  UserLocation userLocation = UserLocation();

  CameraPosition? _currentCameraPosition;
  bool _isVisible1 = false;


  @override
  void dispose() {
    userLocation.dispose(); 
    super.dispose();
  }

  @override
  void initState() {
    _CustomMarker();
    super.initState();

    // Start listening for the user's location
    userLocation.startLocationStream((LatLng position) {
      // This callback will be triggered each time the location is updated
      setState(() {
        _currentCameraPosition = CameraPosition(target: position, zoom: 15);
      });
      
      // Once the first location is available, update the camera position
      if (mapController != null) {
        mapController.animateCamera(CameraUpdate.newLatLng(position));
      }
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

void _CustomMarker() {
  for (int i = 0; i < markerData.length; i++) {
    String markerName = markerData[i]["name"];
    LatLng coordinate = markerData[i]["coordinate"];
    String? iconPath = markerIconPaths[markerName];  // Get the icon path

    // Check if the iconPath exists
    if (iconPath != null) {
      // Load the icon asynchronously using the asset path
      BitmapDescriptor.asset(
        ImageConfiguration(size: Size(82, 82)),
        iconPath,  // Use the dynamic icon path
      ).then((icon) {
        setState(() {
          customMarker = icon;
          markers.add(
            Marker(
              markerId: MarkerId('marker_$i'), 
              position: coordinate,
              icon: customMarker, 
            ),
          );
        });
      });
    } else {
      print('Icon path not found for marker: $markerName');
    }
  }
}

  void _ReportMenuClick() {
    setState(() {
      if (_isVisible1) {
        position = 0.15;
        _isVisible1 = false;
    
      } else {
        position = 1;
        _isVisible1 = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            zoomControlsEnabled: true,
            initialCameraPosition: _currentCameraPosition ??
                const CameraPosition(
                  target: LatLng(37.7749, -122.4194), 
                  zoom: 15.0,
                ),
            trafficEnabled: true,
            onMapCreated: (GoogleMapController controller) {
              mapController = controller;
            },
            myLocationEnabled: true,
            myLocationButtonEnabled: false,

            markers: markers
          ),
          Positioned(
            top: screenSize.height * 0.07,
            right: screenSize.width * 0.02,
            child: CustomFloatingButton(onPressed: editAccountButtonFunc),
          ),
          Positioned(
            bottom: screenSize.height * 0.05,
            right: screenSize.width * 0.02,
            child: ReportMenuButton(onPressed: _ReportMenuClick),
          ),
          AnimatedPositioned(
            bottom: screenSize.height * 0.15,
            right: _isVisible1 ? screenSize.width * 0.02 : -500,
            curve: Curves.easeInOut,
            duration: const Duration(milliseconds: 300),
            child: AnimatedOpacity(
              opacity: _isVisible1 ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 150),
              curve: Curves.easeInOutCubicEmphasized,
              child: const Column(
                children: [
                  QuickReportIcon(iconPath: potholeIcon),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: defaultPadding),
                    child: QuickReportIcon(iconPath: trafficLightIcon),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: defaultPadding),
                    child: QuickReportIcon(iconPath: streetLightIcon),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
  
}


