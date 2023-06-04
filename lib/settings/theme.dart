import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hh_express/settings/consts.dart';

class AppTheme {
  static final mainTheme = ThemeData();

  static TextStyle lineThroughTitleSmall(BuildContext context) =>
      Theme.of(context).textTheme.titleSmall!.copyWith(
          decoration: TextDecoration.lineThrough, decorationThickness: 2.sp);

  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.white,
    appBarTheme: const AppBarTheme(
      color: AppColors.white,
    ),
    fontFamily: GoogleFonts.rubik().fontFamily,
    badgeTheme: BadgeThemeData(
      textColor: AppColors.white,
      backgroundColor: AppColors.mainOrange,
      alignment: Alignment.center,
      padding: EdgeInsets.all(3.sp),
      textStyle: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 10.sp,
        color: AppColors.white,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: AppColors.lightGrey,
      hintStyle: TextStyle(
        fontWeight: FontWeight.w400,
        color: AppColors.darkGrey,
        fontSize: 14.sp,
      ),
    ),
    hintColor: AppColors.darkGrey,
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        alignment: Alignment.center,
        textStyle: TextStyle(
          fontWeight: FontWeight.w400,
          color: AppColors.mainOrange,
          fontSize: 14.sp,
        ),
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.white,
      selectedItemColor: AppColors.mainOrange,
      selectedLabelStyle: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 10.sp,
        color: AppColors.mainOrange,
      ),
      unselectedLabelStyle: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 10.sp,
        color: AppColors.darkGrey,
      ),
      unselectedItemColor: AppColors.darkGrey,
    ),
    textTheme: TextTheme(
      displayLarge: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 70.sp,
        color: AppColors.white,
      ),
      displayMedium: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 20.sp,
        color: AppColors.white,
      ),
      titleMedium: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 18.sp,
        color: AppColors.darkBlue,
      ),
      titleSmall: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 12.sp,
        color: AppColors.darkGrey,
      ),
      titleLarge: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w700,
        color: AppColors.darkBlue,
      ),
    ),
  );
}
