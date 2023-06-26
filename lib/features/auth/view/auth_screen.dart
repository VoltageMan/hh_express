import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hh_express/features/auth/components/auth_field.dart';
import 'package:hh_express/features/auth/components/confirm_terms%20_of_use.dart';
import 'package:hh_express/features/components/confirm_some.dart';
import 'package:hh_express/helpers/extentions.dart';
import 'package:hh_express/helpers/routes.dart';
import 'package:hh_express/settings/consts.dart';
import 'package:hh_express/settings/theme.dart';
import 'package:another_flushbar/flushbar.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen>
    with SingleTickerProviderStateMixin {
  final numController = TextEditingController();
  final codeController = TextEditingController();
  final nameController = TextEditingController();
  late TabController tabContrller;
  @override
  void initState() {
    tabContrller = TabController(length: 2, vsync: this);
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    numController.dispose();
    codeController.dispose();
    nameController.dispose();
    super.dispose();
  }

  void myShowSnack(BuildContext context) async {
    // Flushbar(
    //   animationDuration: const Duration(milliseconds: 400),
    //   isDismissible: false,
    //   forwardAnimationCurve: Curves.easeIn,
    //   reverseAnimationCurve: Curves.easeOut,
    //   duration: const Duration(milliseconds: 3000),
    //   flushbarPosition: FlushbarPosition.BOTTOM,
    //   flushbarStyle: FlushbarStyle.FLOATING,
    //   message: "I am Bottom Snackbar",
    //   margin: const EdgeInsets.symmetric(vertical: 20),
    // ).show(context);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        toolbarHeight: 52.h,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_outlined,
            color: theme.iconTheme.color,
            size: 23.sp,
          ),
          onPressed: () {
            context.go(AppRoutes.navBar.lastOrNull, extra: 4);
          },
        ),
        centerTitle: true,
        title: Text(
          context.l10n.registration,
          style: theme.appBarTheme.titleTextStyle,
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: AppPaddings.horiz56_vertic70,
            child: Text(
              context.l10n.resterTitle,
              style: AppTheme.titleMedium16(context, weightless: true),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: TabBarView(
              physics: const NeverScrollableScrollPhysics(),
              controller: tabContrller,
              children: [
                Column(
                  children: [
                    AuthField(
                        label: context.l10n.name, controller: nameController),
                    AuthField(
                        label: context.l10n.phoneNumber,
                        controller: numController),
                    const Expanded(
                      child: SizedBox(),
                    ),
                    const TermsOfUseWidget(),
                  ],
                ),
                Column(
                  children: [
                    AuthField(
                      label: context.l10n.code,
                      controller: codeController,
                    )
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: AppPaddings.horiz_16.copyWith(bottom: 108.h, top: 31.h),
            child: ConfirmSomeTh(
              title: 'DowamEt',
              onTap: () {
                myShowSnack(context);
                tabContrller.animateTo(tabContrller.index != 1 ? 1 : 0);
              },
            ),
          )
        ],
      ),
    ).toWillGoProfile(4);
  }
}
