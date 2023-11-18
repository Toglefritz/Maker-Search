import 'package:flutter/material.dart';
import 'package:maker_search/screens/home/home_controller.dart';

class HomeView extends StatelessWidget{
  final HomeController state;

  const HomeView({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Maker Search'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
          ],
        ),
      ),
    );
  }
}
