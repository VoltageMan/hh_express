import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:hh_express/helpers/extentions.dart';
import 'package:hh_express/settings/theme.dart';

class Confirm {
  static bool exit = false;
  static BuildContext? currentContext;
  static Future<bool> confirmExit(BuildContext context) async {
    exit = false;
    await showDialog(
      context: context,
      builder: (context) {
        currentContext = context;
        return const ConfirmExitDialog();
      },
    );
    log('$exit after tap');
    return exit;
  }
}

class ConfirmExitDialog extends StatelessWidget {
  const ConfirmExitDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textButtonTheme.style as MyButtonStyle;
    return AlertDialog(
      content: Text(
        context.l10n.exitConfirm,
      ),
      actions: [
        TextButton(
          style: theme,
          onPressed: () => Navigator.pop(context),
          child: Text(
            context.l10n.cancle,
            style: theme.myTextStyle,
          ),
        ),
        TextButton(
          onPressed: () {
            Confirm.exit = true;
            Navigator.pop(context);
          },
          style: theme,
          child: Text(
            context.l10n.exit,
            style: theme.myTextStyle,
          ),
        ),
      ],
    );
  }
}
