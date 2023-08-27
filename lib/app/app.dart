import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hh_express/app/test_screen.dart';
import 'package:hh_express/data/local/secured_storage.dart';
import 'package:hh_express/features/auth/bloc/auth_bloc.dart';
import 'package:hh_express/features/categories/bloc/category_bloc.dart';
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

  final myStream = strr();


  @override
  Widget build(BuildContext context) {
    // waiting();
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => HomeBloc()),
        BlocProvider(create: (context) => AuthBloc()),
        BlocProvider(create: (context) => CategoryBloc()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 800),
        builder: (context, child) {
          return ValueListenableBuilder(
            valueListenable: locale,
            builder: (context, locale, child) {
              locale.log();
              return MaterialApp.router(
                title: 'Yuan Shop',
                supportedLocales: AppLocalizations.supportedLocales,
                routerConfig: appRouter,
                locale: Locale(locale),
                theme: AppTheme.lightTheme,
                debugShowCheckedModeBanner: false,
                localizationsDelegates: AppLocalizations.localizationsDelegates,
                builder: (context, child) {
                  AppSpacing.setTopPad(context);
                  // return waited
                  // return TestScreen();
                  return Navigator(
                    onGenerateRoute: (settings) => MaterialPageRoute(
                      builder: (context) {
                        return child!;
                      },
                    ),
                  );

                  // : GestureDetector(
                  //     onTap: () {
                  //       setState(() {
                  //         waited = true;
                  //       });
                  //     },
                  //     child: const SplashScreen(),
                  //   );
                },
              );
            },
          );
        },
      ),
    );
  }
}

Stream<String> strr() {
  final stream = Stream.periodic(
    Duration(seconds: 3),
    (period) {
      return '';
    },
  );
  return stream;
}
