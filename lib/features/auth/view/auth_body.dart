import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hh_express/features/auth/bloc/auth_bloc.dart';
import 'package:hh_express/features/auth/components/auth_field.dart';
import 'package:hh_express/features/auth/components/confirm_terms%20_of_use.dart';
import 'package:hh_express/features/components/my_text_button.dart';
import 'package:hh_express/helpers/extentions.dart';
import 'package:hh_express/helpers/routes.dart';
import 'package:hh_express/models/auth/auth_model.dart';
import 'package:hh_express/settings/consts.dart';
import 'package:hh_express/settings/enums.dart';
import 'package:hh_express/settings/theme.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class AuthBody extends StatefulWidget {
  const AuthBody({super.key, required this.forSingUp});
  final bool forSingUp;

  @override
  State<AuthBody> createState() => _AuthBodyState();
}

class _AuthBodyState extends State<AuthBody>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    bloc = context.read<AuthBloc>()..init();
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  final numController = TextEditingController();
  final codeController = TextEditingController();
  final nameController = TextEditingController();
  late TabController tabController;

  @override
  void dispose() {
    numController.dispose();
    codeController.dispose();
    nameController.dispose();
    super.dispose();
  }

  void myShowSnack(String message, APIState state) {
    if (state == APIState.error) {
      showTopSnackBar(
        Overlay.of(context),
        CustomSnackBar.error(message: message),
      );
      return;
    }
    if (state == APIState.succses) {
      showTopSnackBar(
          Overlay.of(context), CustomSnackBar.success(message: message));
    }
  }

  bool _loading = false;
  late AuthBloc bloc;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final forSingUp = widget.forSingUp;
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        'AuthListener'.log();
        myShowSnack(state.message ?? ' NOMessage', state.apiState);
      },
      child: Column(
        children: [
          Padding(
            padding: AppPaddings.horiz56_vertic70,
            child: Text(
              l10n.registerTitle,
              style: AppTheme.titleMedium16(context, weightless: true),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: TabBarView(
              physics: const NeverScrollableScrollPhysics(),
              controller: tabController,
              children: [
                Column(
                  children: [
                    AuthField(
                      label:
                          widget.forSingUp ? l10n.userName : l10n.phoneNumber,
                      controller:
                          widget.forSingUp ? nameController : numController,
                    ),
                    AuthField(
                      label:
                          widget.forSingUp ? l10n.phoneNumber : l10n.password,
                      controller:
                          widget.forSingUp ? numController : codeController,
                    ),
                    const Expanded(
                      child: SizedBox(),
                    ),
                    widget.forSingUp ? TermsOfUseWidget() : SizedBox(),
                  ],
                ),
                Column(
                  children: [
                    AuthField(
                      label: context.l10n.password,
                      controller: codeController,
                    )
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: AppPaddings.horiz_16.copyWith(top: 31.h),
            child: MyDarkTextButton(
              title: l10n.next,
              onTap: () async {
                'some'.log();
                final number = '993${numController.text}';
                final password = codeController.text;
                final name = nameController.text == '' && !forSingUp
                    ? null
                    : nameController.text;

                final model =
                    AuthModel(entity: number, password: password, name: name);

                if (!bloc.checkName(name) || !bloc.checkNum(number)) {
                  return;
                }
                if (widget.forSingUp) {
                  if (!bloc.state.termsConfirmed) {
                    myShowSnack('Confirm Terms of usage', APIState.error);
                    return;
                  }
                  if (tabController.index == 0) {
                    tabController.animateTo(1);
                    return;
                  }
                  if (!bloc.checkPass(password)) {
                    return;
                  }
                  bloc.singUp(model).then((value) {
                    if (value) {
                      context.pop();
                      return;
                    }
                    tabController.animateTo(0);
                  });
                  return;
                }
                bloc.logIn(model).then((value) {
                  if (value) {
                    context.pop();
                    return;
                  }
                });
                return;
              },
            ),
          ),
          Padding(
            padding: AppPaddings.horiz_16.copyWith(bottom: 108.h, top: 16.h),
            child: RichText(
              text: TextSpan(
                style: AppTheme.bodyMedium14(context),
                children: [
                  TextSpan(
                    text: 'Already have an account?  ',
                  ),
                  TextSpan(
                    text: forSingUp ? l10n.singIn : l10n.registration,
                    style: TextStyle(
                      color: AppColors.mainOrange,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        if (_loading) {
                          return;
                        }
                        context.pop();
                        context.push(AppRoutes.auth, extra: !widget.forSingUp);
                      },
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class StLess extends StatelessWidget {
  const StLess({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class StFull extends StatefulWidget {
  const StFull({super.key});

  @override
  State<StFull> createState() => _StFullState();
}

class _StFullState extends State<StFull> {
  void onTap() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
