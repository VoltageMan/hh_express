import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hh_express/settings/consts.dart';
import 'package:hh_express/settings/theme.dart';

/// add Bloc
class FilterSwithListTile extends StatelessWidget {
  const FilterSwithListTile({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(
        title,
        style: AppTheme.titleMedium16(context),
      ),
      trailing: CupertinoSwitch(
        value: true,
        activeColor: AppColors.mainOrange,
        trackColor: AppColors.darkGrey,
        onChanged: (value) {},
      ),
    );
  }
}
