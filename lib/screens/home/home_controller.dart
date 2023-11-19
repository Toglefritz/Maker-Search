import 'package:flutter/material.dart';
import 'package:maker_search/screens/search_results/search_results_route.dart';

import '../../services/programmable_search_engine/models/search.dart';
import '../../services/programmable_search_engine/search_service.dart';
import 'home_route.dart';
import 'home_view.dart';

/// Controller for the [HomeRoute].
class HomeController extends State<HomeRoute> {
  /// Determines if there is a search in progress.
  bool _searching = false;

  bool get searching => _searching;

  /// Handles submissions into the search field. The search itself is conducted by this controller however the
  /// results of the search are presented in the [SearchResultsRoute].
  Future<void> onSearchSubmit(String input) async {
    setState(() {
      _searching = true;
    });

    try {
      // Perform the search and obtain a [Search] instance containing the results and metadata.
      Search search = await SearchService.performSearch(input);
      debugPrint('Received search results in ${search.searchInformation.searchTime}');

      if (mounted) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => SearchResultsRoute(
              search: search,
            ),
          ),
        );
      }

      setState(() {
        _searching = false;
      });
    } catch (e) {
      debugPrint('Unable to perform search with exception, $e');

      setState(() {
        _searching = false;
      });

      // Show a SnackBar about the error.
      const SnackBar snackBar = SnackBar(
        content: Text('There was a problem searching for parts.'),
        showCloseIcon: true,
        behavior: SnackBarBehavior.floating,
      );

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    }
  }

  @override
  Widget build(BuildContext context) => HomeView(state: this);
}
