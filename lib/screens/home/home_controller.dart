import 'package:flutter/material.dart';

import 'home_route.dart';
import 'home_view.dart';

/// Controller for the [HomeRoute].
class HomeController extends State<HomeRoute> {
  @override
  Widget build(BuildContext context) => HomeView(state: this);
}