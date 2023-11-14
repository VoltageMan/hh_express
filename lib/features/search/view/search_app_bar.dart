import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hh_express/features/components/widgets/svg_icons.dart';
import 'package:hh_express/features/home/view/components/search_field.dart';
import 'package:hh_express/helpers/spacers.dart';
import 'package:hh_express/settings/consts.dart';

class SearchAppbar extends StatelessWidget implements PreferredSizeWidget {
  const SearchAppbar({super.key});
  @override
  Size get preferredSize => Size.fromHeight(52.h);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: AppColors.appBarShadow,
      ),
      margin: EdgeInsets.only(top: AppSpacing.topPad),
      height: 52.h,
      width: double.infinity,
      padding: AppPaddings.horiz_16,
      child: Row(
        children: [
          Expanded(child: HomeSearchField()),
          AppSpacing.horizontal_8,
          MyImageIcon(
            onTap: () {},
            path: AssetsPath.filterIcon,
            color: AppColors.darkBlue,
            contSize: 26.sp,
          )
        ],
      ),
    );
  }
}
