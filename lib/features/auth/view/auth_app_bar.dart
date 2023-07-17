import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hh_express/helpers/extentions.dart';
import 'package:hh_express/helpers/spacers.dart';
import 'package:hh_express/settings/consts.dart';

class AuthAppBar extends StatelessWidget implements PreferredSizeWidget {
  const AuthAppBar({super.key});

  @override
  Size get preferredSize => Size.fromHeight(52.h);

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return Container(
      height: 52.h,
      decoration: BoxDecoration(
        color: theme.appBarTheme.backgroundColor,
        boxShadow: AppColors.appBarShadow,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: Icon(
              Icons.arrow_back_outlined,
              color: theme.iconTheme.color,
              size: 23.sp,
            ),
            onPressed: () {
              context.pop();
            },
          ),
          Text(
            context.l10n.registration,
            style: theme.appBarTheme.titleTextStyle,
          ),
          SizedBox.square(
            dimension: 23.sp,
          )
        ],
      ),
    );
  }
}
