import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hh_express/app/app.dart';
import 'package:hh_express/app/setup.dart';
import 'package:hh_express/settings/consts.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  configureDependencies(getIt);
  final mySystemTheme = SystemUiOverlayStyle.dark.copyWith(
      systemNavigationBarColor: AppColors.white,
      systemNavigationBarIconBrightness: Brightness.dark);
  SystemChrome.setSystemUIOverlayStyle(mySystemTheme);
  runApp(const MyApp());
}
