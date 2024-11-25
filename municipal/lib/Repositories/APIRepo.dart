import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_api/amplify_api.dart';

class APIWrapper {
  /// Generic method to create a data entry for any model.
  Future<bool> createData<T extends Model>(T model) async {
    try {
      final request = ModelMutations.create(model);
      final response = await Amplify.API.mutate(request: request).response;

      if (response.data == null) {
        safePrint('Errors during creation: ${response.errors}');
        return false;
      }
      safePrint('Creation successful: ${response.data.toString()}');
      return true;
    } on ApiException catch (e) {
      safePrint('Create mutation failed: $e');
      return false;
    }
  }

  /// Generic method to read data entries for any model, with optional filters.
  Future<List<T>> readData<T extends Model>(ModelType<T> modelType,
      {QueryPredicate? filters}) async {
    try {
      final request = ModelQueries.list(modelType, where: filters);
      final response = await Amplify.API.query(request: request).response;

      if (response.data == null) {
        safePrint('Errors during query: ${response.errors}');
        return [];
      }

      // Safely cast and filter out null items
      final items = response.data!.items?.whereType<T>().toList() ?? [];
      if (items.isEmpty) {
        safePrint('No items found or errors: ${response.errors}');
      }
      return items;
    } on ApiException catch (e) {
      safePrint('Query failed: $e');
      return [];
    }
  }

  /// Generic method to update an existing entry by providing an updated model instance.
  Future<bool> updateData<T extends Model>(T model) async {
    try {
      final request = ModelMutations.update(model);
      final response = await Amplify.API.mutate(request: request).response;

      if (response.data == null) {
        safePrint('Errors during update: ${response.errors}');
        return false;
      }
      safePrint('Update successful: ${response.data.toString()}');
      return true;
    } on ApiException catch (e) {
      safePrint('Update mutation failed: $e');
      return false;
    }
  }

  /// Generic method to delete an entry by providing the model instance to delete.
  Future<bool> deleteData<T extends Model>(T model) async {
    try {
      final request = ModelMutations.delete(model);
      final response = await Amplify.API.mutate(request: request).response;

      if (response.data == null) {
        safePrint('Errors during deletion: ${response.errors}');
        return false;
      }
      safePrint('Deletion successful: ${response.data.toString()}');
      return true;
    } on ApiException catch (e) {
      safePrint('Delete mutation failed: $e');
      return false;
    }
  }

  /// Generic method to delete a model by its ID.
  Future<void> deleteById<T extends Model>(
      ModelType<T> modelType, ModelIdentifier<T> modelIdentifier) async {
    try {
      final request = ModelMutations.deleteById(modelType, modelIdentifier);
      final response = await Amplify.API.mutate(request: request).response;

      if (response.hasErrors) {
        safePrint('Delete errors: ${response.errors}');
      } else {
        safePrint('Deletion successful: ${response.data}');
      }
    } on ApiException catch (e) {
      safePrint('Delete mutation failed: $e');
    }
  }
}
