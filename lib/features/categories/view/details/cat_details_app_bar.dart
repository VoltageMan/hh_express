import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hh_express/features/components/widgets/pop_leading.dart';
import 'package:hh_express/features/components/widgets/svg_icons.dart';
import 'package:hh_express/helpers/extentions.dart';
import 'package:hh_express/helpers/modal_sheets.dart';
import 'package:hh_express/helpers/routes.dart';
import 'package:hh_express/settings/consts.dart';

class CatDetailsAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CatDetailsAppbar({super.key});
  @override
  Size get preferredSize => Size.fromHeight(52.h);
  @override
  Widget build(BuildContext context) {
    final topPad = MediaQuery.paddingOf(context).top;
    final theme = Theme.of(context);
    return Container(
      margin: EdgeInsets.only(top: topPad),
      height: 52.h,
      padding: AppPaddings.horiz_16,
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        boxShadow: AppColors.appBarShadow,
        color: AppColors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const PopLeadingIconButton(index: 2),
          Text(
            'Kategoriya',
            style: theme.textTheme.titleMedium,
          ),
          MyImageIcon(
            path: AssetsPath.filterIcon,
            contSize: 26.sp,
            iconSize: 19.sp,
            onTap: () {
              ModelBottomSheetHelper.showFilterSheet();
            },
          ),
        ],
      ),
    );
  }
}
