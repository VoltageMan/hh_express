import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'dart:developer' as devtools show log;

extension Log on Object? {
  void log({StackTrace? stackTrace, String? message}) {
    devtools.log(
      toString(),
      stackTrace: stackTrace,
    );
    if (message == 'Throww') {
      throw Error.safeToString('Load More With NUll Prods Error');
    }
  }
}

extension SliverExtentions on Widget {
  SliverToBoxAdapter toSliver() => SliverToBoxAdapter(child: this);
  void logCon(String name) async {
    '${DateTime.now()} $name'.log();
  }
}

extension L10n on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this)!;
  ThemeData get theme => Theme.of(this);
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

typedef void OnWidgetSizeChange(Size size);

class MeasureSizeRenderObject extends RenderProxyBox {
  Size? oldSize;
  OnWidgetSizeChange onChange;

  MeasureSizeRenderObject(this.onChange);

  @override
  void performLayout() {
    super.performLayout();

    Size newSize = child!.size;
    if (oldSize == newSize) return;

    oldSize = newSize;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      onChange(newSize);
    });
  }
}

class MeasureSize extends SingleChildRenderObjectWidget {
  final OnWidgetSizeChange onChange;

  const MeasureSize({
    Key? key,
    required this.onChange,
    required Widget child,
  }) : super(key: key, child: child);

  @override
  RenderObject createRenderObject(BuildContext context) {
    return MeasureSizeRenderObject(onChange);
  }

  @override
  void updateRenderObject(
      BuildContext context, covariant MeasureSizeRenderObject renderObject) {
    renderObject.onChange = onChange;
  }
}
