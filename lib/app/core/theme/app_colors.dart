import 'package:flutter/material.dart';

/// Saare rang yahin se aayenge. Kisi screen mein Color(0xFF...) mat likhna.
abstract final class AppColors {
  static const Color background = Color(0xFF0B0F0D);
  static const Color card = Color(0xFF151B18);
  static const Color elevated = Color(0xFF1E2622);
  static const Color border = Color(0xFF232B27);
  static const Color outline = Color(0xFF3A4540);

  static const Color textPrimary = Color(0xFFF2F5F3);
  static const Color textMuted = Color(0xFF9BA7A1);

  static const Color primary = Color(0xFFC8F031); // lime
  static const Color primaryDark = Color(0xFFA8CC22);
  static const Color primaryTint = Color(0xFF27300F);
  static const Color onPrimary = Color(0xFF0B0F0D);

  static const Color danger = Color(0xFFFF6B4A); // coral
  static const Color dangerTint = Color(0xFF2A1612);
}
