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
const { queryNearbyIssues } = require('./services/issueService');
const { findNearbyIssue } = require('./utils/geospatialUtils');
const { createIssueViaAppSync, createReportViaAppSync } = require('./services/appsyncService');

exports.handler = async (event) => {
  try {
    // Extract data from the event
    const { id: reportId, latitude, longitude, category, description, imageUrl } = event;

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
        latitude,
        longitude,
        category,
        description,
        imageUrl,
      });
      issueId = newIssue.id;
    }

    // Step 5: Create a report and associate it with the issue via AppSync
    const newReport = await createReportViaAppSync({
      id: reportId,
      latitude,
      longitude,
      category,
      description,
      imageUrl,
      issueId,
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
