import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'dart:developer' as devtools show log;

extension Log on Object {
  void log({StackTrace? stackTrace}) => devtools.log(
        toString(),
        stackTrace: stackTrace,
      );
}

extension SliverExtentions on Widget {
  SliverToBoxAdapter toSliver() => SliverToBoxAdapter(
        child: this,
      );
}

extension WillScope on Scaffold {
  WillPopScope toWillScope() => WillPopScope(
        child: this,
        onWillPop: () async {
          return false;
        },
      );
}

extension L10n on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this)!;
}

extension FromStringtoInt on String {
  int get toInt => int.parse(this);
}

extension MaterialResolve on Color {
  MaterialStateColor get colorSolve =>
      MaterialStateColor.resolveWith((states) => this);
}
// extension FromMaterialStateProperty on MaterialStateProperty{
//   dynamic get resolve => this.resolve);
// }

extension ToSliverBox on Widget {
  SliverToBoxAdapter get toSliverBox => SliverToBoxAdapter(child: this);
}
