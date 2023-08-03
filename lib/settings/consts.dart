import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppPaddings {
  static const secondSplashAlign = Alignment(0.35, -0.12);
//! Aligns

  static EdgeInsets? homeProdPadding(int index) {
    if (index < 0) return null;
    return EdgeInsets.only(
      top: 12.h,
      left: index % 2 == 0 ? 16.w : 4.w,
      right: index % 2 == 1 ? 16.w : 4.w,
    );
  }

  static EdgeInsets? homeProdmargin(int index) {
    if (index > 0) return null;
    return EdgeInsets.only(
      left: index == -1 ? 16.w : 4.w,
      right: 4.w,
    );
  }

  static EdgeInsets left_12 = EdgeInsets.only(left: 12.w);
  static EdgeInsets left_16 = EdgeInsets.only(left: 16.w);
  static EdgeInsets left_18 = EdgeInsets.only(left: 18.w);
  static EdgeInsets left_24 = EdgeInsets.only(left: 24.w);
  static EdgeInsets left_28 = EdgeInsets.only(left: 28.w);
  static EdgeInsets left_6 = EdgeInsets.only(left: 6.w);

  static EdgeInsets right_12 = EdgeInsets.only(right: 12.w);
  static EdgeInsets right_10 = EdgeInsets.only(right: 10.w);
  static EdgeInsets right_16 = EdgeInsets.only(right: 16.w);
  static EdgeInsets right_24 = EdgeInsets.only(right: 24.w);
  static EdgeInsets right_28 = EdgeInsets.only(right: 28.w);
  static EdgeInsets right_7 = EdgeInsets.only(right: 7.w);
  static EdgeInsets right_6 = EdgeInsets.only(right: 6.w);
  static EdgeInsets right_14 = EdgeInsets.only(right: 14.w);

  static EdgeInsets top_12 = EdgeInsets.only(top: 12.h);
  static EdgeInsets top_16 = EdgeInsets.only(top: 16.h);
  static EdgeInsets top_24 = EdgeInsets.only(top: 24.h);
  static EdgeInsets top_20 = EdgeInsets.only(top: 20.h);
  static EdgeInsets top_28 = EdgeInsets.only(top: 28.h);
  static EdgeInsets top_2 = EdgeInsets.only(top: 2.h);
  static EdgeInsets top_6 = EdgeInsets.only(top: 6.h);

  static EdgeInsets bottom_24 = EdgeInsets.only(bottom: 24.h);
  static EdgeInsets bottom_28 = EdgeInsets.only(bottom: 28.h);
  static EdgeInsets bottom_15 = EdgeInsets.only(bottom: 15.h);
  static EdgeInsets bottom_16 = EdgeInsets.only(bottom: 16.h);
  static EdgeInsets bottom_12 = EdgeInsets.only(bottom: 12.h);
  static EdgeInsets bottom_10 = EdgeInsets.only(bottom: 10.h);

  static EdgeInsets all_12 = EdgeInsets.all(12.sp);
  static EdgeInsets all_16 = EdgeInsets.all(16.sp);
  static EdgeInsets all_24 = EdgeInsets.all(24.sp);
  static EdgeInsets all_28 = EdgeInsets.all(28.sp);
  static final all_2 = EdgeInsets.all(2.sp);
  static final all_4 = EdgeInsets.all(4.sp);
  static final all_5 = EdgeInsets.all(5.sp);
  static EdgeInsets all_6 = EdgeInsets.all(6.sp);

  static EdgeInsets horiz_12 = EdgeInsets.symmetric(horizontal: 12.w);
  static EdgeInsets horiz_10half = EdgeInsets.symmetric(horizontal: 10.5.w);
  static EdgeInsets horiz_16 = EdgeInsets.symmetric(horizontal: 16.w);
  static EdgeInsets horiz_24 = EdgeInsets.symmetric(horizontal: 24.w);
  static EdgeInsets horiz_21 = EdgeInsets.symmetric(horizontal: 21.w);
  static EdgeInsets horiz_28 = EdgeInsets.symmetric(horizontal: 28.h);
  static EdgeInsets horiz_8 = EdgeInsets.symmetric(horizontal: 8.w);
  static EdgeInsets horiz_6 = EdgeInsets.symmetric(horizontal: 6.w);
  static EdgeInsets horiz_2 = EdgeInsets.symmetric(horizontal: 2.w);
  static EdgeInsets horiz_3 = EdgeInsets.symmetric(horizontal: 3.w);
  static EdgeInsets horiz_4 = EdgeInsets.symmetric(horizontal: 4.w);

  static final vertic_10 = EdgeInsets.symmetric(vertical: 10.h);
  static EdgeInsets vertic_12 = EdgeInsets.symmetric(vertical: 12.h);
  static EdgeInsets vertic_16 = EdgeInsets.symmetric(vertical: 16.h);
  static EdgeInsets vertic_15 = EdgeInsets.symmetric(vertical: 15.h);
  static EdgeInsets vertic_24 = EdgeInsets.symmetric(vertical: 24.h);
  static EdgeInsets vertic_28 = EdgeInsets.symmetric(vertical: 28.h);
  static EdgeInsets vertic_8 = EdgeInsets.symmetric(vertical: 8.h);
  static EdgeInsets vertic_6 = EdgeInsets.symmetric(vertical: 6.h);
  static EdgeInsets vertic_4 = EdgeInsets.symmetric(vertical: 4.h);

  //! speciffics
  static final horiz16_vertic12 = horiz_16.copyWith(bottom: 12.h, top: 12.h);
  static final horiz16_vertic18 = horiz_16.copyWith(bottom: 18.h, top: 18.h);
  static final horiz16_vertic24 = horiz_16.copyWith(bottom: 24.h, top: 24.h);
  static final horiz16_botto10 = horiz_16.copyWith(bottom: 10.h);
  static final horiz10_vertic5 =
      EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h);
  static final horiz56_vertic70 =
      EdgeInsets.symmetric(horizontal: 56.w, vertical: 70.h);
  static final horiz12_vertic17 =
      EdgeInsets.symmetric(horizontal: 12.w, vertical: 17.h);
  static final top16_bottom24 = vertic_16.copyWith(bottom: 24.h);
  static EdgeInsets top15_bottom19 = EdgeInsets.only(top: 15.h, bottom: 19.h);
  static final bottom24_top16 = EdgeInsets.only(bottom: 24.h, top: 16.h);
  static final left20_right12 = EdgeInsets.only(left: 20.w, right: 12.w);
  static final bottom12_top20 = EdgeInsets.only(top: 20.h, bottom: 12.h);
  static final horiz6_vertic3 =
      EdgeInsets.symmetric(horizontal: 6.w, vertical: 3.h);
}

class AppBorderRadiuses {
  static final border_2 = BorderRadius.circular(2);
  static final border_4 = BorderRadius.circular(4);
  static final border_6 = BorderRadius.circular(6);
  static final border_8 = BorderRadius.circular(8.r);
  static final border_10 = BorderRadius.circular(10.r);
  static final border_50 = BorderRadius.circular(50.r);
  static final border_12 = BorderRadius.circular(12.r);

  static final top_6 = BorderRadius.vertical(top: Radius.circular(6.r));
  static final defBorder =
      Border.all(width: 1.5.sp, color: AppColors.lightGrey);
  static final defBorderDark =
      Border.all(width: 1.5.sp, color: AppColors.darkGrey);
  static final transparentBorder =
      Border.all(width: 1.5.sp, color: Colors.transparent);
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
  static Color shimmerBaseColor = const Color.fromRGBO(0, 0, 0, 0.3);
  static Color shimmerHighlightColor = const Color(0xFF9B9B9B).withOpacity(.2);
  static Color shimmerBodyColor = const Color.fromRGBO(0, 0, 0, 0.3);
  //!
  static const appOrange = Color(0xFFFF6600);
  static const mainOrange = Color.fromRGBO(255, 102, 0, 1);
  static const darkBlue = Color.fromRGBO(11, 21, 39, 1);
  static const shadowColor = Color.fromRGBO(0, 01, 0, 0.15);
  static const lightGrey = Color.fromRGBO(241, 244, 246, 1);
  static const mediumGrey = Color.fromRGBO(223, 229, 236, 1);
  static const darkGrey = Color.fromRGBO(148, 163, 184, 1);

  //!
  static final appBarShadow = [
    BoxShadow(blurRadius: 2.sp, color: shadowColor, offset: Offset(0.0, 2.sp))
  ];
  static final navBarShaow = [
    BoxShadow(blurRadius: 2.sp, color: shadowColor, offset: Offset(0.0, -2.sp))
  ];
}

class AppDurations {
  static Duration duration_250ms = const Duration(milliseconds: 250);
  static Duration duration_150ms = const Duration(milliseconds: 150);
  static Duration duration_50ms = const Duration(milliseconds: 50);
  static Duration duration_500ms = const Duration(milliseconds: 500);
  static Duration duration_1500ms = const Duration(milliseconds: 1500);
}

class AssetsPath {
  static const macBook =
      'https://images.unsplash.com/photo-1517336714731-489689fd1ca8?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1026&q=80';
  static const exampleImage1 =
      'https://cdn.pixabay.com/photo/2020/05/25/17/21/link-5219567_1280.jpg';
  static const exampleImage2 =
      'https://cdn.pixabay.com/photo/2020/05/31/16/53/bookmarks-5243253_640.jpg';

  static const splashBackground = 'assets/images/splash.svg';
  static const splashBack = 'assets/images/splash_back.png';
  //! icons
  static const logoIcon = 'assets/icons/logo.svg';
  static const searchIcon = 'assets/icons/search.svg';
  static const deleteIcon = 'assets/icons/delete.svg';
  static const filterIcon = 'assets/icons/filter.svg';
  static const bellIcon = 'assets/icons/bell.svg';
  static const crossIcon = 'assets/icons/cross.svg';
  static const roundedCrossIcon = 'assets/icons/roundedCross.svg';
  static const navBarIcons = [
    'assets/icons/navBarIcons/home.svg',
    'assets/icons/navBarIcons/video.svg',
    'assets/icons/navBarIcons/category.svg',
    'assets/icons/navBarIcons/cart.svg',
    'assets/icons/navBarIcons/profile.svg',
  ];
  static const langIcon = 'assets/icons/profileIcons/lang.svg';
  static const favorIcon = 'assets/icons/profileIcons/favor.svg';
  static const locationIcon = 'assets/icons/profileIcons/location.svg';
  static const profileIcon = 'assets/icons/profileIcons/profile.svg';
  static const phoneIcon = 'assets/icons/profileIcons/phone.svg';
  static const ordersIcon = 'assets/icons/profileIcons/orders.svg';
  static const forvardIcon = 'assets/icons/forvard.svg';
  //!
}

class EndPoints {
  static const baseUrl = 'http://216.250.9.74/';
  static const logIn = 'api/v1/auth/login';
  static const register = 'api/v1/auth/register';
  static const authMe = 'api/v1/auth/me';
  static const logOut = 'api/v1/auth/logout';
}
