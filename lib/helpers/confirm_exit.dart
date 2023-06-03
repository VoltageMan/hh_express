import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:hh_express/helpers/extentions.dart';
import 'package:hh_express/settings/consts.dart';

class Confirm {
  static bool exit = false;
  static Future<bool> confirmExit(BuildContext context) async {
    exit = false;
    await showDialog(
      context: context,
      builder: (context) => const ConfirmExitDialog(),
    );
    log('$exit after tap');
    return exit;
  }
}

class ConfirmExitDialog extends StatelessWidget {
  const ConfirmExitDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textButtonTheme;
    log(theme.toString());
    return AlertDialog(
      content: Text(
        AppTitles.confirmExit!,
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          style: theme.style, 
          child: Text(
            AppTitles.cancle!,
          )..log(),
        ),
        TextButton(
          onPressed: () {
            Confirm.exit = true;
            Navigator.pop(context);
          },
          style: theme.style,
          child: Text(
            AppTitles.exit!,
          ),
        ),
      ],
    );
  }
}
