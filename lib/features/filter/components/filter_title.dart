import 'package:flutter/material.dart';
import 'package:hh_express/settings/consts.dart';
import 'package:hh_express/settings/theme.dart';

class FilterTitle extends StatelessWidget {
  const FilterTitle({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    final buttonTheme =
        Theme.of(context).textButtonTheme.style as MyButtonStyle;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: AppTheme.titleMedium16(context),
        ),
        TextButton(
          onPressed: () {},
          style: buttonTheme,
          child: Text(
            AppTitles.all!,
            style: buttonTheme.myTextStyle,
          ),
        )
      ],
    );
  }
}
