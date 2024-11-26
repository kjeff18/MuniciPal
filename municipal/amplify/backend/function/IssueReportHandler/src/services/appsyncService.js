import fetch from 'node-fetch';
import { v4 as uuidv4 } from 'uuid';

// AppSync Endpoint and API Key
const APPSYNC_URL = process.env.API_MUNICIPAL_GRAPHQLAPIENDPOINTOUTPUT; 
const APPSYNC_API_KEY = process.env.API_MUNICIPAL_GRAPHQLAPIKEYOUTPUT;

export const fetchNearbyIssuesFromAppSync = async (geoHashPrefix) => {
  const query = `
    query IssuesByGeoHash($geoHashPrefix: String!) {
      listIssues(filter: { geoHash: { beginsWith: $geoHashPrefix }}) {
        items {
          id
          citizenId
          description
          imageUrls
          category
          latitude
          longitude
          geoHash
          status
          progress
          upvotes
          _version
        }
      }
    }
  `;

  const variables = {
    geoHashPrefix,
  };

  const response = await sendAppSyncRequest(query, variables);
  return response.listIssues.items;
};

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
        imageUrls
        category
        latitude
        longitude
        geoHash
        status
        upvotes
      }
    }
  `;

  console.log("Image URL: ", imageUrl)
  const variables = {
    input: {
      id: uuidv4(),
      citizenId,
      description,
      imageUrls: [imageUrl],
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
export const incrementIssueUpvotesAndUrlsViaAppSync = async (input) => {
  const { id, _version, imageUrls, upvotes } = input || {};
  console.log("Incrementing upvotes")
  
  const updateMutation = `
    mutation UpdateIssue($input: UpdateIssueInput!) {
      updateIssue(input: $input) {
        id
        _version
        upvotes
      }
    }
  `;

  const variables = {
    input: {
      id: id,
      _version: _version,
      imageUrls: imageUrls || [],
      upvotes: upvotes + 1,
    },
  };
  
  console.log("Variables sent to AppSync:", variables);

  try {
    const response = await sendAppSyncRequest(updateMutation, variables);
    if (!response.updateIssue) {
      throw new Error("No data returned from updateIssue mutation");
    }
    console.log("Issue Mutation response:", response);
    return response.updateIssue;
  } catch (error) {
    console.error("Error in incrementIssueUpvotesAndUrlsViaAppSync:", error);
    throw new Error("Failed to execute mutation");
  }
};


// Create a new report via AppSync
export const createReportViaAppSync = async ({
  citizenId,
  citizenName,
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
        citizenName
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
      citizenName,
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
    console.log("Variables sent to AppSync:", variables);
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
