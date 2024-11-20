const {
  CognitoIdentityProviderClient,
  AdminAddUserToGroupCommand,
  GetGroupCommand,
  CreateGroupCommand,
} = require('@aws-sdk/client-cognito-identity-provider');

const cognitoIdentityServiceProvider = new CognitoIdentityProviderClient({});

/**
 * @type {import('@types/aws-lambda').PostConfirmationTriggerHandler}
 */
exports.handler = async (event) => {
  const userPoolId = event.userPoolId;
  const username = event.userName;
  const clientMetadata = event.request.clientMetadata || {};

  let groupName;

  // Determine the group based on the platform and role
  if (clientMetadata.platform === 'mobile') {
    groupName = 'Citizen';
  } else if (clientMetadata.platform === 'web') {
    const userRole = clientMetadata.userRole;
    if (userRole === 'Contractor' || userRole === 'Government') {
      groupName = userRole;
    } else {
      console.log(`Invalid or unspecified userRole for web signup`);
      return event; // Exit early if the role is invalid
    }
  } else {
    console.log('Platform not specified');
    return event; // Exit early if platform is not specified
  }

  // Define parameters for the group
  const groupParams = {
    GroupName: groupName,
    UserPoolId: userPoolId,
  };
  const addUserParams = {
    GroupName: groupName,
    UserPoolId: userPoolId,
    Username: username,
  };
  /**
   * Check if the group exists; if it doesn't, create it.
   */
  try {
    await cognitoIdentityServiceProvider.send(new GetGroupCommand(groupParams));
  } catch (e) {
    await cognitoIdentityServiceProvider.send(new CreateGroupCommand(groupParams));
  }
  /**
   * Then, add the user to the group.
   */
  await cognitoIdentityServiceProvider.send(new AdminAddUserToGroupCommand(addUserParams));

  return event;
};
