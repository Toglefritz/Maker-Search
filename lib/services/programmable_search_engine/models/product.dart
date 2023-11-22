import 'currency.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

/// Represents information about a product including the following:
///   - An image for the product
///   - Pricing information
///   - A description of the product
///   - Branding information
///
/// Because this information does not necessarily follow a specific schema, all fields are nullable to account for
/// the possibility that some target keys will be absent from the JSON returned by the Google Programmable Search API.
///
/// See https://developers.google.com/custom-search/v1/reference/rest/v1/Search for information about the responses
/// received from CSE searches.
class Product {
  /// A URL for an image of the product.
  final String? image;

  /// The currency in which the [price] is offered.
  final Currency? currency;

  /// The price offered for the product in the [currency], represented as a String.
  final String? price;

  /// A name for the product.
  final String? name;

  /// A description of the product.
  final String? description;

  Product({
    this.image,
    this.currency,
    this.price,
    this.name,
    this.description,
  });

  /// Returns a [Product] object parsed from the JSON returned by the Google Custom Search API.
  factory Product.fromJsonLd(Map<String, dynamic> json) {
    try {
      return Product(
        image: json['image'],
        currency: Currency.values.firstWhereOrNull((currency) => currency.id == json['pricecurrency']),
        price: json['price'],
        name: json['name'],
        description: json['description'],
      );
    } catch (e) {
      debugPrint('Failed to parse product information with exception, $e');
      rethrow;
    }
  }
}
