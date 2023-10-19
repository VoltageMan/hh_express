import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hh_express/features/cart/view/cart_body.dart';
import 'package:hh_express/features/categories/view/body.dart';
import 'package:hh_express/features/home/view/body.dart';
import 'package:hh_express/features/mainScreen/view/components/main_app_bar.dart';
import 'package:hh_express/features/mainScreen/view/components/navBar/nav_bar.dart';
import 'package:hh_express/features/profile/view/profile_body.dart';
import 'package:hh_express/features/video/view/home_video.dart';
import 'package:hh_express/helpers/confirm_exit.dart';
import 'package:hh_express/helpers/modal_sheets.dart';
import 'dart:developer';

import 'package:hh_express/helpers/overlay_helper.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({
    super.key,
  });

  static final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(systemNavigationBarColor: Colors.white));
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    bodies = null;
  }

  List<Widget>? bodies = [
    HomeScreen(),
    HomeVideos(),
    CategoryBody(),
    CartScreen(),
    ProfileBody(),
  ];
  bool _dialogShown = false;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // if(OverlayHelper.){
        //   return
        // }
        final val = ModelBottomSheetHelper.doPop();
        if (!val) {
          return false;
        }
        if (_dialogShown) {
          Navigator.pop(Confirm.currentContext!);
          return false;
        }
        log('pop Scoup');
        _dialogShown = true;
        final exit = await Confirm.confirmExit(context);
        _dialogShown = false;
        return exit;
      },
      child: Scaffold(
        key: MainScreen.scaffoldKey,
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        appBar: MainAppBar(),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: ValueListenableBuilder(
                valueListenable: bodyIndex,
                builder: (contetx, val, child) {
                  return bodies![val];
                },
              ),
            ),
            const MyNavBar()
          ],
        ),
      ),
    );
  }
}
