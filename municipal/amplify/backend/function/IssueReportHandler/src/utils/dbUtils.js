import AWS from 'aws-sdk';
const dynamodb = new AWS.DynamoDB();

// Query DynamoDB with the provided parameters
export const queryDynamoDB = async (params) => {
  try {
    const result = await dynamodb.query(params).promise();
    return result.Items || [];
  } catch (error) {
    console.error('Error querying DynamoDB:', error);
    throw error;
  }
};
