const geohash = require('ngeohash');
const { getDistance } = require('geolib');

// Calculate geohash for a given latitude and longitude
exports.calculateGeohash = (latitude, longitude, precision = 7) => {
  return geohash.encode(latitude, longitude, precision);
};

// Find the nearest issue within a specific radius
exports.findNearbyIssue = (issues, latitude, longitude, radius = 10) => {
  for (const issue of issues) {
    const distance = getDistance(
      { latitude, longitude },
      { latitude: parseFloat(issue.latitude), longitude: parseFloat(issue.longitude) }
    );
    if (distance <= radius) {
      return issue;
    }
  }
  return null;
};