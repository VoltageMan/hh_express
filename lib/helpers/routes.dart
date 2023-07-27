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
  // static List<String> navBar = [
  //   '/${EnumNavRoutes.home.name}',
  //   '/${EnumNavRoutes.video.name}',
  //   '/${EnumNavRoutes.category.name}',
  //   '/${EnumNavRoutes.cart.name}',
  //   '/${EnumNavRoutes.profile.name}',
  // ];
  static const mainScreen = '/mainScreen';
  static const filterDetails = '/filterDetails';
  static const auth = '/auth';
  static const orderDetails = '/orderDetails';
  static const categoryDetails = '/categoryDetails';
  static const notifications = '/notifications';
  static const prodDetails = '/prodDetails';
}

final appRouter = GoRouter(
  initialLocation: AppRoutes.mainScreen,
  routes: [
    GoRoute(
      path: AppRoutes.mainScreen,
      builder: (context, state) {
        return MainScreen();
      },
    ),
    GoRoute(
      path: AppRoutes.auth,
      pageBuilder: (context, state) {
        final extra = state.extra as bool?;
        return CustomTransitionPage(
          child: AuthScreen(
            forSingUp: extra ?? true,
          ),
          transitionsBuilder: (context, animation, secondaryAnimation, child) =>
              CupertinoPageTransition(
            linearTransition: true,
            primaryRouteAnimation: animation,
            secondaryRouteAnimation: secondaryAnimation,
            child: child,
          ),
        );
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
