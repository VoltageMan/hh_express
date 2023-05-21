import 'package:flutter/material.dart';
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
