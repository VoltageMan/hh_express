import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:hh_express/features/home/view/home_screen.dart';

class AppRoutes {
  static const home = '/home';
}

final appRouter = GoRouter(
  routes: [
    ShellRoute(
      routes: [
        GoRoute(
          path: AppRoutes.home,
          builder: (context, state) {
            return HomeScreen();
          },
        ),
      ],
      builder: (context, state, child) {
        return child;
      },
    )
  ],
);

final locale = ValueNotifier<String>('en');
