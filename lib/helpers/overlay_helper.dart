import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hh_express/helpers/extentions.dart';
import 'package:hh_express/helpers/routes.dart';
import 'package:hh_express/helpers/spacers.dart';
import 'package:hh_express/settings/consts.dart';
import 'package:hh_express/settings/enums.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class OverlayHelper {
  static OverlayEntry? _entry;

  static remove() {
    _entry?.remove();
  }

  static Future<void> showLoading() async {
    var ovv = Overlay.of(appRouter.currentContext);
    _entry = OverlayEntry(
      builder: (context) {
        return Scaffold(
          backgroundColor: AppColors.black.withOpacity(.5),
          body: Container(
            decoration: BoxDecoration(
              borderRadius: AppBorderRadiuses.border_6,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: double.infinity,
                ),
                GestureDetector(
                  onTap: () {
                    'GestureTap'.log();
                  },
                  child: Text(
                    'Loading...',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
                AppSpacing.vertical_10,
                CircularProgressIndicator()
              ],
            ),
          ),
        );
      },
    );
    ovv.insert(_entry!);
  }
}

class SnackBarHelper {
  static SnackBar _snackBar(String message) {
    final needMargin = appRouter.location == AppRoutes.mainScreen;
    return SnackBar(
      backgroundColor: Colors.transparent,
      content: Container(
        margin: needMargin ? EdgeInsets.only(bottom: 60.h) : EdgeInsets.zero,
        decoration: BoxDecoration(
          borderRadius: AppBorderRadiuses.border_10,
          color: Colors.black87,
        ),
        padding: AppPaddings.all_12,
        child: Text(message),
      ),
    );
  }

  static void showTopSnack(String message, APIState state) {
    final context = appRouter.currentContext;
    if (state == APIState.error) {
      showTopSnackBar(
        Overlay.of(context),
        CustomSnackBar.error(message: message),
      );
      return;
    }
    if (state == APIState.success) {
      showTopSnackBar(
          Overlay.of(context), CustomSnackBar.success(message: message));
      return;
    }
    showTopSnackBar(Overlay.of(context), CustomSnackBar.info(message: message));
  }

  static void showMessageSnack(String message) {
    final context = appRouter.currentContext;
    final messenger = ScaffoldMessenger.of(context);
    messenger.clearSnackBars();
    messenger.showSnackBar(_snackBar(message));
  }
}
