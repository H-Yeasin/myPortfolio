import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const Color _darkBackground = Color(0xFF080A12);
  static const Color _darkSurface = Color(0xFF101522);
  static const Color _darkSurfaceHigh = Color(0xFF171D2C);
  static const Color _darkPrimary = Color(0xFFA7B8FF);
  static const Color _darkSecondary = Color(0xFF7EE7D1);
  static const Color _darkTextMain = Color(0xFFF9FAFB);
  static const Color _darkTextSub = Color(0xFFB9C2D3);

  static const Color _lightBackground = Color(0xFFF7F4EF);
  static const Color _lightSurface = Color(0xFFFFFFFF);
  static const Color _lightSurfaceHigh = Color(0xFFFFFBF4);
  static const Color _lightPrimary = Color(0xFF6E7BFF);
  static const Color _lightSecondary = Color(0xFF12A996);
  static const Color _lightTextMain = Color(0xFF111827);
  static const Color _lightTextSub = Color(0xFF566173);
  static const Color warmAccent = Color(0xFFFFC875);

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
        surfaceContainerHighest: _lightSurfaceHigh,
        onSurface: _lightTextMain,
        onPrimary: Colors.white,
        outline: Color(0xFFE3D9CB),
      ),
      extensions: const [
        AppThemeColors(
          backgroundGradient: [
            Color(0xFFF9F5EE),
            Color(0xFFEFF4FF),
            Color(0xFFF8F0E5),
          ],
          glassSurface: Color(0xD9FFFFFF),
          glassSurfaceStrong: Color(0xF2FFFFFF),
          appBarOverlay: Color(0xB3FFFFFF),
          softBorder: Color(0xFFE4DCCF),
          mutedText: _lightTextSub,
          subtleGrid: Color(0x26111827),
          inverseButtonText: Colors.white,
        ),
      ],
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
        surfaceContainerHighest: _darkSurfaceHigh,
        onSurface: _darkTextMain,
        onPrimary: _darkBackground,
        outline: Color(0xFF30384A),
      ),
      extensions: const [
        AppThemeColors(
          backgroundGradient: [
            Color(0xFF080A12),
            Color(0xFF101827),
            Color(0xFF15111D),
          ],
          glassSurface: Color(0xCC141A28),
          glassSurfaceStrong: Color(0xF2182030),
          appBarOverlay: Color(0xB3080A12),
          softBorder: Color(0xFF2A3345),
          mutedText: _darkTextSub,
          subtleGrid: Color(0x18FFFFFF),
          inverseButtonText: _darkBackground,
        ),
      ],
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

class AppThemeColors extends ThemeExtension<AppThemeColors> {
  final List<Color> backgroundGradient;
  final Color glassSurface;
  final Color glassSurfaceStrong;
  final Color appBarOverlay;
  final Color softBorder;
  final Color mutedText;
  final Color subtleGrid;
  final Color inverseButtonText;

  const AppThemeColors({
    required this.backgroundGradient,
    required this.glassSurface,
    required this.glassSurfaceStrong,
    required this.appBarOverlay,
    required this.softBorder,
    required this.mutedText,
    required this.subtleGrid,
    required this.inverseButtonText,
  });

  @override
  AppThemeColors copyWith({
    List<Color>? backgroundGradient,
    Color? glassSurface,
    Color? glassSurfaceStrong,
    Color? appBarOverlay,
    Color? softBorder,
    Color? mutedText,
    Color? subtleGrid,
    Color? inverseButtonText,
  }) {
    return AppThemeColors(
      backgroundGradient: backgroundGradient ?? this.backgroundGradient,
      glassSurface: glassSurface ?? this.glassSurface,
      glassSurfaceStrong: glassSurfaceStrong ?? this.glassSurfaceStrong,
      appBarOverlay: appBarOverlay ?? this.appBarOverlay,
      softBorder: softBorder ?? this.softBorder,
      mutedText: mutedText ?? this.mutedText,
      subtleGrid: subtleGrid ?? this.subtleGrid,
      inverseButtonText: inverseButtonText ?? this.inverseButtonText,
    );
  }

  @override
  AppThemeColors lerp(ThemeExtension<AppThemeColors>? other, double t) {
    if (other is! AppThemeColors) {
      return this;
    }

    return AppThemeColors(
      backgroundGradient: List<Color>.generate(
        backgroundGradient.length,
        (index) => Color.lerp(
          backgroundGradient[index],
          other.backgroundGradient[index],
          t,
        )!,
      ),
      glassSurface: Color.lerp(glassSurface, other.glassSurface, t)!,
      glassSurfaceStrong:
          Color.lerp(glassSurfaceStrong, other.glassSurfaceStrong, t)!,
      appBarOverlay: Color.lerp(appBarOverlay, other.appBarOverlay, t)!,
      softBorder: Color.lerp(softBorder, other.softBorder, t)!,
      mutedText: Color.lerp(mutedText, other.mutedText, t)!,
      subtleGrid: Color.lerp(subtleGrid, other.subtleGrid, t)!,
      inverseButtonText:
          Color.lerp(inverseButtonText, other.inverseButtonText, t)!,
    );
  }
}

extension AppThemeData on ThemeData {
  AppThemeColors get appColors => extension<AppThemeColors>()!;
}
