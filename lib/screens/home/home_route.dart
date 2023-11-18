import 'package:flutter/material.dart';
import 'package:maker_search/screens/home/home_controller.dart';

/// The landing page for the app, providing an input field used to provide search queries to be fed into
/// a Google Programmable Search Engine.
class HomeRoute extends StatefulWidget {
  const HomeRoute({
    super.key,
  });

  @override
  State<HomeRoute> createState() => HomeController();
}