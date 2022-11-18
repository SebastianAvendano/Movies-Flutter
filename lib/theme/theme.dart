import 'package:flutter/material.dart';

class AppTheme {
  static const primary = Colors.indigo;

  static ThemeData lightTheme = ThemeData.light().copyWith(
        //AppBarTheme
        appBarTheme: const AppBarTheme(
          color: primary,
          elevation: 0,
        )

      );
}