import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:municipal/DesingContstant.dart';
import 'package:municipal/HelperFunction/UserLocation.dart';
import 'package:municipal/widgets/CustomFloatingButton.dart';
import 'package:municipal/widgets/ReportMenuButton.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  late GoogleMapController mapController;
  UserLocation userLocation = UserLocation();
  CameraPosition? _currentCameraPosition;

  bool _isVisible1 = false;
  bool _isVisible2 = false; // Separate visibility flag for the second image
  double position = 1;

  void _ReportMenuClick() {
    setState(() {
      if (_isVisible1) {
        position = 0.15;
        _isVisible1 = false;
        _isVisible2 = false; // Hide the second image when the first one is hidden
      } else {
        position = 1;
        _isVisible1 = true;
        _isVisible2 = true; // Show the second image when the first one is visible
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

  @override
  void initState() {
    super.initState();
    userLocation.startLocationStream((LatLng position) {
      setState(() {
        _currentCameraPosition = CameraPosition(target: position, zoom: 15);
      });
      mapController.animateCamera(CameraUpdate.newLatLng(position));
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
            initialCameraPosition: _currentCameraPosition ?? const CameraPosition(
              target: LatLng(37.7749, -122.4194), // Fallback to San Francisco initially
              zoom: 15.0,
            ),
            onMapCreated: (GoogleMapController controller) {
              mapController = controller;
            },
            myLocationEnabled: true,
            myLocationButtonEnabled: false,
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
          // First AnimatedPositioned widget
          AnimatedPositioned(
            bottom: _isVisible1 ? -150 :screenSize.height * 0.15 ,
            right: screenSize.width * 0.02,
            curve: Curves.easeInCubic,
            duration: const Duration(milliseconds: 200),
            child: AnimatedOpacity(
              opacity: !_isVisible1 ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 150),
              curve: Curves.easeInOutCubicEmphasized,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: defaultPadding),
                    child: Image.asset(logo, height: 82, width: 82),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: defaultPadding),
                    child: Image.asset(logo, height: 82, width: 82),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    userLocation.dispose(); // Clean up the UserLocation instance
    super.dispose();
  }
}
