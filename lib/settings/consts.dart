import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppPaddings {
  static EdgeInsets left_12 = EdgeInsets.only(left: 12.w);
  static EdgeInsets left_16 = EdgeInsets.only(left: 16.w);
  static EdgeInsets left_24 = EdgeInsets.only(left: 24.w);
  static EdgeInsets left_6 = EdgeInsets.only(left: 6.w);

  static EdgeInsets right_12 = EdgeInsets.only(right: 12.w);
  static EdgeInsets right_16 = EdgeInsets.only(right: 16.w);
  static EdgeInsets right_24 = EdgeInsets.only(right: 24.w);
  static EdgeInsets right_6 = EdgeInsets.only(right: 6.w);

  static EdgeInsets top_12 = EdgeInsets.only(top: 12.w);
  static EdgeInsets top_16 = EdgeInsets.only(top: 16.w);
  static EdgeInsets top_24 = EdgeInsets.only(top: 24.w);
  static EdgeInsets top_6 = EdgeInsets.only(top: 6.w);

  static EdgeInsets bottom_12 = EdgeInsets.only(bottom: 12.w);
  static EdgeInsets bottom_16 = EdgeInsets.only(bottom: 16.w);
  static EdgeInsets bottom_24 = EdgeInsets.only(bottom: 24.w);
  static EdgeInsets bottom_6 = EdgeInsets.only(bottom: 6.w);

  static EdgeInsets all_12 = EdgeInsets.all(12.sp);
  static EdgeInsets all_16 = EdgeInsets.all(16.sp);
  static EdgeInsets all_24 = EdgeInsets.all(24.sp);
  static EdgeInsets all_6 = EdgeInsets.all(6.sp);

  static EdgeInsets horiz_12 = EdgeInsets.symmetric(horizontal: 12.w);
  static EdgeInsets horiz_16 = EdgeInsets.symmetric(horizontal: 16.w);
  static EdgeInsets horiz_24 = EdgeInsets.symmetric(horizontal: 24.w);
  static EdgeInsets horiz_6 = EdgeInsets.symmetric(horizontal: 6.w);

  static EdgeInsets vertic_12 = EdgeInsets.symmetric(vertical: 12.h);
  static EdgeInsets vertic_16 = EdgeInsets.symmetric(vertical: 16.h);
  static EdgeInsets vertic_24 = EdgeInsets.symmetric(vertical: 24.h);
  static EdgeInsets vertic_6 = EdgeInsets.symmetric(vertical: 6.h);
}

class AppBorderRadiuses {
  static BorderRadius borderRadius_4circular = BorderRadius.circular(4.h);
  static BorderRadius borderRadius_8circular = BorderRadius.circular(8.h);
  static BorderRadius borderRadius_12circular = BorderRadius.circular(12.h);
}

class AppColors {
  static const red = Color(0xFFDB3022);
  static const superAppColor = Color.fromRGBO(62, 82, 188, 1);
  static const superAppShadowColor = Color.fromRGBO(51, 67, 152, 1);
  static const primaryColor = Color.fromARGB(255, 24, 107, 140);
  static const black = Color(0xFF222222);
  static const lightGray = Color(0xFF9B9B9B);
  static const darkGray = Color(0xFF979797);
  static const white = Color(0xFFFFFFFF);
  static const orange = Color(0xFFFFBA49);
  static const background = Color(0xFFE5E5E5);
  static const backgroundLight = Color(0xFFF9F9F9);
  static const transparent = Color(0x00000000);
  static const success = Color(0xFF2AA952);
  static const green = Color(0xFF2AA952);
  // !
  static Color shimmerBaseColor = const Color(0xFF9B9B9B).withOpacity(.3);
  static Color shimmerHighlightColor = const Color(0xFF9B9B9B).withOpacity(.2);
  static Color shimmerBodyColor = const Color(0xFF9B9B9B).withOpacity(.3);
}

class AppDurations {
  static Duration duration_500ms = const Duration(milliseconds: 500);
  static Duration duration_250ms = const Duration(milliseconds: 250);
}
