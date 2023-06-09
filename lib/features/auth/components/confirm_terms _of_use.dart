import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hh_express/helpers/extentions.dart';
import 'package:hh_express/settings/consts.dart';

class TermsOfUseWidget extends StatefulWidget {
  const TermsOfUseWidget({super.key});

  @override
  State<TermsOfUseWidget> createState() => _TermsOfUseWidgetState();
}

class _TermsOfUseWidgetState extends State<TermsOfUseWidget> {
  bool boxVal = true;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Transform.scale(
          scale: 1.3.sp,
          child: Checkbox(
            value: boxVal,
            onChanged: (value) {
              setState(() {
                boxVal = !boxVal;
              });
            },
          ),
        ),
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
                  ..onTap = () {
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
