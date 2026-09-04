import 'package:flutter/material.dart';

class AppTheme {
  static const Color background = Color(0xFF050B12);
  static const Color surface = Color(0xFF0B1520);
  static const Color cyan = Color(0xFF38D9FF);
  static const Color blue = Color(0xFF287BFF);

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: background,
    useMaterial3: true,
    colorScheme: const ColorScheme.dark(
      primary: cyan,
      secondary: blue,
      surface: surface,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
    ),
  );
}
