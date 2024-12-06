import 'package:amplify_flutter/amplify_flutter.dart';
import 'dart:convert';
import 'package:municipal/models/Issue.dart';

class GeoHashService {
  Future<List<Issue>> fetchIssuesByGeoHash(String geoHashPrefix) async {
    print("Fetching issues by geohash: $geoHashPrefix");
    final String graphQLDocument = '''
      query IssuesByGeoHash {
        listIssues(filter: {geoHash: {beginsWith: "$geoHashPrefix"}}) {
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
          }
        }
      }
    ''';

    try {
      final response = await Amplify.API
          .query(
            request: GraphQLRequest<String>(
              document: graphQLDocument,
              variables: {'geoHashPrefix': geoHashPrefix},
            ),
          )
          .response;

      if (response.errors.isNotEmpty) {
        throw Exception('GraphQL Error: ${response.errors.first.message}');
      }

      final data = response.data;

      if (data == null) {
        return [];
      }

      final decodedData = jsonDecode(data);
      final issuesData = decodedData['listIssues']?['items'] as List?;

      if (issuesData == null) {
        return [];
      }

      return issuesData.map((item) => Issue.fromJson(item)).toList();
    } catch (e) {
      print('Error fetching issues by geohash: $e');
      rethrow;
    }
  }
}
