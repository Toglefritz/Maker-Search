/// Represents monetary currencies.
enum Currency {
  usd(id: 'USD', symbol: '\$');

  /// ISO 4217 currency format identifier for the currency value.
  final String id;

  /// The symbol used to indicate the currency in pricing information.
  final String symbol;

  const Currency({required this.id, required this.symbol});
}
