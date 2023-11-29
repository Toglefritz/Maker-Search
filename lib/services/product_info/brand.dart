import 'package:html/dom.dart';

/// Represents data from a JSON-LD object communicating information about a brand or organization per the schema
/// definition from Schema.org: https://schema.org/Product.
class Brand {
  /// The name of the item.
  final String name;

  /// The URL for the brand's logo, in String format.
  final String? logo;

  Brand({required this.name, this.logo});

  /// Returns a [Brand] instance from the provided JSON-LD data.
  factory Brand.fromJsonLd(Map<String, dynamic> jsonLd) {
    return Brand(
      name: jsonLd['name'] as String,
      logo: jsonLd['logo'] is String ? jsonLd['logo'] as String? : null,
      // Handle other fields similarly
    );
  }

  /// Returns a [Brand] instance from the provided HTML element containing Microdata.
  factory Brand.fromMicrodata(Element productElement) {
    return Brand(
      name: productElement.querySelector('[itemprop="brand"]') as String,
      logo: null,
      // Handle other fields similarly
    );
  }
}