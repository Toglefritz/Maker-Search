/// `PageMaps` is a structured data format that provides Google with information about the data on a page. It enables
/// website creators to embed data and notes in webpages. Although this information is not visible to website
/// visitors, Custom Search Engines recognize the data and use it to provide more relevant results.
///
/// See https://developers.google.com/custom-search/docs/structured_data#pagemaps for information about the responses
/// received from CSE searches.
class PageMap {
  /// The URL for an image to display for the search result.
  final Uri? cseImage;

  PageMap({
    required this.cseImage,
  });

  /// Returns a [PageMap] object parsed from the JSON returned by the Google Custom Search API.
  factory PageMap.fromJson(Map<String, dynamic> json) {
    String? cseImageString;
    Uri? cseImage;

    List<dynamic>? cseImageList = json['cse_image'];

    if (cseImageList != null && cseImageList.isNotEmpty) {
      cseImageString = cseImageList[0]['src'] as String?;

      if (cseImageString != null) {
        cseImage = Uri.parse(cseImageString);
      }
    }

    return PageMap(
      cseImage: cseImage,
    );
  }
}