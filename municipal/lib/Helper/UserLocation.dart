import 'dart:async';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/foundation.dart';

class UserLocation extends ChangeNotifier {
  StreamSubscription<Position>? _positionStreamSubscription;
  LatLng? currentPosition;

  UserLocation() {
    startLocationStream((LatLng position) {
      currentPosition = position;
    });
  }

  void startLocationStream(Function(LatLng) onLocationUpdate) {
    LocationSettings locationSettings = const LocationSettings(
      accuracy: LocationAccuracy.high,
      distanceFilter: 10,
    );

    _positionStreamSubscription =
        Geolocator.getPositionStream(locationSettings: locationSettings).listen(
      (Position? position) {
        if (position != null) {
          currentPosition = LatLng(position.latitude, position.longitude);
          onLocationUpdate(currentPosition!);
        }
      },
      onError: (e) {
        print(e); // Handle errors
      },
    );
  }

  LatLng? getCurrentPosition() {
    return currentPosition;
  }

  Future<Position?> getCurrentLocation() async {
    LocationPermission permission = await getUserLocationPermission();
    if (permission == LocationPermission.always ||
        permission == LocationPermission.whileInUse) {
      return await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
    }
    return null; // Permission denied
  }

  Future<LocationPermission> getUserLocationPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
    return permission;
  }

  @override
  void dispose() {
    _positionStreamSubscription?.cancel();
    super.dispose();
  }
}
