import 'package:flutter/material.dart';
import 'package:hh_express/features/auth/view/auth_app_bar.dart';
import 'package:hh_express/features/auth/view/auth_body.dart';
import 'package:hh_express/helpers/extentions.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key, required this.forSingUp});
  final bool forSingUp;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: AuthAppBar(
        title: forSingUp ? l10n.registration : l10n.singIn,
      ),
      body: AuthBody(
        forSingUp: forSingUp,
      ),
    );
  }
}
