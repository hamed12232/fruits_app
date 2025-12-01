import 'package:flutter/material.dart';
import 'package:fruits_app/core/utils/constant/app_colors.dart';
import 'package:fruits_app/core/utils/constant/app_sizes.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextTheme {
  AppTextTheme._();

  /* -- Light Text Theme -- */
  static TextTheme lightTextTheme = TextTheme(
    displayLarge: GoogleFonts.poppins(
      fontSize: AppSizes.sp28,
      fontWeight: FontWeight.bold,
      color: AppColors.black,
    ),
    //  displayMedium: GoogleFonts.poppins(fontSize: 24.0, fontWeight: FontWeight.w700, color: AppColors.dark),
    //  displaySmall: GoogleFonts.poppins(fontSize: 24.0, fontWeight: FontWeight.normal, color: AppColors.dark),
    headlineLarge: GoogleFonts.poppins(
      fontSize: AppSizes.sp22,
      fontWeight: FontWeight.bold,
      color: AppColors.headlineTextColor,
    ),
    headlineMedium: GoogleFonts.poppins(
      fontSize: AppSizes.sp17,
      fontWeight: FontWeight.w500,
      color: AppColors.subtitleTextColor,
    ),
    //  headlineSmall: GoogleFonts.poppins(fontSize: 18.0, fontWeight: FontWeight.normal, color: AppColors.dark),
    //  titleLarge: GoogleFonts.poppins(fontSize: 14.0, fontWeight: FontWeight.w600, color: AppColors.dark),
    //  bodyLarge: GoogleFonts.poppins(fontSize: 14.0, color: AppColors.bodyTextColor),
    bodyMedium: GoogleFonts.poppins(
      fontSize: AppSizes.sp18,
      color: AppColors.black,
      fontWeight: FontWeight.w400,
    ),
    labelMedium: GoogleFonts.titilliumWeb(
      fontSize: AppSizes.sp19,
      color: AppColors.black,
      fontWeight: FontWeight.bold,
    ),
  );

  /* -- Dark Text Theme -- */
  // static TextTheme darkTextTheme = TextTheme(
  //   displayLarge: GoogleFonts.poppins(fontSize: 28.0, fontWeight: FontWeight.bold, color: AppColors.white),
  //   displayMedium: GoogleFonts.poppins(fontSize: 24.0, fontWeight: FontWeight.w700, color: AppColors.white),
  //   displaySmall: GoogleFonts.poppins(fontSize: 24.0, fontWeight: FontWeight.normal, color: AppColors.white),
  //   headlineMedium: GoogleFonts.poppins(fontSize: 18.0, fontWeight: FontWeight.w600, color: AppColors.white),
  //   headlineSmall: GoogleFonts.poppins(fontSize: 18.0, fontWeight: FontWeight.normal, color: AppColors.white),
  //   titleLarge: GoogleFonts.poppins(fontSize: 14.0, fontWeight: FontWeight.w600, color: AppColors.white),
  //   bodyLarge: GoogleFonts.poppins(fontSize: 14.0, color: AppColors.white),
  //   bodyMedium: GoogleFonts.poppins(fontSize: 14.0, color: AppColors.white.withValues(alpha: 0.8)),
  // );
}
