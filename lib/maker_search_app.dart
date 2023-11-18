import 'package:flutter/material.dart';
import 'package:maker_search/screens/home/home_route.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

/// The root of the application containing the [MaterialApp] widget that wraps the entire application.
class MakerSearchApp extends StatelessWidget {
  const MakerSearchApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Maker Search',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,  // The only correct choice
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.black54,
        primaryColorDark: Colors.black87,
        primaryColorLight: Colors.white70,
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF212121),
        primaryColorLight: Colors.black54,
        primaryColorDark: Colors.white70,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
      ),
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'), // English
      ],
      home: const HomeRoute(),
    );
  }
}