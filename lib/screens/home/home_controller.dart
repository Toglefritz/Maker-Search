import 'package:flutter/material.dart';

import 'home_route.dart';
import 'home_view.dart';

/// Controller for the [HomeRoute].
class HomeController extends State<HomeRoute> {
  /// Handles submissions into the search field. The search itself is not conducted by this controller. Rather,
  /// this controller navigates to the [SearchRoute] where the search itself takes place.
  void onSearchSubmit(String input) {
    // TODO navigate
  }

  @override
  Widget build(BuildContext context) => HomeView(state: this);
}