import { queryNearbyIssues } from './issueService.js';
import { findNearbyIssue } from '../utils/geospatialUtils.js';
import { createIssueViaAppSync, createReportViaAppSync } from './appsyncService.js';

export const associateOrCreateIssueForReport = async ({ reportId, latitude, longitude, category, description, imageUrl }) => {
  try {
    // Query nearby issues by geohash and category
    const existingIssues = await queryNearbyIssues(latitude, longitude, category);

    // Find an issue within 10 meters
    const nearbyIssue = findNearbyIssue(existingIssues, latitude, longitude);

    if (nearbyIssue) {
      // Link the report to the existing issue by creating a report with issueId
      const newReport = await createReportViaAppSync({
        id: reportId,
        latitude,
        longitude,
        category,
        description,
        imageUrl,
        issueId: nearbyIssue.id,
      });
      return { message: `Report linked to existing issue ${nearbyIssue.id}`, report: newReport };
    } else {
      // Create a new issue and link the report to it
      const newIssue = await createIssueViaAppSync({
        latitude,
        longitude,
        category,
        description,
        imageUrl,
      });
      const newReport = await createReportViaAppSync({
        id: reportId,
        latitude,
        longitude,
        category,
        description,
        imageUrl,
        issueId: newIssue.id,
      });
      return { message: `New issue created with ID ${newIssue.id}`, report: newReport };
    }
  } catch (error) {
    console.error('Error associating or creating issue for report:', error);
    throw new Error('Failed to associate or create issue for report');
  }
};
