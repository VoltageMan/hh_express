import 'package:flutter/material.dart';
import 'package:hh_express/helpers/extentions.dart';
import 'package:hh_express/helpers/routes.dart';
import 'package:hh_express/settings/consts.dart';

class OverlayHelper {
  static OverlayEntry? _entry;

  static remove() {
    _entry?.remove();
  }

  static Future<void> showLoading() async {
    'kuukuk'.log();
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
                    'SomeThis',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
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
