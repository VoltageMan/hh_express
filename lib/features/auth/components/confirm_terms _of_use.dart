import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hh_express/features/auth/bloc/auth_bloc.dart';
import 'package:hh_express/helpers/extentions.dart';
import 'package:hh_express/helpers/spacers.dart';
import 'package:hh_express/settings/consts.dart';

class TermsOfUseWidget extends StatefulWidget {
  TermsOfUseWidget({super.key});
  @override
  State<TermsOfUseWidget> createState() => _TermsOfUseWidgetState();
}

class _TermsOfUseWidgetState extends State<TermsOfUseWidget> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bloc = context.read<AuthBloc>();
    final boxVal = bloc.state.termsConfirmed;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Transform.scale(
          scale: 1.3,
          child: Checkbox(
            value: boxVal,
            onChanged: (value) {
              bloc.confirmTerms(value ?? false);
              setState(() {});
            },
          ),
        ),
        AppSpacing.horizontal_12,
        Text.rich(
          TextSpan(
            style: theme.textTheme.bodyMedium,
            children: [
              const TextSpan(
                text: 'Sertler bilen ',
              ),
              TextSpan(
                text: 'ylalasyan',
                recognizer: TapGestureRecognizer()
                  ..onTap = () async {
                    await showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        actions: [
                          TextButton(
                            child: Text(
                              'Bolya agam',
                            ),
                            onPressed: () => Navigator.pop(context),
                          )
                        ],
                        content: Text('Draw me terms of usage page or dialog'),
                      ),
                    );
                    'go to terms of useage page or dialog (there is no desinge)'
                        .log();
                  },
                style: TextStyle(
                  color: AppColors.mainOrange,
                  fontWeight: FontWeight.w600,
                  decoration: TextDecoration.underline,
                  decorationThickness: 1.5.h,
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
