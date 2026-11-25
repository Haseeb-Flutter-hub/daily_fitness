import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

abstract final class AppTextStyles {
  /// Bade headings aur numbers (Barlow Condensed). Text ko .toUpperCase() karke dikhao.
  static TextStyle display(double size, {Color color = AppColors.textPrimary}) =>
      GoogleFonts.barlowCondensed(
        fontSize: size,
        fontWeight: FontWeight.w700,
        color: color,
        height: 1.0,
        letterSpacing: 0.5,
      );

  static TextStyle get h1 => display(44);
  static TextStyle get h2 => display(34);
  static TextStyle get h3 => display(26);
  static TextStyle get number => display(38);

  static TextStyle get title => GoogleFonts.inter(
      fontSize: 18, fontWeight: FontWeight.w700, color: AppColors.textPrimary);
  static TextStyle get subtitle => GoogleFonts.inter(
      fontSize: 16, fontWeight: FontWeight.w600, color: AppColors.textPrimary);
  static TextStyle get body => GoogleFonts.inter(
      fontSize: 15, fontWeight: FontWeight.w400, color: AppColors.textPrimary);
  static TextStyle get bodyBold => GoogleFonts.inter(
      fontSize: 15, fontWeight: FontWeight.w700, color: AppColors.textPrimary);
  static TextStyle get label => GoogleFonts.inter(
      fontSize: 13, fontWeight: FontWeight.w600, color: AppColors.textPrimary);
  static TextStyle get caption => GoogleFonts.inter(
      fontSize: 13, fontWeight: FontWeight.w400, color: AppColors.textMuted);
  static TextStyle get small => GoogleFonts.inter(
      fontSize: 12, fontWeight: FontWeight.w400, color: AppColors.textMuted);
  static TextStyle get button =>
      GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w700);
}
