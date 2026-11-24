import 'package:flutter/material.dart';

class C {
  static const bg = Color(0xFF0B0B11);
  static const surface = Color(0xFF12121B);
  static const card = Color(0xFF1A1A26);
  static const cardAlt = Color(0xFF212130);
  static const border = Color(0xFF2B2B3D);
  static const accent = Color(0xFF7C5CFF);
  static const accentSoft = Color(0xFF9D84FF);
  static const teal = Color(0xFF2DE1C2);
  static const pink = Color(0xFFFF6C9D);
  static const amber = Color(0xFFFFB84D);
  static const blue = Color(0xFF4ECDE6);
  static const text = Color(0xFFF4F4FA);
  static const textDim = Color(0xFF9C9CB2);
  static const textFaint = Color(0xFF6B6B82);
  static const success = Color(0xFF4ADE80);
  static const danger = Color(0xFFFF6B6B);

  static const gradient = LinearGradient(
    colors: [Color(0xFF7C5CFF), Color(0xFF4ECDE6)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  static const gradientWarm = LinearGradient(
    colors: [Color(0xFF7C5CFF), Color(0xFFFF6C9D)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}

class AppTheme {
  static ThemeData dark() {
    final base = ThemeData.dark(useMaterial3: true);
    return base.copyWith(
      scaffoldBackgroundColor: C.bg,
      colorScheme: const ColorScheme.dark(
        surface: C.surface,
        primary: C.accent,
        secondary: C.teal,
        onSurface: C.text,
      ),
      textTheme: base.textTheme.apply(
        fontFamily: 'Inter',
        bodyColor: C.text,
        displayColor: C.text,
      ),
      splashFactory: NoSplash.splashFactory,
      highlightColor: Colors.transparent,
    );
  }
}
