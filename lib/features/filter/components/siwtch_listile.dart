import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hh_express/settings/consts.dart';
import 'package:hh_express/settings/theme.dart';

class FilterSwithListTile extends StatefulWidget {
  const FilterSwithListTile({super.key});

  @override
  State<FilterSwithListTile> createState() => _FilterSwithListTileState();
}

class _FilterSwithListTileState extends State<FilterSwithListTile> {
  bool switchVal = true;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(
        'Taze',
        style: AppTheme.titleMedium16(context),
      ),
      trailing: CupertinoSwitch(
        value: switchVal,
        activeColor: AppColors.mainOrange,
        trackColor: AppColors.darkGrey,
        onChanged: (value) {
          switchVal = value;
          setState(() {});
        },
      ),
    );
  }
}
