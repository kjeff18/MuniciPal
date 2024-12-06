import 'dart:async';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/foundation.dart';

class UserLocation extends ChangeNotifier {
  StreamSubscription<Position>? _positionStreamSubscription;
  LatLng? currentPosition;

  // Mock location for testing
  static const LatLng mockLocation =
      LatLng(30.407470560318153, -91.18010735074873);

  UserLocation() {
    startLocationStream((LatLng position) {
      currentPosition = position;
      notifyListeners();
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
        print("Error fetching location: $e");
        if (currentPosition == null) {
          // Use fallback location if location data is not available
          currentPosition = mockLocation;
          onLocationUpdate(currentPosition!);
          notifyListeners();
        }
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
