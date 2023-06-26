import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'dart:developer' as devtools show log;

import 'package:hh_express/helpers/routes.dart';

extension Log on Object? {
  void log({StackTrace? stackTrace}) => devtools.log(
        toString(),
        stackTrace: stackTrace,
      );
}

extension SliverExtentions on Widget {
  SliverToBoxAdapter toSliver() => SliverToBoxAdapter(child: this);
  void logCon() async {
    final myKey = key as GlobalKey;
    myKey.currentContext!.size!.height.log();
  }
}

extension WillScope on Scaffold {
  WillPopScope toWillGoProfile(int index) => WillPopScope(
        child: this,
        onWillPop: () async {
          appRouter.currentContext
              .go(AppRoutes.navBar[index], extra: index != 0 ? index : 0);
          return false;
        },
      );
}

extension L10n on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this)!;
  ThemeData get theme => Theme.of(this);
  Size getSize() {
    final widget = findRenderObject() as RenderBox;

    return widget.size..log();
  }
}

extension FromStringtoInt on String {
  int get toInt => int.parse(this);
}

extension MaterialResolve on Color {
  MaterialStateColor get colorSolve =>
      MaterialStateColor.resolveWith((states) => this);
}

extension ToSliverBox on Widget {
  SliverToBoxAdapter get toSliverBox => SliverToBoxAdapter(child: this);
  SingleChildScrollView get toSingleChildScrollView => SingleChildScrollView(
        child: this,
      );
}

extension GetNavContext on GoRouter {
  BuildContext get currentContext =>
      routerDelegate.navigatorKey.currentContext!;
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}
