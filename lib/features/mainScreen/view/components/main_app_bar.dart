import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hh_express/features/home/view/components/search_field.dart';
import 'package:hh_express/features/components/widgets/svg_icons.dart';
import 'package:hh_express/helpers/extentions.dart';
import 'package:hh_express/helpers/modal_sheets.dart';
import 'package:hh_express/settings/consts.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MainAppBar({
    super.key,
    required this.title,
  });
  final String? title;
  @override
  Size get preferredSize => Size.fromHeight(52.h);
  @override
  Widget build(BuildContext context) {
    final topPad = MediaQuery.paddingOf(context).top;
    final textTheme = Theme.of(context).textTheme;
    return Container(
      margin: EdgeInsets.only(top: topPad),
      height: 52.h,
      padding: AppPaddings.horiz_16,
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        boxShadow: AppColors.appBarShadow,
        color: AppColors.white,
      ),
      child: title != AppTitles.navBarTitles!.first && title != null
          ? Text(title!, style: textTheme.titleMedium)
          : Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                HomeSearchField(),
                Padding(
                  padding: AppPaddings.horiz_16,
                  child: MyImageIcon(
                    path: AssetsPath.filterIcon,
                    iconSize: 20.8.w,
                    onTap: () =>
                        ModelBottomSheetHelper.showFilterSheet(context),
                  ),
                ),
                MyImageIcon(
                  path: AssetsPath.bellIcon,
                  contSize: 24.sp,
                  iconSize: 19.2.h,
                ),
              ],
            ),
    );
  }
}
