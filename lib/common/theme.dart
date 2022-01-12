import 'package:flutter/material.dart';

ThemeData get iBeerTheme {
  return ThemeData(
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      linearTrackColor: Colors.grey,
      color: Colors.white,
      refreshBackgroundColor: Colors.grey,
    ),
    colorScheme: ColorScheme.fromSwatch(primarySwatch: primaryBlack, accentColor: Colors.white),
    textTheme: const TextTheme(
      headline1: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold),
      bodyText1: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
      caption: TextStyle(fontSize: 16.0),
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(foregroundColor: MaterialStateProperty.all<Color>(Colors.black)),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
          foregroundColor: MaterialStateProperty.all<Color>(Colors.black)),
    ),
    listTileTheme: const ListTileThemeData(
      tileColor: Colors.white,
    ),
    scaffoldBackgroundColor: Colors.grey[100],
  );
}

const MaterialColor primaryBlack = MaterialColor(
  _blackPrimaryValue,
  <int, Color>{
    50: Color(0xFF000000),
    100: Color(0xFF000000),
    200: Color(0xFF000000),
    300: Color(0xFF000000),
    400: Color(0xFF000000),
    500: Color(_blackPrimaryValue),
    600: Color(0xFF000000),
    700: Color(0xFF000000),
    800: Color(0xFF000000),
    900: Color(0xFF000000),
  },
);
const int _blackPrimaryValue = 0xFF000000;
