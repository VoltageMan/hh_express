import 'package:flutter/material.dart';
import 'package:hh_express/features/favors/view/favors_body.dart';
import 'package:hh_express/features/filter/components/sheet_body.dart';
import 'package:hh_express/features/orders/view/modalSheet/orders_sheet_body.dart';
import 'package:hh_express/features/productDetails/view/modalSheet/body.dart';
import 'package:hh_express/features/profile/view/sheets/change_lang_sheet.dart';
import 'package:hh_express/features/profile/view/sheets/change_user_name.dart';
import 'package:hh_express/features/profile/view/sheets/choose_welayat_sheet.dart';
import 'package:hh_express/helpers/extentions.dart';
import 'package:hh_express/helpers/routes.dart';

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
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10), topRight: Radius.circular(10)),
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
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10), topRight: Radius.circular(10)),
      ),
      builder: (context) {
        currentContext = context;
        return const ChangeLangSheet();
      },
    );

    sheetShown = false;
  }

  static Future<void> showBuyProd() async {
    sheetShown = true;
    await showModalBottomSheet(
      context: appRouter.currentContext,
      useRootNavigator: true,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10), topRight: Radius.circular(10)),
      ),
      builder: (context) {
        currentContext = context;
        return const BuyProdSheetBody();
      },
    );

    sheetShown = false;
  }

  static Future<void> showProfileSheets(int index) async {
    if (index == 1) return;

    sheetShown = true;
    const List<Widget> _profileSheets = [
      ChangeUserNameSheet(),
      SizedBox(),
      OrdersSheetBody(),
      FavorsBody(),
      ChooseWelayatSheet(),
      ChangeLangSheet(),
    ];
    await showModalBottomSheet(
      context: appRouter.routerDelegate.navigatorKey.currentContext!,
      useRootNavigator: true,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10), topRight: Radius.circular(10)),
      ),
      builder: (context) {
        currentContext = context;
        return _profileSheets[index];
      },
    );
    sheetShown = false;
  }
}
