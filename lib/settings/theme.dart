import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hh_express/settings/consts.dart';

class AppTheme {
  static final mainTheme = ThemeData();

  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.white,
    appBarTheme: const AppBarTheme(
      color: AppColors.white,
    ),
    textTheme: TextTheme(
      displayLarge: GoogleFonts.rubik(
        fontWeight: FontWeight.w600,
        fontSize: 70.sp,
        color: AppColors.white,
      ),
      displayMedium: GoogleFonts.rubik(
        fontWeight: FontWeight.w400,
        fontSize: 20.sp,
        color: AppColors.white,
      ),
      titleMedium: GoogleFonts.rubik(
        fontWeight: FontWeight.w600,
        fontSize: 18.sp,
        color: AppColors.darkBlue,
      ),
      titleSmall: GoogleFonts.rubik(
        fontWeight: FontWeight.w400,
        fontSize: 12.sp,
        color: AppColors.darkGrey,
      ),
      titleLarge: GoogleFonts.rubik(
        fontSize: 14.sp,
        fontWeight: FontWeight.w700,
        color: AppColors.darkBlue,
      ),
      labelSmall: GoogleFonts.rubik(
        fontWeight: FontWeight.w700,
        fontSize: 10.sp,
        color: AppColors.white,
      ),
    ),
  );
}
