import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hh_express/helpers/extentions.dart';
import 'package:hh_express/settings/consts.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme.textTheme;
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: Svg(
              AssetsPath.splashBackground,
            ),
            fit: BoxFit.cover,
          ),
          color: AppColors.mainOrange,
        ),
        padding: AppPaddings.vertic_28,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Text(
              'hh',
              style: theme.displayLarge,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                'express',
                style: theme.displayMedium,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SecondSplash extends StatelessWidget {
  const SecondSplash({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme.textTheme;
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: Svg(
              AssetsPath.splashBackground,
            ),
            fit: BoxFit.cover,
          ),
          color: AppColors.mainOrange,
        ),
        padding: AppPaddings.vertic_28,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Align(
              alignment: AppPaddings.secondSplashAlign,
              child: Text(
                'made in',
                textAlign: TextAlign.center,
                style: theme.displayMedium!.copyWith(
                  fontFamily: GoogleFonts.nokora().fontFamily,
                ),
              ),
            ),
            Text(
              'China',
              style: theme.displayLarge!.copyWith(
                fontFamily: GoogleFonts.nokora().fontFamily,
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                'express',
                style: theme.displayMedium,
              ),
            )
          ],
        ),
      ),
    );
  }
}
