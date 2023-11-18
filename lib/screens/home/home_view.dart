import 'package:flutter/material.dart';
import 'package:maker_search/screens/components/web_background.dart';
import 'package:maker_search/screens/home/home_controller.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../components/search_input.dart';

class HomeView extends StatelessWidget {
  final HomeController state;

  const HomeView({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text('Maker Search'),
      ),
      body: Stack(
        children: [
          Opacity(
            opacity: 0.25,
            child: WebBackground(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 80.0,
                          left: 32.0,
                          right: 32.0,
                        ),
                        child: Text(
                          AppLocalizations.of(context)!.headline,
                          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 32.0,
                        ),
                        child: SearchInput(
                          onSubmit: (input) => state.onSearchSubmit(input),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
