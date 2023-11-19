import 'package:maker_search/services/programmable_search_engine/models/search_information.dart';
import 'package:maker_search/services/programmable_search_engine/models/search_result.dart';

/// Represents a search result obtained from a query to a Google Custom Search API. The recipe contains a list of
/// results returned by the search in addition to metadata about the search itself.
///
/// See https://developers.google.com/custom-search/v1/reference/rest/v1/Search for information about the responses
/// received from CSE searches.
class Search {
  /// Metadata about about this search, including search time and total results.
  final SearchInformation searchInformation;

  /// A list of search results for the current page of the search.
  final List<SearchResult> results;

  Search({
    required this.searchInformation,
    required this.results,
  });

  /// Returns a [Search] object parsed from the JSON returned by the Google Custom Search API.
  factory Search.fromJson(Map<String, dynamic> json) {
    return Search(
      searchInformation: SearchInformation.fromJson(json['searchInformation']),
      results: (json['items'] as List<dynamic>).map((e) => SearchResult.fromJson(e)).toList(),
    );
  }
}