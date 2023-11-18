import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hh_express/features/auth/bloc/auth_bloc.dart';
import 'package:hh_express/helpers/extentions.dart';
import 'package:hh_express/settings/theme.dart';

class Confirm {
  static Future<void> onlogOut(BuildContext context) async {
    final bloc = await context.read<AuthBloc>().logOut();
    Navigator.pop(currentContext!);
  }

  static void onConfirmExit(BuildContext context) {
    Confirm.exit = true;
    Navigator.pop(currentContext!);
  }

  static bool exit = false;
  static BuildContext? currentContext;
  static Future<bool> confirmExit(BuildContext context) async {
    exit = false;
    await showDialog(
      context: context,
      builder: (context) {
        currentContext = context;
        return ConfirmingDialog(
          title: 'Confirm exit',
          content: context.l10n.exitConfirm,
          onConfirm: () => onConfirmExit(context),
        );
      },
    );
    log('$exit after tap');
    return exit;
  }

  static Future<void> showLogOutDialog(BuildContext context) async {
    final l10n = context.l10n;
    await showDialog(
      context: context,
      builder: (context) {
        currentContext = context;
        return ConfirmingDialog(
          title: 'loging out',
          content: 'Are u sure that u want to logout?',
          onConfirm: () => onlogOut(context),
        );
      },
    );
  }
}

class ConfirmingDialog extends StatelessWidget {
  const ConfirmingDialog({
    super.key,
    required this.content,
    required this.title,
    required this.onConfirm,
  });
  final String title;
  final String content;
  final VoidCallback onConfirm;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textButtonTheme.style as MyButtonStyle;
    final l10n = context.l10n;
    return AlertDialog(
      title: Text(
        title,
        style: AppTheme.bodyLargeW500(context),
      ),
      content: Text(
        content,
      ),
      actions: [
        TextButton(
          style: theme,
          onPressed: () => Navigator.pop(context),
          child: Text(
            l10n.cancle,
            style: theme.myTextStyle,
          ),
        ),
        TextButton(
          onPressed: onConfirm,
          style: theme,
          child: Text(
            l10n.exit,
            style: theme.myTextStyle,
          ),
        ),
      ],
    );
  }
}

// todo made only one dynamic dialog for messageing
class LogOutDialog extends StatelessWidget {
  const LogOutDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textButtonTheme.style as MyButtonStyle;
    return AlertDialog(
      content: Text(
        'Do you really wnt to "log-out"?',
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
          onPressed: () async {},
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
