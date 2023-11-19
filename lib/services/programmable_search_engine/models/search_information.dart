/// Represents metadata about about a CSE search.
///
/// See https://developers.google.com/custom-search/v1/reference/rest/v1/Search for information about the responses
/// received from CSE searches.
class SearchInformation {
  /// The time taken for the server to return search results.
  final Duration searchTime;

  /// The total number of search results returned by the query.
  final int totalResults;

  SearchInformation({
    required this.searchTime,
    required this.totalResults,
  });

  /// Returns a [SearchInformation] object parsed from the JSON returned by the Google Custom Search API.
  factory SearchInformation.fromJson(Map<String, dynamic> json) {
    return SearchInformation(
      searchTime: Duration(milliseconds: (json['searchTime'] * 1000).toInt()),
      totalResults: int.parse(json['totalResults']),
    );
  }
}