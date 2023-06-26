import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hh_express/features/components/widgets/pop_leading.dart';
import 'package:hh_express/helpers/extentions.dart';
import 'package:hh_express/settings/consts.dart';

class NotificationsAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const NotificationsAppBar({
    super.key,
  });
  @override
  Size get preferredSize => Size.fromHeight(52.h);
  @override
  Widget build(BuildContext context) {
    final topPad = MediaQuery.paddingOf(context).top;
    final theme = context.theme;
    return Container(
      height: 52.h,
      margin: EdgeInsets.only(top: topPad),
      padding: AppPaddings.horiz_16,
      decoration: BoxDecoration(
        color: theme.appBarTheme.backgroundColor,
        boxShadow: AppColors.appBarShadow,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const PopLeadingIconButton(index: 0),
          Center(
            child: Text(
              'Notifcations',
              style: theme.textTheme.titleMedium,
            ),
          ),
          SizedBox(width: 26.sp),
        ],
      ),
    );
  }
}
