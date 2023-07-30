import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hh_express/settings/consts.dart';
import 'package:hh_express/settings/theme.dart';

class ConfirmSomeTh extends StatelessWidget {
  const ConfirmSomeTh({
    super.key,
    this.disabled,
    required this.title,
    this.onTap,
    this.width,
  });
  final String title;
  final double? width;
  final VoidCallback? onTap;
  final bool? disabled;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: AppBorderRadiuses.border_6,
      child: Material(
        color: AppColors.darkBlue.withOpacity(disabled ?? false ? 0.7 : 1),
        textStyle: AppTheme.displayLarge14(context),
        child: InkWell(
          onTap: disabled ?? false ? null : onTap,
          child: Container(
            alignment: Alignment.center,
            height: 48.h,
            width: width,
            child: disabled ?? false
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        title,
                      ),
                      Container(
                        margin: AppPaddings.left_12,
                        height: 17.sp,
                        width: 17.sp,
                        child: CircularProgressIndicator(
                          strokeWidth: 2.sp,
                          color: AppColors.white,
                        ),
                      )
                    ],
                  )
                : Text(
                    title,
                  ),
          ),
        ),
      ),
    );
  }
}
