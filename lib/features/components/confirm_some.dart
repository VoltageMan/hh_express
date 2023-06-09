import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hh_express/settings/consts.dart';
import 'package:hh_express/settings/theme.dart';

class ConfirmSomeTh extends StatelessWidget {
  const ConfirmSomeTh({super.key, required this.title, this.onTap, this.width});
  final String title;
  final double? width;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: AppBorderRadiuses.border_6,
      child: Material(
        color: AppColors.darkBlue,
        textStyle: AppTheme.displayLarge14(context),
        child: InkWell(
          onTap: onTap,
          child: Container(
            alignment: Alignment.center,
            height: 48.h,
            width: width,
            child: Text(
              title,
            ),
          ),
        ),
      ),
    );
  }
}
