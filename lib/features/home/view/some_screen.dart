import 'package:flutter/material.dart';
import 'package:hh_express/settings/consts.dart';

class SomeScreen extends StatelessWidget {
  const SomeScreen({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: AppColors.white,
      child: Center(
        child: Text(
          title,
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
    );
  }
}
