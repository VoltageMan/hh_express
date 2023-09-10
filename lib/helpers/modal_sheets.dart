import 'package:flutter/material.dart';
import 'package:hh_express/features/favors/view/favors_body.dart';
import 'package:hh_express/features/filter/components/sheet_body.dart';
import 'package:hh_express/features/orders/view/modalSheet/orders_sheet_body.dart';
import 'package:hh_express/features/productDetails/view/modalSheet/product_modal_body.dart';
import 'package:hh_express/features/profile/view/sheets/change_lang_sheet.dart';
import 'package:hh_express/features/profile/view/sheets/change_user_name.dart';
import 'package:hh_express/features/profile/view/sheets/choose_welayat_sheet.dart';
import 'package:hh_express/helpers/extentions.dart';
import 'package:hh_express/helpers/routes.dart';

class ModelBottomSheetHelper {
  static bool _sheetShown = false;
  static BuildContext? _currentContext;

  /// this fuck pops ModalSheet if its shown and return value for WillPopScoup Widget
  static bool doPop() {
    if (_sheetShown) {
      Navigator.pop(_currentContext!);
      return false;
    }
    return true;
  }

  static Future<void> showFilterSheet() async {
    _sheetShown = true;
    await showModalBottomSheet(
      context: appRouter.currentContext,
      useRootNavigator: true,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10), topRight: Radius.circular(10)),
      ),
      builder: (context) {
        _currentContext = context;
        return const FilterSheetBody();
      },
    );
    _sheetShown = false;
  }

  static Future<void> showLangSheet() async {
    _sheetShown = true;
    await showModalBottomSheet(
      context: appRouter.currentContext,
      useRootNavigator: true,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      builder: (context) {
        _currentContext = context;
        return const ChangeLangSheet();
      },
    );

    _sheetShown = false;
  }

  static Future<void> showBuyProd() async {
    _sheetShown = true;
    await showModalBottomSheet(
      context: appRouter.currentContext,
      useRootNavigator: true,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10), topRight: Radius.circular(10)),
      ),
      builder: (context) {
        _currentContext = context;
        return const BuyProdSheetBody();
      },
    );

    _sheetShown = false;
  }

  static Future<void> showProfileSheets(int index) async {
    if (index == 1) return;

    _sheetShown = true;
    const List<Widget> _profileSheets = [
      ChangeUserNameSheet(),
      SizedBox(),
      OrdersSheetBody(),
      FavorsBody(),
      ChooseWelayatSheet(),
      ChangeLangSheet(),
    ];
    await showModalBottomSheet(
      context: appRouter.currentContext,
      useRootNavigator: true,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10), topRight: Radius.circular(10)),
      ),
      builder: (context) {
        _currentContext = context;
        return _profileSheets[index];
      },
    );
    _sheetShown = false;
  }
}
