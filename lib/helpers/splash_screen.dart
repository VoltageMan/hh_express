import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hh_express/features/categories/bloc/category_bloc.dart';
import 'package:hh_express/helpers/extentions.dart';
import 'package:hh_express/helpers/routes.dart';
import 'package:hh_express/helpers/spacers.dart';
import 'package:hh_express/settings/consts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(systemNavigationBarColor: AppColors.appOrange));
    context.read<CategoryBloc>()..add(InitCategories());
  
    Future.delayed(const Duration(seconds: 1))
        .then((value) => appRouter.go(AppRoutes.mainScreen));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.theme.textTheme;

    return SafeArea(
      top: false,
      child: Scaffold(
        body: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.appOrange,
            image: DecorationImage(
              image: AssetImage(
                AssetsPath.splashBackPng,
              ),
              fit: BoxFit.cover,
            ),
          ),
          padding: AppPaddings.vertic_28,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 258.h),
              SvgPicture.asset(
                AssetsPath.logoIcon,
                width: 110,
                height: 110,
              ),
              AppSpacing.vertical_30,
              AppSpacing.vertical_7,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Yuan',
                    style: theme.displayLarge!
                        .copyWith(fontSize: 26.sp, fontWeight: FontWeight.bold),
                  ),
                  AppSpacing.horizontal_12,
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: AppBorderRadiuses.border_6,
                        color: AppColors.white),
                    padding:
                        EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                    child: Text(
                      'shop',
                      style: theme.displayLarge!.copyWith(
                          color: AppColors.appOrange,
                          fontSize: 26.sp,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
              Spacer(),
              Text(
                'express delivery',
                style: theme.displayMedium!.copyWith(
                  fontSize: 16.sp,
                ),
              ),
              // AnimatedTextKit(
              //   totalRepeatCount: 10,
              //   animatedTexts: [
              //     FadeAnimatedText(
              //       'express delivery',
              //       textStyle: theme.displayMedium,
              //     ),
              //   ],
              // )
            ],
          ),
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
