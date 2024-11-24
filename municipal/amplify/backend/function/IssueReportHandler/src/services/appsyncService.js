const fetch = require('node-fetch');

// AppSync Endpoint and API Key
const APPSYNC_URL = process.env.APPSYNC_URL; // Set in Lambda environment variables
const APPSYNC_API_KEY = process.env.APPSYNC_API_KEY; // Set in Lambda environment variables

// Create a new issue via AppSync
exports.createIssueViaAppSync = async ({ latitude, longitude, category, description, imageUrl }) => {
  const query = `
    mutation CreateIssue($input: CreateIssueInput!) {
      createIssue(input: $input) {
        id
        latitude
        longitude
        category
        description
        imageUrl
        status
      }
    }
  `;

  const variables = {
    input: {
      latitude,
      longitude,
      category,
      description,
      imageUrl,
      status: 'OPEN',
    },
  };

  const response = await sendAppSyncRequest(query, variables);
  return response.createIssue;
};

// Create a new report via AppSync
exports.createReportViaAppSync = async ({ id, latitude, longitude, category, description, imageUrl, issueId }) => {
  const query = `
    mutation CreateReport($input: CreateReportInput!) {
      createReport(input: $input) {
        id
        latitude
        longitude
        category
        description
        imageUrl
        issueId
      }
    }
  `;

  const variables = {
    input: {
      id,
      latitude,
      longitude,
      category,
      description,
      imageUrl,
      issueId,
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
