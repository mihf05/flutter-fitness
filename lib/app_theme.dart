import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Colors for light theme
  static final lightColors = {
    'background': const Color(0xFFFAFAFC),
    'surface': Colors.white,
    'text': const Color(0xFF2A2A2A),
    'subtitle': const Color(0xFF666666),
    'accent': const Color(0xFF4F46E5),
    'primary': const Color(0xFF005C5C),
    'card': Colors.white,
    'shadow': Colors.black.withOpacity(0.05),
  };

  // Colors for dark theme
  static final darkColors = {
    'background': const Color(0xFF0A0A0B),
    'surface': const Color(0xFF1A1A1D),
    'text': const Color(0xFFE8E8E8),
    'subtitle': const Color(0xFFB0B0B0),
    'accent': const Color(0xFF6366F1),
    'primary': const Color(0xFF005C5C),
    'card': const Color(0xFF1A1A1D),
    'shadow': Colors.black.withOpacity(0.3),
  };

  // Light theme
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: lightColors['primary'],
    scaffoldBackgroundColor: lightColors['background'],
    cardColor: lightColors['card'],
    shadowColor: lightColors['shadow'],
    colorScheme: ColorScheme.light(
      primary: lightColors['primary']!,
      secondary: lightColors['accent']!,
      surface: lightColors['surface']!,
      background: lightColors['background']!,
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      onSurface: lightColors['text']!,
      onBackground: lightColors['text']!,
    ),
    textTheme: GoogleFonts.bricolageGrotesqueTextTheme(
      ThemeData.light().textTheme.copyWith(
        bodyLarge: TextStyle(color: lightColors['text']),
        bodyMedium: TextStyle(color: lightColors['text']),
        titleLarge: TextStyle(color: lightColors['text']),
        titleMedium: TextStyle(color: lightColors['text']),
        titleSmall: TextStyle(color: lightColors['text']),
      ),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: lightColors['background'],
      elevation: 0,
      iconTheme: IconThemeData(color: lightColors['text']),
      titleTextStyle: GoogleFonts.bricolageGrotesque(
        color: lightColors['text'],
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
    ),
    iconTheme: IconThemeData(color: lightColors['text']),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: lightColors['accent'],
        foregroundColor: Colors.white,
      ),
    ),
    useMaterial3: true,
  );

  // Dark theme
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: darkColors['primary'],
    scaffoldBackgroundColor: darkColors['background'],
    cardColor: darkColors['card'],
    shadowColor: darkColors['shadow'],
    colorScheme: ColorScheme.dark(
      primary: darkColors['primary']!,
      secondary: darkColors['accent']!,
      surface: darkColors['surface']!,
      background: darkColors['background']!,
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      onSurface: darkColors['text']!,
      onBackground: darkColors['text']!,
    ),
    textTheme: GoogleFonts.bricolageGrotesqueTextTheme(
      ThemeData.dark().textTheme.copyWith(
        bodyLarge: TextStyle(color: darkColors['text']),
        bodyMedium: TextStyle(color: darkColors['text']),
        titleLarge: TextStyle(color: darkColors['text']),
        titleMedium: TextStyle(color: darkColors['text']),
        titleSmall: TextStyle(color: darkColors['text']),
      ),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: darkColors['background'],
      elevation: 0,
      iconTheme: IconThemeData(color: darkColors['text']),
      titleTextStyle: GoogleFonts.bricolageGrotesque(
        color: darkColors['text'],
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
    ),
    iconTheme: IconThemeData(color: darkColors['text']),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: darkColors['accent'],
        foregroundColor: Colors.white,
      ),
    ),
    useMaterial3: true,
  );
}
