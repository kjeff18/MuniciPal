import { fetchNearbyIssuesFromAppSync } from '../services/appsyncService.js';
import { calculateGeohash } from '../utils/geospatialUtils.js';
import { getDistance } from 'geolib';

const ISSUE_TABLE_NAME = process.env.API_MUNICIPAL_ISSUETABLE_NAME;
const GSI_NAME = 'byGeoHashCategory';

// Query nearby issues
export const queryNearbyIssues = async (latitude, longitude, category) => {
  try {
    const geohash = calculateGeohash(latitude, longitude, 7);
    const geoHashPrefix = geohash.slice(0, 5);

    // Fetch issues from AppSync
    const issues = await fetchNearbyIssuesFromAppSync(geoHashPrefix);

    // Optionally, filter issues by category (if AppSync filtering by category is not sufficient)
    const filteredIssues = issues.filter((issue) => issue.category === category);

    return filteredIssues;
  } catch (error) {
    console.error('Error querying nearby issues:', error);
    throw new Error('Failed to query nearby issues');
  }
};

// Find an issue within 10 meters
export const findNearbyIssue = (issues, latitude, longitude) => {
  for (const issue of issues) {
    const distance = getDistance(
      { latitude, longitude },
      { latitude: parseFloat(issue.latitude), longitude: parseFloat(issue.longitude) }
    );
    if (distance <= 10) {
      return issue;
    }
  }
  return null;
};
