import 'package:flutter/material.dart';
import 'package:maker_search/screens/search_results/search_results_controller.dart';

/// View for the [SearchResultsRoute].
class SearchResultsView extends StatelessWidget {
  final SearchResultsController state;

  const SearchResultsView({
    super.key,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text('Maker Search Results'),
      ),
      body: CustomScrollView(
        slivers: [
          SliverGrid.count(
            crossAxisCount: 2,
            children: List.generate(
              state.widget.search.results.length,
              (index) => Card(
                child: Column(
                  children: [
                    Text(
                      state.widget.search.results[index].title,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
