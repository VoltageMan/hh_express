import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:hh_express/features/auth/view/auth_screen.dart' as auth;
import 'package:hh_express/features/products_by_category/view/products_by_category.dart';
import 'package:hh_express/features/mainScreen/view/main_screen.dart';
import 'package:hh_express/features/notifications/view/notification_screen.dart';
import 'package:hh_express/features/orders/view/details/orders_screen.dart';
import 'package:hh_express/features/product_details/view/product_details.dart';
import 'package:hh_express/features/video/view/details/video_details.dart';
import 'package:hh_express/helpers/splash_screen.dart';
import 'package:hh_express/models/categories/category_model.dart';

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
  static const splashScreen = '/splashScreen';
  static const filterDetails = '/filterDetails';
  static const auth = '/auth';
  static const orderDetails = '/orderDetails';
  static const productByCategory = '/productByCategory';
  static const notifications = '/notifications';
  static const prodDetails = '/prodDetails';
  static const videoDetails = '/videoDetails';
}

final appRouter = GoRouter(
  initialLocation: AppRoutes.splashScreen,
  routes: [
    GoRoute(
      path: AppRoutes.mainScreen,
      builder: (context, state) {
        return MainScreen();
      },
    ),
    GoRoute(
      path: AppRoutes.splashScreen,
      builder: (context, state) {
        return SplashScreen();
      },
    ),
    GoRoute(
      path: AppRoutes.auth,
      pageBuilder: (context, state) {
        final extra = state.extra as bool?;
        return CustomTransitionPage(
          child: auth.AuthScreen(
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
      path: AppRoutes.productByCategory,
      builder: (context, state) {
        return ProductsByCategory(
          category: state.extra as CategoryModel,
        );
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
      // name: AppRoutes.prodDetails.to,
      // builder: (context, state) {
      //   final id = state.extra as int;
      //   return ProductDetails(id: id);
      // },
      pageBuilder: (context, state) {
        final id = state.extra as int;
        return CupertinoPage(
          child: ProductDetails(id: id),
        );
      },
    ),
    GoRoute(
      path: AppRoutes.videoDetails,
      builder: (context, state) {
        return const VideoDetails();
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
