import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Modern Color Palette (2026 Style)
  // Dark Mode: Deep Void with Neon Accents
  static const Color _darkBackground = Color(0xFF070708);
  static const Color _darkSurface = Color(0xFF121216);
  static const Color _darkPrimary = Color(0xFF8B5CF6); // Rich Violet
  static const Color _darkSecondary = Color(0xFF10B981); // Emerald
  static const Color _darkTextMain = Color(0xFFF9FAFB);
  static const Color _darkTextSub = Color(0xFF9CA3AF);

  static const Color _lightBackground = Color(0xFFF3F4F6);
  static const Color _lightSurface = Color(0xFFFFFFFF);
  static const Color _lightPrimary = Color(0xFF7C3AED); // Deep Violet
  static const Color _lightSecondary = Color(0xFF059669);
  static const Color _lightTextMain = Color(0xFF111827);
  static const Color _lightTextSub = Color(0xFF4B5563);

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
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
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
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
    );
  }

  static TextTheme _buildTextTheme(Color mainColor, Color subColor) {
    return GoogleFonts.plusJakartaSansTextTheme().copyWith(
      displayLarge: GoogleFonts.plusJakartaSans(
        color: mainColor,
        fontSize: 64,
        fontWeight: FontWeight.w800,
        letterSpacing: -2,
        height: 1.1,
      ),
      displayMedium: GoogleFonts.plusJakartaSans(
        color: mainColor,
        fontSize: 44,
        fontWeight: FontWeight.w800,
        letterSpacing: -1,
        height: 1.2,
      ),
      displaySmall: GoogleFonts.plusJakartaSans(
        color: mainColor,
        fontSize: 32,
        fontWeight: FontWeight.bold,
        letterSpacing: -0.5,
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
        letterSpacing: 1,
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
        letterSpacing: 1.2,
      ),
    );
  }
}
