import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:municipal/HelperFunction/UserLocation.dart';
import 'package:municipal/widgets/CustomFloatingButton.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  late GoogleMapController mapController;
  UserLocation userLocation = UserLocation();
  CameraPosition? _currentCameraPosition; // Change to a variable

  void editAccountButtonFunc() {
  LatLng? currentPosition = userLocation.getCurrentPosition();
     print('Currentsssss position: ${currentPosition!.latitude}, ${currentPosition!.longitude}');
  }

  @override
  void initState() {
    super.initState();
    userLocation.startLocationStream((LatLng position) {
      setState(() {
        _currentCameraPosition = CameraPosition(target: position, zoom: 15); // Update camera position
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
