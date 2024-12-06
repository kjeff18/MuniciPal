import 'dart:math';

class DistanceCalculator {
  static double calculateDistanceInMiles({
    required double userLatitude,
    required double userLongitude,
    required double issueLatitude,
    required double issueLongitude,
  }) {
    const double earthRadiusInMiles = 3958.8; // Earth's radius in miles

    // Convert latitude and longitude from degrees to radians
    final double userLatRadians = userLatitude * pi / 180;
    final double userLonRadians = userLongitude * pi / 180;
    final double issueLatRadians = issueLatitude * pi / 180;
    final double issueLonRadians = issueLongitude * pi / 180;

    // Haversine formula
    final double dLat = issueLatRadians - userLatRadians;
    final double dLon = issueLonRadians - userLonRadians;

    final double a = sin(dLat / 2) * sin(dLat / 2) +
        cos(userLatRadians) *
            cos(issueLatRadians) *
            sin(dLon / 2) *
            sin(dLon / 2);
    final double c = 2 * atan2(sqrt(a), sqrt(1 - a));

    // Distance in miles, rounded to the tenths place
    double distance = earthRadiusInMiles * c;
    return double.parse(distance.toStringAsFixed(1));
  }
}
