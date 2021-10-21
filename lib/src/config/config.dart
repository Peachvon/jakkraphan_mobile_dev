import 'package:flutter/material.dart';

class Theme {
  static const activeColor1 = Color(0XFFffd194);
  static const activeColor2 = Color(0XFF70e1f5);
  static const login = Color(0xFF6CA8F1);
  static const signup = Color(0xFF6CA8F1);
  static const login_facebook = Color(0xFF3b5998);
  static const login_gmail = Colors.redAccent;

  static const check_true_color = Colors.lightGreen;
  static const check_false_color = Colors.black;

  static const check_true_icon = Icons.check_circle;
  static const check_false_icon = Icons.check_circle_outline;



  static const gradientColors = const LinearGradient(
    colors: [activeColor1, activeColor2],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    stops: [0.0, 1.0],
  );
}
