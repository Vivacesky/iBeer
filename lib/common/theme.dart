import 'package:flutter/material.dart';

ThemeData get iBeerTheme {
  return ThemeData(
    appBarTheme: const AppBarTheme(color: Colors.black),
    textTheme: const TextTheme(
      headline1: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold),
      bodyText1: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
      caption: TextStyle(fontSize: 16.0),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
          foregroundColor: MaterialStateProperty.all<Color>(Colors.black)),
    ),
    scaffoldBackgroundColor: Colors.grey[100],
  );
}
