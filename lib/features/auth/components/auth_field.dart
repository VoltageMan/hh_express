import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hh_express/helpers/extentions.dart';
import 'package:hh_express/settings/consts.dart';
import 'package:hh_express/settings/theme.dart';

class AuthField extends StatelessWidget {
  const AuthField({super.key, required this.label, required this.controller});
  final String label;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final border = OutlineInputBorder(
        borderRadius: AppBorderRadiuses.border_6, borderSide: BorderSide.none);
    final hasPrefix = label == context.l10n.phoneNumber;
    final forName = label == context.l10n.name;

    return Container(
      height: 48.h,
      alignment: Alignment.center,
      margin: AppPaddings.horiz_16.copyWith(bottom: 30.h),
      child: TextField(
        autocorrect: false,
        buildCounter: (context,
            {currentLength = 0, isFocused = false, maxLength = 5}) {
          return null;
        },
        style: AppTheme.titleMedium12(context),
        keyboardType: forName ? null : TextInputType.number,
        maxLength: hasPrefix
            ? 8
            : forName
                ? 10
                : 5,
        decoration: InputDecoration(
          prefixText: hasPrefix ? '+993 ' : null,
          // contentPadding: AppPaddings.horiz12_vertic17.copyWith(bottom: 30.h),
          filled: true,
          labelText: label,
          fillColor: theme.inputDecorationTheme.fillColor,
          focusColor: theme.inputDecorationTheme.fillColor,
          border: border,
          enabledBorder: border,
          focusedBorder: border,
        ),
        cursorColor: AppColors.mainOrange,
      ),
    );
  }
}

void some() {
  const roswen = 'Rowsen';
  const akge = 'Akga';
  const input = 'input';
  final map = {roswen: 'musurDal', akge: 'musur'};
  
  print(map[input]);
}
