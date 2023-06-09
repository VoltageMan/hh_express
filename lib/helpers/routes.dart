import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:hh_express/features/filter/details/view/filter_details.dart';
import 'package:hh_express/features/home/view/some_screen.dart';
import 'package:hh_express/features/mainScreen/view/main_screen.dart';
import 'package:hh_express/settings/consts.dart';

class AppRoutes {
  static const List navBar = [
    '/home',
    '/video',
    '/category',
    '/cart',
    '/profile',
  ];
  static const filterDetails = '/filterDetails';
}




final appRouter = GoRouter(
  initialLocation: AppRoutes.navBar.first,
  routes: [
    ShellRoute(
      pageBuilder: (mainContext, mainState, mainChild) {
        return CustomTransitionPage(
          child: const SizedBox(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            final title = mainState.extra as String?;
            return MainScreen(
              title: title,
              body: mainChild,
            );
          },
        );
      },
      routes: List.generate(
        AppRoutes.navBar.length,
        (index) {
          final path = AppRoutes.navBar[index] as String;
          return GoRoute(
            name: path.replaceAll('/', ''),
            path: path,
            pageBuilder: (context, state) {
              return CustomTransitionPage(
                child: index == 0
                    ? MainScreen.bodies[index]
                    : SomeScreen(title: AppTitles.navBarTitles![index]),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  return child;
                },
              );
            },
          );
        },
      ),
    ),
    GoRoute(
      path: AppRoutes.filterDetails,
      name: AppRoutes.filterDetails.replaceAll('/', ''),
      builder: (context, state) {
        return const FilterDetailsScreen();
      },
    )
  ],
);
