import 'package:flutter/material.dart';
import 'package:maker_search/screens/search_results/search_results_controller.dart';

import '../../services/programmable_search_engine/models/product.dart';

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
      appBar: AppBar(
        title: const Text('Maker Search Results'),
      ),
      body: CustomScrollView(
        physics: const ClampingScrollPhysics(),
        slivers: [
          SliverGrid(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: MediaQuery.of(context).size.width / 2,
              mainAxisSpacing: 16.0,
              crossAxisSpacing: 16.0,
              childAspectRatio: 1.0,
            ),
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                // Get a reference to the [Product] object for convenience.
                Product? product = state.widget.search.results[index].pageMap.product;

                if (product != null) {
                  return LayoutBuilder(
                    builder: (BuildContext context, BoxConstraints constraints) {
                      return Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          side: BorderSide(
                            color: Theme.of(context).primaryColorDark,
                          ),
                        ),
                        child: Column(
                          children: [
                            if (product.image != null)
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: SizedBox(
                                  width: constraints.maxWidth,
                                  height: constraints.maxHeight / 2,
                                  child: Image.network(
                                    product.image!,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Text(
                                product.name ?? state.widget.search.results[index].title,
                                textAlign: TextAlign.center,
                                maxLines: 2,
                              ),
                            ),
                            if (product.price != null)
                              Text(
                                '\$${product.price}',
                                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                          ],
                        ),
                      );
                    },
                  );
                } else {
                  return const SizedBox.shrink();
                }
              },
              childCount: state.widget.search.results.length,
            ),
          ),
        ],
      ),
    );
  }
}
