/* Amplify Params - DO NOT EDIT
	API_MUNICIPAL_GRAPHQLAPIENDPOINTOUTPUT
	API_MUNICIPAL_GRAPHQLAPIIDOUTPUT
	API_MUNICIPAL_GRAPHQLAPIKEYOUTPUT
	API_MUNICIPAL_ISSUETABLE_ARN
	API_MUNICIPAL_ISSUETABLE_NAME
	API_MUNICIPAL_REPORTTABLE_ARN
	API_MUNICIPAL_REPORTTABLE_NAME
	ENV
	REGION
	STORAGE_MUNICIPALIMAGES_BUCKETNAME
Amplify Params - DO NOT EDIT */

/**
 * @type {import('@types/aws-lambda').APIGatewayProxyHandler}
 */
import { queryNearbyIssues } from './services/issueService.js';
import { findNearbyIssue } from './utils/geospatialUtils.js';
import {
  createIssueViaAppSync,
  createReportViaAppSync,
} from './services/appsyncService.js';


export const handler = async (event) => {
  try {
    console.log("Event: ", event)
    // Extract data from the event
    const { citizenId, category, latitude, longitude, geoHash, description, imageUrl } = event.arguments.input;

    // Step 1: Query for nearby issues
    const existingIssues = await queryNearbyIssues(latitude, longitude, category);

    // Step 2: Determine if an existing issue is within 10 meters
    const nearbyIssue = findNearbyIssue(existingIssues, latitude, longitude);

    let issueId;
    if (nearbyIssue) {
      // Step 3: Use the existing issue ID
      issueId = nearbyIssue.id;
    } else {
      // Step 4: Create a new issue via AppSync
      const newIssue = await createIssueViaAppSync({
        citizenId,
        description,
        imageUrl,
        category,
        latitude,
        longitude,
        geoHash,
      });
      issueId = newIssue.id;
    }

    // Step 5: Create a report and associate it with the issue via AppSync
    const newReport = await createReportViaAppSync({
      citizenId,
      issueId,
      latitude,
      longitude,
      geoHash,
      description,
      imageUrl,
      category
    });

    // Return the result
    return {
      statusCode: 200,
      body: JSON.stringify({
        message: nearbyIssue
          ? `Report linked to existing issue ${issueId}`
          : `New issue created with ID ${issueId}`,
        report: newReport,
      }),
    };
  } catch (error) {
    console.error('Error in Lambda function:', error);
    return {
      statusCode: 500,
      body: JSON.stringify({
        message: 'Internal server error',
        error: error.message,
      }),
    };
  }
};
