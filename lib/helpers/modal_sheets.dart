import 'package:flutter/material.dart';
import 'package:hh_express/features/favors/view/favors_body.dart';
import 'package:hh_express/features/filter/components/sheet_body.dart';
import 'package:hh_express/features/orders/view/modalSheet/orders_sheet_body.dart';
import 'package:hh_express/features/profile/view/sheets/change_lang_sheet.dart';
import 'package:hh_express/features/profile/view/sheets/change_user_name.dart';
import 'package:hh_express/features/profile/view/sheets/choose_welayat_sheet.dart';
import 'package:hh_express/helpers/extentions.dart';
import 'package:hh_express/helpers/routes.dart';
import 'package:hh_express/settings/consts.dart';

class ModelBottomSheetHelper {
  static bool sheetShown = false;
  static BuildContext? currentContext;
  static Future<void> showFilterSheet() async {
    sheetShown = true;
    await showModalBottomSheet(
      context: appRouter.currentContext,
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

  static Future<void> showLangSheet() async {
    sheetShown = true;
    await showModalBottomSheet(
      context: appRouter.currentContext,
      useRootNavigator: true,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: AppBorderRadiuses.border_10,
      ),
      builder: (context) {
        currentContext = context;
        return const ChangeLangSheet();
      },
    );

    sheetShown = false;
  }

  static const List<Widget> _profileSheets = [
    ChangeUserNameSheet(),
    SizedBox(),
    OrdersSheetBody(),
    FavorsBody(),
    ChooseWelayatSheet(),
    ChangeLangSheet(),
  ];

  static Future<void> showProfileSheets(int index) async {
    if (index == 1) return;
    sheetShown = true;
    await showModalBottomSheet(
      context: appRouter.routerDelegate.navigatorKey.currentContext!,
      useRootNavigator: true,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: AppBorderRadiuses.border_10,
      ),
      builder: (context) {
        currentContext = context;
        return _profileSheets[index];
      },
    );
    sheetShown = false;
  }
}
