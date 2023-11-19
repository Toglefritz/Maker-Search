import 'package:flutter/material.dart';

import 'search_results_route.dart';
import 'search_results_view.dart';

/// Controller for the [SearchResultsRoute].
class SearchResultsController extends State<SearchResultsRoute> {
  @override
  Widget build(BuildContext context) => SearchResultsView(state: this);
}