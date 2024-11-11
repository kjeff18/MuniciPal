import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:municipal/widgets/CustomFloatingButton.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  late GoogleMapController mapController;

 
  
  void editAccountButtonFunc()
  {

  }

  // Set initial camera position
  static const CameraPosition _kInitialPosition = CameraPosition(
    target:
        LatLng(37.7749, -122.4194), // San Francisco's latitude and longitude
    zoom: 12.0,
  );

  @override
  Widget build(BuildContext context) {
     final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
       
          GoogleMap(
            initialCameraPosition: _kInitialPosition,
            onMapCreated: (GoogleMapController controller) {
              mapController = controller;
            },
            myLocationButtonEnabled: false,
          ),

            
          Positioned(
           top: screenSize.height * 0.05 ,
            right: screenSize.height * 0.02,
            child: CustomFloatingButton(onPressed: editAccountButtonFunc))
          
        ],
      ),
    );
  }
}
