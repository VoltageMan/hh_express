import 'package:flutter/material.dart';
import 'package:hh_express/app/app.dart';
import 'package:hh_express/app/setup.dart';

void main() {
  configureDependencies(getIt);
  runApp(const MyApp());
}
