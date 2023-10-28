import 'package:flutter/material.dart';
import 'package:flutter_keyboard_size/flutter_keyboard_size.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hh_express/features/address/addres_read_sheet.dart';
import 'package:hh_express/features/address/cubit/address_cubit.dart';
import 'package:hh_express/features/address/view/address_field.dart';
import 'package:hh_express/features/favors/view/favors_body.dart';
import 'package:hh_express/features/filter/components/sheet_body.dart';
import 'package:hh_express/features/orders/view/modalSheet/orders_sheet_body.dart';
import 'package:hh_express/features/product_details/view/modalSheet/product_modal_body.dart';
import 'package:hh_express/features/profile/view/sheets/change_lang_sheet.dart';
import 'package:hh_express/features/profile/view/sheets/change_user_name.dart';
import 'package:hh_express/features/profile/view/sheets/choose_welayat_sheet.dart';
import 'package:hh_express/helpers/extentions.dart';
import 'package:hh_express/helpers/routes.dart';
import 'package:hh_express/models/addres/address_model.dart';

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
          topLeft: Radius.circular(10.r),
          topRight: Radius.circular(10.r),
        ),
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
          topLeft: Radius.circular(10.r),
          topRight: Radius.circular(10.r),
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
    final l10n = appRouter.currentContext.l10n;
    _sheetShown = true;
    List<Widget> _profileSheets = [
      ChangeUserNameSheet(),
      SizedBox(),
      OrdersSheetBody(),
      FavorsBody(),
      ChooseWelayatSheet(),
      ChangeLangSheet(),
      AddressReadSheet(),
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

  static Future<void> showAddressSheet(AddressModel? model) async {
    final context = appRouter.currentContext;
    await showModalBottomSheet(
      context: context,
      useRootNavigator: true,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10), topRight: Radius.circular(10)),
      ),
      builder: (context) {
        _currentContext = context;
        return AddressField(
          model: model,
        );
      },
    );
    _sheetShown = false;
  }
}
