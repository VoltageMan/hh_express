import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hh_express/data/local/secured_storage.dart';
import 'package:hh_express/features/cart/view/widet.dart';
import 'package:hh_express/features/home/bloc/home_bloc.dart';
import 'package:hh_express/helpers/extentions.dart';
import 'package:hh_express/helpers/routes.dart';
import 'package:hh_express/helpers/spacers.dart';
import 'package:hh_express/helpers/splash_screen.dart';
import 'package:hh_express/settings/globals.dart';
import 'package:hh_express/settings/theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool waited = false;
  Future<int> waiting() async {
    if (waited) return 0;
    await LocalStorage.init();
    waited = true;
    setState(() {});
    return 666;
  }

  @override
  Widget build(BuildContext context) {
    waiting();
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomeBloc(),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 800),
        builder: (context, child) {
          return ValueListenableBuilder(
            valueListenable: locale,
            builder: (context, locale, child) {
              locale.log();
              return MaterialApp.router(
                supportedLocales: AppLocalizations.supportedLocales,
                routerConfig: appRouter,
                locale: Locale(locale),
                theme: AppTheme.lightTheme,
                debugShowCheckedModeBanner: false,
                localizationsDelegates: AppLocalizations.localizationsDelegates,
                builder: (context, child) {
                  AppSpacing.setTopPad(context);
                  return waited
                      ? Navigator(
                          onGenerateRoute: (settings) => MaterialPageRoute(
                            builder: (context) {
                              return child!;
                            },
                          ),
                        )
                      : const SplashScreen();
                },
              );
            },
          );
        },
      ),
    );
  }
}

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.custom(
        childrenDelegate: SliverChildListDelegate(
          [
            for (int i = 0; i < 99; i++) const CartWidget(),
          ],
        ),
      ),
    );
  }
}

void some() {}
