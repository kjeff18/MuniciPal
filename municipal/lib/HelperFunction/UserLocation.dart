import 'dart:async';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class UserLocation {
  StreamSubscription<Position>? _positionStreamSubscription;
  LatLng? currentPosition;

  void startLocationStream(Function(LatLng) onLocationUpdate) {
    LocationSettings locationSettings = const LocationSettings(
      accuracy: LocationAccuracy.high,
      distanceFilter: 10,
    );

    _positionStreamSubscription = Geolocator.getPositionStream(locationSettings: locationSettings).listen(
      (Position? position) {
        if (position != null) {
          currentPosition = LatLng(position.latitude, position.longitude);
          // Only call the callback to update the location, do not print here
          onLocationUpdate(currentPosition!);
        }
      },
      onError: (e) {
        print(e); // Handle errors if needed
      },
    );
  }

  LatLng? getCurrentPosition() {
    return currentPosition;
  }

  Future<Position?> getCurrentLocation() async {
    LocationPermission permission = await getUserLocationPermission();
    if (permission == LocationPermission.always || permission == LocationPermission.whileInUse) {
      return await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    } else {
      return null; // Permission denied
    }
  }

  Future<LocationPermission> getUserLocationPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
    return permission;
  }

  void dispose() {
    _positionStreamSubscription?.cancel();
  }
}
