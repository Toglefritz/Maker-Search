import 'package:html/dom.dart';

import 'brand.dart';
import 'offer.dart';

/// Represents data from a JSON-LD object using the "@type": "Product" per the schema definition from Schema.org:
/// https://schema.org/Product or Microdata tags within HTML markup. For websites containing JSON-LD data, in most
/// cases, the [fromJson] factory constructor will be used to return instances of this class from JSON-LD data
/// typically obtained from a website. For websites using Microdata instead, the [fromMicrodata] factory constructor
/// will be used to return instances of this class.
///
/// Since not all websites will contain all of the keys defined in the "Product" schema, many of the fields in
/// this class are nullable to account for parsing JSON-LD data that lacks some of the expected key/value pairs.
class Product {
  /// The name of the item.
  final String name;

  /// A description of the item.
  final String? description;

  /// The brand(s) associated with a product or service, or the brand(s) maintained by an organization or business
  /// person.
  final Brand? brand;

  /// An offer to provide this item—for example, an offer to sell a product, rent the DVD of a movie, perform a service,
  /// or give away tickets to an event. The "offers" field of JSON-LD data can contain
  final Offer? offer;

  //  TODO Add other fields that are relevant for your application

  Product({required this.name, this.description, this.brand, this.offer});

  /// Returns a [Product] instance from the provided JSON-LD data.
  factory Product.fromJsonLd(Map<String, dynamic> jsonLd) {
    return Product(
      name: jsonLd['name'] as String,
      description: jsonLd['description'] as String?,
      brand: Brand.fromJsonLd(jsonLd['brand']),
      offer: Offer.fromJsonLd(jsonLd['offer']),
      // Handle other fields similarly
    );
  }

  /// Returns a [Product] instance from the provided Microdata in an HTML document.
  factory Product.fromMicrodata(Element productElement) {
    // Extract the name from the Microdata element
    String name = productElement.querySelector('[itemprop="name"]')?.text ?? '';

    // Extract the description from the Microdata element
    String? description = productElement.querySelector('[itemprop="description"]')?.text;

    // For brand, use a similar factory constructor in that class to return a Brand instance.
    Brand brand = Brand.fromMicrodata(productElement);

    // For offer, use a similar factory constructor in that class to return an Offer instance.
    Offer offer = Offer.fromMicrodata(productElement);

    return Product(
      name: name,
      description: description,
      brand: brand,
      offer: offer,
      // Handle other fields similarly
    );
  }

  /// A utility method for getting the formatted price for a [Product]. This getter returns null if no price
  /// is available in the [offer] field. Otherwise, a string representation of the price is returned that includes
  /// the currency symbol (assuming currency information is available). For example, "$14.99".
  String? get price => offer?.price == null ? null : '${offer?.currency?.symbol ?? ''}${offer?.price}';
}
