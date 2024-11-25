import ngeohash from 'ngeohash';
import { getDistance } from 'geolib';

// Calculate geohash for a given latitude and longitude
export const calculateGeohash = (latitude, longitude, precision = 7) => {
  return ngeohash.encode(latitude, longitude, precision);
};

// Find the nearest issue within a specific radius
export const findNearbyIssue = (issues, latitude, longitude, radius = 10) => {
  for (const issue of issues) {
    const distance = getDistance(
      { latitude, longitude },
      {
        latitude: parseFloat(issue.latitude),
        longitude: parseFloat(issue.longitude),
      }
    );
    if (distance <= radius) {
      return issue;
    }
  }
  return null;
};
