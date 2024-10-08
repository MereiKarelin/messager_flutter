// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class MColors {
  static const Color primaryColor = Color.fromRGBO(33, 32, 32, 1);
  static const Color backgroundColor = Color.fromRGBO(33, 32, 32, 1);
  static const Color bottomAppBarColor = Color.fromRGBO(25, 24, 24, 1);
  static const Color primaryBackgroudColor = Color.fromRGBO(217, 217, 217, 1);
  static const Color greenColor = Color.fromRGBO(31, 9, 58, 1);
  static const Color purpleColor = Color.fromRGBO(116, 70, 172, 1);
  static const Color pinkColor = Color.fromRGBO(170, 4, 74, 1);
  static const Color secondaryPrimaryColor = Color.fromRGBO(86, 84, 84, 1);
  static const Color iconColor = Color.fromRGBO(141, 141, 141, 1);
  static const Color blueColor = Color.fromRGBO(13, 19, 51, 1);

  static const Color leagingTextColor = Color.fromRGBO(246, 244, 244, 1);
  static const Color primaryTextColor = Color.fromRGBO(246, 244, 244, 1);
  static const Color secondaryTextColor = Color.fromRGBO(246, 244, 244, 1);
  static const Color grayTextColor = Color.fromRGBO(141, 141, 141, 1);
  static const Color whiteTextColor = Color.fromRGBO(255, 255, 255, 1);

  static const Gradient greenLiniarGradient = LinearGradient(colors: [Color.fromRGBO(31, 219, 95, 1), Color.fromRGBO(49, 199, 100, 1)]);
  static const Gradient orangeLiniarGradient = LinearGradient(colors: [Color.fromRGBO(246, 103, 0, 1), Color.fromRGBO(237, 57, 0, 1)]);
  static const Gradient blueLiniarGradient = LinearGradient(colors: [Color.fromRGBO(0, 172, 246, 1), Color.fromRGBO(0, 109, 237, 1)]);
  static const Gradient purpleGradient = LinearGradient(colors: [Color.fromARGB(255, 103, 32, 189), purpleColor]);
}

class MThemeData {
  static ThemeData getTheme() {
    return ThemeData(
      primaryColor: const Color.fromRGBO(237, 242, 246, 1),
      // backgroundColor: Colors.white,
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: const AppBarTheme(
        color: Color.fromRGBO(237, 242, 246, 1),
        iconTheme: IconThemeData(color: Color.fromRGBO(43, 51, 62, 1)),
      ),
      textTheme: const TextTheme(
          // headline1: TextStyle(
          //   color: Color.fromRGBO(43, 51, 62, 1),
          //   fontSize: 24.0,
          //   fontWeight: FontWeight.bold,
          // ),
          // bodyText1: TextStyle(
          //   color: Color.fromRGBO(0, 0, 0, 1),
          //   fontSize: 16.0,
          // ),
          // bodyText2: TextStyle(
          //   color: Color.fromRGBO(94, 122, 144, 1),
          //   fontSize: 16.0,
          // ),
          // subtitle1: TextStyle(
          //   color: Color.fromRGBO(157, 183, 203, 1),
          //   fontSize: 14.0,
          // ),
          // subtitle2: TextStyle(
          //   color: Colors.white,
          //   fontSize: 14.0,
          // ),
          ),
    );
  }
}
