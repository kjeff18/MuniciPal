import fetch from 'node-fetch';
import { v4 as uuidv4 } from 'uuid';

// AppSync Endpoint and API Key
const APPSYNC_URL = process.env.API_MUNICIPAL_GRAPHQLAPIENDPOINTOUTPUT; // Set in Lambda environment variables
const APPSYNC_API_KEY = process.env.API_MUNICIPAL_GRAPHQLAPIKEYOUTPUT; // Set in Lambda environment variables

// Create a new issue via AppSync
export const createIssueViaAppSync = async ({
  citizenId,
  description,
  imageUrl,
  category,
  latitude,
  longitude,
  geoHash,
}) => {
  const query = `
    mutation CreateIssue($input: CreateIssueInput!) {
      createIssue(input: $input) {
        id
        citizenId
        description
        imageUrl
        category
        latitude
        longitude
        geoHash
        status
        upvotes
      }
    }
  `;

  const variables = {
    input: {
      id: uuidv4(),
      citizenId,
      description,
      imageUrl,
      category,
      latitude,
      longitude,
      geoHash,
      status: 'OPEN',
      upvotes: 0,
    },
  };
  console.log("Create Issue via AppSync vars: ", variables)

  const response = await sendAppSyncRequest(query, variables);
  return response.createIssue;
};

// Create a new report via AppSync
export const createReportViaAppSync = async ({
  citizenId,
  issueId,
  latitude,
  longitude,
  geoHash,
  description,
  imageUrl,
  category
}) => {
  const query = `
    mutation CreateReport($input: CreateReportInput!) {
      createReport(input: $input) {
        id
        citizenId
        issueId
        latitude
        longitude
        geoHash
        description
        imageUrl
        category
      }
    }
  `;

  const variables = {
    input: {
      id: uuidv4(),
      citizenId,
      issueId,
      latitude,
      longitude,
      geoHash,
      description,
      imageUrl,
      category
    },
  };

  const response = await sendAppSyncRequest(query, variables);
  return response.createReport;
};

// Generic function to send requests to AppSync
const sendAppSyncRequest = async (query, variables) => {
  try {
    const response = await fetch(APPSYNC_URL, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        'x-api-key': APPSYNC_API_KEY,
      },
      body: JSON.stringify({ query, variables }),
    });

    const json = await response.json();

    if (json.errors) {
      console.error('AppSync error:', JSON.stringify(json.errors, null, 2));
      throw new Error(`AppSync error: ${JSON.stringify(json.errors)}`);
    }

    return json.data;
  } catch (error) {
    console.error('Error sending AppSync request:', error);
    throw error;
  }
};
