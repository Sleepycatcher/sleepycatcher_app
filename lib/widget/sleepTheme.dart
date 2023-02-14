import 'package:flutter/material.dart';

final ThemeData sleepTheme = ThemeData(
  /// brightness: Brightness.dark,
  /// colorSchemeSeed: Colors.red,
  /// primaryColor: Colors.lightBlue[800],

  backgroundColor: Colors.red,

  // Define the default font family.
  fontFamily: 'Georgia',
  textTheme: const TextTheme(
    displayLarge: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
    titleLarge: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
    bodyMedium: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
  ),

);