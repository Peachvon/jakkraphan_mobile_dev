import 'package:flutter/material.dart';
import 'package:pokemon_test/src/pages/login_page.dart';
import 'package:pokemon_test/src/pages/home_page.dart';
import 'package:pokemon_test/src/pages/signup_page.dart';
import 'package:pokemon_test/src/pages/details_page.dart';

final Map<String, WidgetBuilder> map = {
  '/LoginPage': (BuildContext context) => LoginPage(),
  '/HomePage': (BuildContext context) => HomePage(),
  '/Signup_page': (BuildContext context) => Signup_page(),
};
