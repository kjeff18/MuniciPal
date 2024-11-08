import { generateClient } from 'aws-amplify/api';

class APIWrapper {
  constructor() {
    this.client = generateClient(); // Initialize the Amplify API client
  }

  /**
   * Generic method to create data for any model.
   * @param {Object} modelData - The data for the model to create.
   * @param {Object} mutation - The GraphQL mutation for creating the model.
   * @returns {Promise<Object|null>} - Returns the created model data or null if failed.
   */
  async createData(modelData, mutation) {
    try {
      const result = await this.client.graphql({
        query: mutation,
        variables: { input: modelData },
      });
      return result.data;
    } catch (error) {
      console.error('Create Error:', error);
      return null;
    }
  }

  /**
   * Generic method to read data entries for any model with optional filters.
   * @param {Object} query - The GraphQL query for listing the model.
   * @param {Object} filters - Optional filters for querying data.
   * @returns {Promise<Array>} - Returns an array of queried data or an empty array if failed.
   */
  async readData(query, filters = null) {
    try {
      const result = await this.client.graphql({
        query: query,
        variables: { filter: filters },
      });
      return result.data ? result.data.items : [];
    } catch (error) {
      console.error('Read Error:', error);
      return [];
    }
  }

  /**
   * Generic method to update an existing entry.
   * @param {Object} modelData - The updated model data with ID.
   * @param {Object} mutation - The GraphQL mutation for updating the model.
   * @returns {Promise<Object|null>} - Returns the updated model data or null if failed.
   */
  async updateData(modelData, mutation) {
    try {
      const result = await this.client.graphql({
        query: mutation,
        variables: { input: modelData },
      });
      return result.data;
    } catch (error) {
      console.error('Update Error:', error);
      return null;
    }
  }

  /**
   * Generic method to delete an entry by ID.
   * @param {String} id - The ID of the model instance to delete.
   * @param {Object} mutation - The GraphQL mutation for deleting the model.
   * @returns {Promise<Boolean>} - Returns true if deletion succeeded, otherwise false.
   */
  async deleteData(id, mutation) {
    try {
      const result = await this.client.graphql({
        query: mutation,
        variables: { input: { id } },
      });
      return true;
    } catch (error) {
      console.error('Delete Error:', error);
      return false;
    }
  }
}

export default new APIWrapper();
