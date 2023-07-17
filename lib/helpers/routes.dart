import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:hh_express/features/auth/view/auth_screen.dart';
import 'package:hh_express/features/categories/view/details/category_details.dart';
import 'package:hh_express/features/mainScreen/view/main_screen.dart';
import 'package:hh_express/features/notifications/view/notification_screen.dart';
import 'package:hh_express/features/orders/view/details/orders_screen.dart';
import 'package:hh_express/features/productDetails/view/screen.dart';

enum EnumNavRoutes { home, video, category, cart, profile }

class AppRoutes {
  static List<String> navBar = [
    '/${EnumNavRoutes.home.name}',
    '/${EnumNavRoutes.video.name}',
    '/${EnumNavRoutes.category.name}',
    '/${EnumNavRoutes.cart.name}',
    '/${EnumNavRoutes.profile.name}',
  ];
  static const filterDetails = '/filterDetails';
  static const auth = '/auth';
  static const orderDetails = '/orderDetails';
  static const categoryDetails = '/categoryDetails';
  static const notifications = '/notifications';
  static const prodDetails = '/prodDetails';
}

final appRouter = GoRouter(
  initialLocation: AppRoutes.navBar.first,
  routes: [
    ShellRoute(
      pageBuilder: (mainContext, mainState, mainChild) {
        return CustomTransitionPage(
          child: const SizedBox(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            final index = mainState.extra as int?;
            return MainScreen(
              index: index,
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
                child: MainScreen.bodies[index],
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
      path: AppRoutes.auth,
      builder: (context, state) {
        return const AuthScreen();
      },
    ),
    GoRoute(
      path: AppRoutes.orderDetails,
      builder: (context, state) {
        return const OrderDetailsScreen();
      },
    ),
    GoRoute(
      path: AppRoutes.categoryDetails,
      builder: (context, state) {
        return const CategoryDetails();
      },
    ),
    GoRoute(
      path: AppRoutes.notifications,
      builder: (context, state) {
        return const NotificationScreen();
      },
    ),
    GoRoute(
      path: AppRoutes.prodDetails,
      builder: (context, state) {
        return const ProductDetails();
      },
    ),
    // GoRoute(
    //   path: AppRoutes.filterDetails,
    //   name: AppRoutes.filterDetails.replaceAll('/', ''),
    //   builder: (context, state) {
    //     return const FilterDetailsScreen();
    //   },
    // )
  ],
);
