import 'package:flutter/material.dart';

class AppTheme {
  static const Color background = Color(0xFF02060B);
  static const Color surface = Color(0xFF07121C);
  static const Color glass = Color(0x66101F2C);

  static const Color cyan = Color(0xFF00E5FF);
  static const Color electricBlue = Color(0xFF2979FF);
  static const Color purple = Color(0xFF7C4DFF);

  static const TextStyle neonTitle = TextStyle(
    color: Colors.white,
    fontSize: 34,
    fontWeight: FontWeight.w700,
    letterSpacing: 1.2,
    shadows: [
      Shadow(
        color: cyan,
        blurRadius: 6,
      ),
      Shadow(
        color: cyan,
        blurRadius: 18,
      ),
      Shadow(
        color: electricBlue,
        blurRadius: 32,
      ),
    ],
  );

  static const TextStyle neonText = TextStyle(
    color: Colors.white,
    fontSize: 18,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.5,
    shadows: [
      Shadow(
        color: cyan,
        blurRadius: 5,
      ),
      Shadow(
        color: cyan,
        blurRadius: 14,
      ),
    ],
  );

  static const TextStyle softNeonText = TextStyle(
    color: Color(0xFFE8FBFF),
    fontSize: 14,
    shadows: [
      Shadow(
        color: cyan,
        blurRadius: 4,
      ),
      Shadow(
        color: electricBlue,
        blurRadius: 10,
      ),
    ],
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: background,
    useMaterial3: true,

    colorScheme: const ColorScheme.dark(
      primary: cyan,
      secondary: electricBlue,
      surface: surface,
    ),

    textTheme: const TextTheme(
      displayLarge: neonTitle,
      headlineLarge: neonTitle,
      titleLarge: neonText,
      bodyLarge: softNeonText,
      bodyMedium: softNeonText,
    ),

    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      titleTextStyle: neonText,
    ),

    cardTheme: CardThemeData(
      color: glass,
      elevation: 0,
      shadowColor: cyan,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(22),
        ),
        side: BorderSide(
          color: Color(0x6600E5FF),
          width: 1,
        ),
      ),
    ),
  );
}
