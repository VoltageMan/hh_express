import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hh_express/features/components/widgets/svg_icons.dart';
import 'package:hh_express/helpers/extentions.dart';
import 'package:hh_express/helpers/routes.dart';
import 'package:hh_express/helpers/spacers.dart';
import 'package:hh_express/settings/consts.dart';

class ProdDetailsAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ProdDetailsAppBar({super.key});
  @override
  Size get preferredSize => Size.fromHeight(52.h);
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      margin: EdgeInsets.only(top: AppSpacing.topPad),
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
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  appRouter.currentContext.pop();
                },
                child: Container(
                  height: double.infinity,
                  width: 24.sp,
                  alignment: Alignment.center,
                  child: FittedBox(
                    child: Icon(
                      Icons.arrow_back_rounded,
                      color: theme.iconTheme.color,
                    ),
                  ),
                ),
              ),
              AppSpacing.horizontal_12,
              Text(
                context.l10n.aboutProd,
                style: theme.textTheme.titleMedium,
              ),
            ],
          ),
          MyImageIcon(
            path: AssetsPath.favorIcon,
            contSize: 24.sp,
            iconSize: 19.sp,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
