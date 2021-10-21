import 'package:flutter/material.dart';
import 'package:pokemon_test/main.dart';
import 'package:pokemon_test/router.dart';
import 'package:pokemon_test/src/pages/home_page.dart';
import 'package:pokemon_test/src/pages/login_page.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: map,
      initialRoute: initRoute,

    );
  }
}