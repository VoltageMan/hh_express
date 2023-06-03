import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hh_express/features/home/view/home_screen.dart';
import 'package:hh_express/features/mainScreen/view/components/main_app_bar.dart';
import 'package:hh_express/features/mainScreen/view/navBar/nav_bar.dart';
import 'package:hh_express/helpers/confirm_exit.dart';
import 'dart:developer';

import 'package:hh_express/helpers/routes.dart';
import 'package:hh_express/settings/consts.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key, required this.body, required this.title});
  final Widget body;
  final String? title;

  static const bodies = [
    HomeScreen(),
    Center(child: Text('NothingYet')),
    Center(child: Text('NothingYet')),
    Center(child: Text('NothingYet')),
    Center(child: Text('NothingYet')),
  ];

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    bodyIndex.addListener(
      () {
        final index = bodyIndex.value;
        context.go(AppRoutes.navBar[index],
            extra: AppTitles.navBarTitles![index]);
      },
    );
  }

  bool _dialogShown = false;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (_dialogShown) return true;
        log('pop Scoup');
        _dialogShown = true;
        final exit = await Confirm.confirmExit(context);
        _dialogShown = false;
        return exit;
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        appBar: MainAppBar(
          title: widget.title,
        ),
        body: widget.body,
        bottomNavigationBar: const MyNavBar(),
      ),
    );
  }
}
