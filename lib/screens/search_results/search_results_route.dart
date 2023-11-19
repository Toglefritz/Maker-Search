import 'package:flutter/material.dart';
import 'package:maker_search/screens/search_results/search_results_controller.dart';

import '../../services/programmable_search_engine/models/search.dart';

/// Displays the results of a search conducted on the [HomeRoute].
class SearchResultsRoute extends StatefulWidget {
  const SearchResultsRoute({
    super.key,
    required this.search,
  });

  /// A [Search] instance containing the results of a search conducted on the [HomeRoute] along with
  /// metadata about the search.
  final Search search;

  @override
  State<SearchResultsRoute> createState() => SearchResultsController();
}
