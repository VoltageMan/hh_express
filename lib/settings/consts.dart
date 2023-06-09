import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hh_express/helpers/extentions.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AppPaddings {
  static EdgeInsets left_12 = EdgeInsets.only(left: 12.w);
  static EdgeInsets left_16 = EdgeInsets.only(left: 16.w);
  static EdgeInsets left_24 = EdgeInsets.only(left: 24.w);
  static EdgeInsets left_28 = EdgeInsets.only(left: 28.w);

  static EdgeInsets left_6 = EdgeInsets.only(left: 6.w);

  static EdgeInsets right_12 = EdgeInsets.only(right: 12.w);
  static EdgeInsets right_10 = EdgeInsets.only(right: 10.w);
  static EdgeInsets right_16 = EdgeInsets.only(right: 16.w);
  static EdgeInsets right_24 = EdgeInsets.only(right: 24.w);
  static EdgeInsets right_28 = EdgeInsets.only(right: 28.w);
  static EdgeInsets right_6 = EdgeInsets.only(right: 6.w);

  static EdgeInsets top_12 = EdgeInsets.only(top: 12.w);
  static EdgeInsets top_16 = EdgeInsets.only(top: 16.w);
  static EdgeInsets top_24 = EdgeInsets.only(top: 24.w);
  static EdgeInsets top_28 = EdgeInsets.only(top: 28.w);
  static EdgeInsets top_6 = EdgeInsets.only(top: 6.w);

  static EdgeInsets bottom_12 = EdgeInsets.only(bottom: 12.w);
  static EdgeInsets bottom_10 = EdgeInsets.only(bottom: 10.w);
  static EdgeInsets bottom_16 = EdgeInsets.only(bottom: 16.w);
  static EdgeInsets bottom_24 = EdgeInsets.only(bottom: 24.w);
  static EdgeInsets bottom_28 = EdgeInsets.only(bottom: 28.w);
  static EdgeInsets bottom_6 = EdgeInsets.only(bottom: 6.w);

  static EdgeInsets all_12 = EdgeInsets.all(12.sp);
  static EdgeInsets all_16 = EdgeInsets.all(16.sp);
  static EdgeInsets all_24 = EdgeInsets.all(24.sp);
  static EdgeInsets all_28 = EdgeInsets.all(28.sp);
  static final all_2 = EdgeInsets.all(2.sp);
  static EdgeInsets all_6 = EdgeInsets.all(6.sp);

  static EdgeInsets horiz_12 = EdgeInsets.symmetric(horizontal: 12.w);
  static EdgeInsets horiz_16 = EdgeInsets.symmetric(horizontal: 16.w);
  static EdgeInsets horiz_24 = EdgeInsets.symmetric(horizontal: 24.w);
  static EdgeInsets horiz_28 = EdgeInsets.symmetric(horizontal: 28.h);
  static EdgeInsets horiz_6 = EdgeInsets.symmetric(horizontal: 6.w);

  static final vertic_10 = EdgeInsets.symmetric(vertical: 10.h);
  static EdgeInsets vertic_12 = EdgeInsets.symmetric(vertical: 12.h);
  static EdgeInsets vertic_16 = EdgeInsets.symmetric(vertical: 16.h);
  static EdgeInsets vertic_24 = EdgeInsets.symmetric(vertical: 24.h);
  static EdgeInsets vertic_28 = EdgeInsets.symmetric(vertical: 28.h);
  static EdgeInsets vertic_6 = EdgeInsets.symmetric(vertical: 6.h);

  //!speciffics
  static final horiz16_vertic12 = horiz_16.copyWith(bottom: 12.h, top: 12.h);
  static final horiz10_vertic5 =
      EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h);
  static final horiz56_vertic70 =
      EdgeInsets.symmetric(horizontal: 56.w, vertical: 70.h);
  static final horiz12_vertic17 =
      EdgeInsets.symmetric(horizontal: 12.w, vertical: 17.h);
}

class AppBorderRadiuses {
  static final border_2 = BorderRadius.circular(2.r);
  static final border_4 = BorderRadius.circular(4.r);
  static final border_6 = BorderRadius.circular(6.r);
  static final border_8 = BorderRadius.circular(8.r);
  static final border_10 = BorderRadius.circular(10.r);
  static final border_12 = BorderRadius.circular(12.r);
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
  static Duration duration_500ms = const Duration(milliseconds: 500);
  static Duration duration_1500ms = const Duration(milliseconds: 1500);
}

class AssetsPath {
  static const splashBackground = 'assets/images/splash.svg';
  //! icons
  static const searchIcon = 'assets/icons/search.svg';
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
}

class AppTitles {
  static void init(BuildContext context) {
    final l10n = context.l10n;
    navBarTitles = [
      l10n.home,
      l10n.video,
      l10n.category,
      l10n.cart,
      l10n.profile,
    ];
    exit = l10n.exit;
    cancle = l10n.cancle;
    confirmExit = l10n.exitConfirm;
    searchHint = l10n.searchHint;
    filter = l10n.filter;
    removeAll = l10n.removeAll;
    all = l10n.all;
    register = l10n.registration;
    code = l10n.code;
    name = l10n.name;
    phoneNum = l10n.phoneNumber;
    registerTitle = l10n.resterTitle;
  }

  static List<String>? navBarTitles;
  static String? exit;
  static String? cancle;
  static String? confirmExit;
  static String? searchHint;
  static String? filter;
  static String? removeAll;
  static String? all;
  static String? register;
  static String? code;
  static String? name;
  static String? phoneNum;
  static String? registerTitle;
}
