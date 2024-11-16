import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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

  //Declared Variable 
  BitmapDescriptor customMarker = BitmapDescriptor.defaultMarker;

  late GoogleMapController mapController;
  String _mapstyle = ''; 

  CameraPosition? _currentCameraPosition;
  bool _isVisible1 = false;

  Set<Marker> markers = {};
  double position = 1;
  UserLocation userLocation = UserLocation();


//Map Function Stuff

  Future<void> _loadMapStyle() async {
    _mapstyle = await rootBundle.loadString('municipal/assets/map_styles/map_style.json');
  }

// Dummy Data
   List<Map<String, dynamic>> markerData = [
    {"name": "pothole", "coordinate": LatLng(30.4076640376, -91.179755360)},
    {"name": "traffic_light", "coordinate": LatLng(30.4072694,-91.1823936)},
    {"name": "street_light", "coordinate": LatLng(30.4072093,-91.1839224)},
    // Add more markers with different names and coordinates
  ];

//Dummy Data
  final Map<String, String> markerIconPaths = {
    "pothole": potholeBubble,
    "traffic_light":trafficLightBubble,
    "street_light": streetLightBubble,
    // Add more mappings for other types
  };

  void _CustomMarker() {
  for (int i = 0; i < markerData.length; i++) {
    String markerName = markerData[i]["name"];
    LatLng coordinate = markerData[i]["coordinate"];
    String? iconPath = markerIconPaths[markerName];  // Get the icon path

    if (iconPath != null) {
      BitmapDescriptor.asset(
        ImageConfiguration(size: Size(50, 50)),
        iconPath,  // Use the dynamic icon path
      ).then((icon) {
          customMarker = icon;
          markers.add(
            Marker(
              markerId: MarkerId('marker_$i'), 
              position: coordinate,
              icon: customMarker, 
              onTap: () => _mapMarkerButton('marker_$i'),
            ),
          );
      });
    } else {
      print('Icon path not found for marker: $markerName');
    }
  }
}

//Clickable Button Function
  void _mapMarkerButton (String name)
  {
    print(name);
  }

  void editAccountButtonFunc() {
    LatLng? currentPosition = userLocation.getCurrentPosition();
    if (currentPosition != null) {
      print('Current position: ${currentPosition.latitude}, ${currentPosition.longitude}');
    } else {
      print('Current position is null');
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

  void _quickReportButton()
  {
    print("QuickReport");
  }

//State Management
  @override
  void dispose() {
    userLocation.dispose(); 
    super.dispose();
  }

  @override
  void initState() {
    _loadMapStyle();
    _CustomMarker();
    super.initState();

    userLocation.startLocationStream((LatLng position) {
      setState(() {
        _currentCameraPosition = CameraPosition(target: position, zoom: 15);
      });
      
      // Once the first location is available, update the camera position
      if (mapController != null) {
        mapController.animateCamera(CameraUpdate.newLatLng(position));
      }
    }); 
  }




//Widget Build

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
                  target: LatLng(30.4076640376, -91.179755360), 
                  zoom: 15.0,
                ),
            trafficEnabled: true,
            onMapCreated: (GoogleMapController controller) {
              mapController = controller;
        
            },
            myLocationEnabled: true,
            myLocationButtonEnabled: false,
            style:_mapstyle ,
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
              child: Column(
                children: [
                   QuickReportIcon(iconPath: potholeIcon, onPressed: () => _quickReportButton()),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: defaultPadding),
                    child: QuickReportIcon(iconPath: trafficLightIcon,onPressed: () => _quickReportButton(),),
                  ),
                   Padding(
                    padding: EdgeInsets.only(bottom: defaultPadding),
                    child: QuickReportIcon(iconPath: streetLightIcon ,onPressed: () => _quickReportButton()),
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


