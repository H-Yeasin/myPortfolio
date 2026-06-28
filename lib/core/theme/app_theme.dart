import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const Color _darkBackground = Color(0xFF080A12);
  static const Color _darkSurface = Color(0xFF101522);
  static const Color _darkPrimary = Color(0xFFA7B8FF);
  static const Color _darkSecondary = Color(0xFF7EE7D1);
  static const Color _darkTextMain = Color(0xFFF9FAFB);
  static const Color _darkTextSub = Color(0xFFB9C2D3);

  static const Color _lightBackground = Color(0xFFF7F4EF);
  static const Color _lightSurface = Color(0xFFFFFFFF);
  static const Color _lightPrimary = Color(0xFF6E7BFF);
  static const Color _lightSecondary = Color(0xFF12A996);
  static const Color _lightTextMain = Color(0xFF111827);
  static const Color _lightTextSub = Color(0xFF566173);

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      primaryColor: _lightPrimary,
      scaffoldBackgroundColor: _lightBackground,
      colorScheme: const ColorScheme.light(
        primary: _lightPrimary,
        secondary: _lightSecondary,
        surface: _lightSurface,
        onSurface: _lightTextMain,
      ),
      textTheme: _buildTextTheme(_lightTextMain, _lightTextSub),
      appBarTheme: const AppBarTheme(
        backgroundColor: _lightBackground,
        elevation: 0,
        iconTheme: IconThemeData(color: _lightTextMain),
        titleTextStyle: TextStyle(
          color: _lightTextMain,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      cardTheme: CardThemeData(
        color: _lightSurface,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          textStyle: GoogleFonts.plusJakartaSans(fontWeight: FontWeight.w800),
        ),
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      primaryColor: _darkPrimary,
      scaffoldBackgroundColor: _darkBackground,
      colorScheme: const ColorScheme.dark(
        primary: _darkPrimary,
        secondary: _darkSecondary,
        surface: _darkSurface,
        onSurface: _darkTextMain,
      ),
      textTheme: _buildTextTheme(_darkTextMain, _darkTextSub),
      appBarTheme: const AppBarTheme(
        backgroundColor: _darkBackground,
        elevation: 0,
        iconTheme: IconThemeData(color: _darkTextMain),
        titleTextStyle: TextStyle(
          color: _darkTextMain,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      cardTheme: CardThemeData(
        color: _darkSurface,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          textStyle: GoogleFonts.plusJakartaSans(fontWeight: FontWeight.w800),
        ),
      ),
    );
  }

  static TextTheme _buildTextTheme(Color mainColor, Color subColor) {
    return GoogleFonts.plusJakartaSansTextTheme().copyWith(
      displayLarge: GoogleFonts.plusJakartaSans(
        color: mainColor,
        fontSize: 64,
        fontWeight: FontWeight.w800,
        letterSpacing: 0,
        height: 1.1,
      ),
      displayMedium: GoogleFonts.plusJakartaSans(
        color: mainColor,
        fontSize: 44,
        fontWeight: FontWeight.w800,
        letterSpacing: 0,
        height: 1.2,
      ),
      displaySmall: GoogleFonts.plusJakartaSans(
        color: mainColor,
        fontSize: 32,
        fontWeight: FontWeight.bold,
        letterSpacing: 0,
      ),
      headlineLarge: GoogleFonts.plusJakartaSans(
        color: mainColor,
        fontSize: 32,
        fontWeight: FontWeight.bold,
      ),
      headlineMedium: GoogleFonts.plusJakartaSans(
        color: mainColor,
        fontSize: 24,
        fontWeight: FontWeight.w700,
      ),
      headlineSmall: GoogleFonts.plusJakartaSans(
        color: mainColor,
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
      titleLarge: GoogleFonts.plusJakartaSans(
        color: mainColor,
        fontSize: 22,
        fontWeight: FontWeight.bold,
      ),
      titleMedium: GoogleFonts.plusJakartaSans(
        color: mainColor,
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),
      titleSmall: GoogleFonts.plusJakartaSans(
        color: mainColor,
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
      bodyLarge: GoogleFonts.plusJakartaSans(
        color: subColor,
        fontSize: 18,
        height: 1.6,
      ),
      bodyMedium: GoogleFonts.plusJakartaSans(
        color: subColor,
        fontSize: 16,
        height: 1.6,
      ),
      bodySmall: GoogleFonts.plusJakartaSans(
        color: subColor,
        fontSize: 12,
        height: 1.4,
      ),
      labelLarge: GoogleFonts.plusJakartaSans(
        color: mainColor,
        fontSize: 14,
        fontWeight: FontWeight.w600,
        letterSpacing: 0,
      ),
      labelMedium: GoogleFonts.plusJakartaSans(
        color: subColor,
        fontSize: 12,
        fontWeight: FontWeight.w500,
      ),
      labelSmall: GoogleFonts.plusJakartaSans(
        color: subColor,
        fontSize: 10,
        fontWeight: FontWeight.w500,
        letterSpacing: 0,
      ),
    );
  }
}
