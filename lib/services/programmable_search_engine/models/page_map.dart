import 'package:maker_search/services/programmable_search_engine/models/product.dart';

/// `PageMaps` is a structured data format that provides Google with information about the data on a page. It enables
/// website creators to embed data and notes in webpages. Although this information is not visible to website
/// visitors, Custom Search Engines recognize the data and use it to provide more relevant results. Because PageMaps
/// do not require adherence to a specific schema, all of the fields in this class are nullable to account
/// for JSON payloads that may not contain the keys needed for each field.
///
/// See https://developers.google.com/custom-search/docs/structured_data#pagemaps for information about the responses
/// received from CSE searches.
class PageMap {
  /// Information about the product.
  final Product? product;

  // TODO parse other information like reviews

  PageMap({
    required this.product,
  });

  /// Returns a [PageMap] object parsed from the JSON returned by the Google Custom Search API.
  factory PageMap.fromJson(Map<String, dynamic> json) {
    // Get product information from the JSON
    Product product = Product.fromJson(json['product'][0]);

    return PageMap(
      product: product,
    );
  }
}