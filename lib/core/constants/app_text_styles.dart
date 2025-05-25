import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

class AppTextStyles {
  static TextStyle header = GoogleFonts.josefinSans(
    fontSize: 35,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryText,
  );

  static TextStyle subtitle = GoogleFonts.josefinSans(
    fontSize: 25,
    fontWeight: FontWeight.w400,
    color: AppColors.secondaryText
  );

}