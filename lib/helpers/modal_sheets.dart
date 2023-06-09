import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hh_express/features/filter/components/sheet_body.dart';
import 'package:hh_express/helpers/extentions.dart';
import 'package:hh_express/settings/consts.dart';

class ModelBottomSheetHelper {
  static bool sheetShown = false;
  static BuildContext? currentContext;
  static Future<void> showFilterSheet(BuildContext context) async {
    sheetShown = true;
    await showModalBottomSheet(
      context: context,
      useRootNavigator: true,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: AppBorderRadiuses.border_10,
      ),
      builder: (context) {
        currentContext = context;
        return const FilterSheetBody();
      },
    );
    sheetShown = false;
  }
}
