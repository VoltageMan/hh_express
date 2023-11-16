import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hh_express/features/address/addres_read_sheet.dart';
import 'package:hh_express/features/address/view/address_field.dart';
import 'package:hh_express/features/chat/bloc/chat_bloc.dart';
import 'package:hh_express/features/chat/bloc/chat_events.dart';
import 'package:hh_express/features/favors/view/favors_body.dart';
import 'package:hh_express/features/filter/components/sheet_body.dart';
import 'package:hh_express/features/order_history/view/screens/orders_sheet_body.dart';
import 'package:hh_express/features/product_details/view/modalSheet/product_modal_body.dart';
import 'package:hh_express/features/profile/view/sheets/change_lang_sheet.dart';
import 'package:hh_express/helpers/extentions.dart';
import 'package:hh_express/helpers/routes.dart';
import 'package:hh_express/models/addres/address_model.dart';
import 'package:image_picker/image_picker.dart';

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
    _sheetShown = true;
    List<Widget> _profileSheets = [
      SizedBox(),
      AddressReadSheet(),
      OrdersSheetBody(),
      FavorsBody(),
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

  static Future<void> showAddressSelecSheet() async {
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
        _sheetShown = true;
        _currentContext = context;
        return AddressReadSheet(forComplete: true);
      },
    );
    _sheetShown = false;
  }

  static Future<void> showAddressUpdateSheet(AddressModel? model) async {
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
        _sheetShown = true;
        _currentContext = context;
        return AddressField(
          model: model,
        );
      },
    );
    _sheetShown = false;
  }

  static Future<void> showCameraOrGallerySelector(BuildContext context) async {
    final bloc = BlocProvider.of<ChatBloc>(context);
    bool? isFromCamera;
    await showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(
            10,
          ),
        ),
      ),
      context: context,
      builder: (ctx) {
        return Container(
          padding: EdgeInsets.all(20.sp),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    20,
                  ),
                ),
                padding: EdgeInsets.all(5.sp),
                child: IconButton(
                  onPressed: () async {
                    isFromCamera = true;
                    Navigator.of(ctx).pop();
                  },
                  icon: Icon(
                    Icons.camera_outlined,
                  ),
                ),
              ),
              SizedBox(
                height: 30.h,
                child: VerticalDivider(
                  thickness: 1,
                  color: Colors.black,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    20,
                  ),
                ),
                padding: EdgeInsets.all(5.sp),
                child: IconButton(
                  onPressed: () async {
                    isFromCamera = false;
                    Navigator.of(ctx).pop();
                  },
                  icon: Icon(
                    Icons.image_outlined,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
    if (isFromCamera != null) {
      final image = await ImagePicker().pickImage(
        source: isFromCamera! ? ImageSource.camera : ImageSource.gallery,
        imageQuality: 50,
      );
      if (image != null) {
        bloc.add(
          SendMessageEvent(
            file: image,
          ),
        );
        if (appRouter.location != AppRoutes.chat) {
          context.push(AppRoutes.chat);
        }
      }
    }
  }
}
