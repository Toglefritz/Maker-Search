import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:maker_search/services/programmable_search_engine/pse_config.dart';

import 'models/search.dart';

/// `SearchService` handles the network requests to the Google Programmable Search Engine.
///
/// This class provides a service-oriented architecture for making HTTP requests
/// and processing the responses. It encapsulates the logic for communicating
/// with the Google Programmable Search Engine API, offering a simplified interface
/// for performing searches and handling the results.
///
/// The main functionality is provided by the static method `performSearch`,
/// which sends a GET request to the Google Programmable Search Engine with
/// the specified query and returns the search results.
class SearchService {
  /// Performs a search using the Google Programmable Search Engine.
  ///
  /// This static method constructs the URL for the search request using the provided
  /// [query], the search engine ID, and the API key. It then sends a GET request
  /// to the Google Programmable Search Engine API and retrieves the search results.
  ///
  /// [query] is the search term input by the user, which will be sent to the API.
  ///
  /// Returns a `Future<Search>` which is the model class representing the search results.
  /// In case of a successful request, it returns a `Search` object containing the parsed
  /// search results. If the request fails, it throws an exception with details of the failure.
  static Future<Search> performSearch(String query) async {
    // The base URL used to GET requests to the Programmable Search Engine REST API.
    const String baseUrl = 'https://www.googleapis.com/customsearch/v1';

    // Assemble the URL used for the REST API request.
    final String url = '$baseUrl?q=$query&cx=$cx&key=$searchEngineKey';

    // Use a GET request to obtain the results of the search.
    http.Response response;
    try {
      response = await http.get(Uri.parse(url));
    } catch (e) {
      throw Exception('Search failed with exception, $e');
    }

    // A 200 status means the search was successful
    if (response.statusCode == 200) {
      return Search.fromJson(json.decode(response.body));
    }
    // Throw an exception for unsuccessful requests
    else {
      throw Exception(
        'Failed to load search results with status, ${response.statusCode}, and message, ${response.body}',
      );
    }
  }
}
