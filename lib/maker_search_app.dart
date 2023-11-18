import 'package:flutter/material.dart';
import 'package:maker_search/screens/home/home_route.dart';

/// The root of the application containing the [MaterialApp] widget that wraps the entire application.
class MakerSearchApp extends StatelessWidget {
  const MakerSearchApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Maker Search',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: ThemeData(
        primaryColor: Colors.black54,
        primaryColorDark: Colors.black54,
        primaryColorLight: Colors.white70,
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFF212121),
        primaryColorLight: Colors.black54,
        primaryColorDark: Colors.white70,
      ),
      home: const HomeRoute(),
    );
  }
}