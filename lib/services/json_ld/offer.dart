import 'package:collection/collection.dart';

import '../programmable_search_engine/models/currency.dart';

/// Represents data from a JSON-LD object communicating information about "an offer to provide this item" per the
/// schema definition from Schema.org: https://schema.org/Product.
class Offer {
  /// The currency in which the [price] is offered.
  final Currency? currency;

  /// The price offered for the product in the [currency]. In JSON-LD data, the price can be defined as a
  /// String or an int. In the case that the price is defined as a String, an int value will be parsed from the
  /// string.
  final int? price;

  Offer({this.currency, this.price});

  /// Returns a [Brand] instance from the provided JSON-LD data.
  factory Offer.fromJsonLd(Map<String, dynamic> jsonLd) {
    return Offer(
      currency: Currency.values.firstWhereOrNull((currency) => currency.id == jsonLd['priceCurrency'] as String),
      price: jsonLd['price'] is String ? int.parse(jsonLd['logo']) : jsonLd['price'],
      // Handle other fields similarly
    );
  }
}
