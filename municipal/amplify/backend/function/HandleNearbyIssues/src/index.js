/* Amplify Params - DO NOT EDIT
	API_MUNICIPAL_GRAPHQLAPIENDPOINTOUTPUT
	API_MUNICIPAL_GRAPHQLAPIIDOUTPUT
	API_MUNICIPAL_GRAPHQLAPIKEYOUTPUT
	API_MUNICIPAL_ISSUETABLE_ARN
	API_MUNICIPAL_ISSUETABLE_NAME
	ENV
	REGION
Amplify Params - DO NOT EDIT */

/**
 * @type {import('@types/aws-lambda').APIGatewayProxyHandler}
 */
import AWS from "aws-sdk";

const dynamoDb = new AWS.DynamoDB.DocumentClient();
const appsync = new AWS.AppSync();

const ISSUE_TABLE_NAME = process.env.ISSUE_TABLE_NAME;
const APPSYNC_ENDPOINT = process.env.APPSYNC_ENDPOINT;

export const handler = async (event) => {
  console.log("Event received:", event);

  const { geoHashPrefix, bounds } = event.arguments.input;

  try {
    // Query DynamoDB for issues within the geohash bounds
    const results = [];
    for (const geoHash of bounds) {
      const params = {
        TableName: ISSUE_TABLE_NAME,
        IndexName: "byGeoHashCategory",
        KeyConditionExpression: "geoHash = :geoHash",
        ExpressionAttributeValues: {
          ":geoHash": geoHash,
        },
      };

      const data = await dynamoDb.query(params).promise();
      results.push(...data.Items);
    }

    // Publish updates to AppSync subscribers
    const payload = {
      geoHashPrefix,
      issues: results,
    };

    await appsync
      .publish({
        apiId: process.env.APPSYNC_API_ID,
        payload,
        fieldName: "onNearbyIssueUpdate",
      })
      .promise();

    return true;
  } catch (error) {
    console.error("Error handling nearby issues:", error);
    throw new Error("Failed to handle nearby issues");
  }
};
