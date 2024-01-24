import 'package:flutter/material.dart';

class MColors {
  static const Color primaryColor = Color.fromRGBO(237, 242, 246, 1);
  static const Color backgroundColor = Colors.white;

  static const Color leagingTextColor = Color.fromRGBO(43, 51, 62, 1);
  static const Color primaryTextColor = Color.fromRGBO(0, 0, 0, 1);
  static const Color secondaryTextColor = Color.fromRGBO(94, 122, 144, 1);
  static const Color grayTextColor = Color.fromRGBO(157, 183, 203, 1);
  static const Color whiteTextColor = Color.fromRGBO(255, 255, 255, 1);

  static const Gradient greenLiniarGradient = LinearGradient(colors: [
    Color.fromRGBO(31, 219, 95, 1),
    Color.fromRGBO(49, 199, 100, 1)
  ]);
  static const Gradient orangeLiniarGradient = LinearGradient(
      colors: [Color.fromRGBO(246, 103, 0, 1), Color.fromRGBO(237, 57, 0, 1)]);
  static const Gradient blueLiniarGradient = LinearGradient(
      colors: [Color.fromRGBO(0, 172, 246, 1), Color.fromRGBO(0, 109, 237, 1)]);
}
