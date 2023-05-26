import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:hh_express/settings/consts.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
              style: Theme.of(context).textTheme.displayLarge,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                'express',
                style: Theme.of(context).textTheme.displayMedium,
              ),
            )
          ],
        ),
      ),
    );
  }
}
