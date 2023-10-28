import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hh_express/features/mainScreen/view/components/navBar/nav_bar.dart';
import 'package:hh_express/features/components/widgets/svg_icons.dart';
import 'package:hh_express/helpers/extentions.dart';
import 'package:hh_express/settings/consts.dart';

class CartIcon extends StatelessWidget {
  const CartIcon({
    super.key,
    required this.onTap,
  });
  static const isCartEmpty = false;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).bottomNavigationBarTheme;
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        color: AppColors.transparent,
        height: 72.h,
        width: 72.w,
        child: Stack(
          alignment: Alignment.center,
          children: [
            ValueListenableBuilder(
              valueListenable: bodyIndex,
              builder: (context, bodyIndex, child) {
                final isSelected = bodyIndex == 3;
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    MyImageIcon(
                      path: AssetsPath.navBarIcons[3],
                      color: isSelected
                          ? theme.selectedItemColor
                          : theme.unselectedItemColor,
                      iconSize: 18.h,
                      contSize: 18.h,
                    ),
                    SizedBox(
                      width: double.infinity,
                    ),
                    Text(
                      context.l10n.cart,
                      style: isSelected
                          ? theme.selectedLabelStyle
                          : theme.unselectedLabelStyle,
                    )
                  ],
                );
              },
            ),
            isCartEmpty ? const SizedBox() : const CartBadge(),
          ],
        ),
      ),
    );
  }
}

/// add State Manager
class CartBadge extends StatelessWidget {
  const CartBadge({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      margin: EdgeInsets.only(left: 25.h, bottom: 30.h),
      padding: EdgeInsets.all(2.5.h),
      decoration: BoxDecoration(
        color: theme.bottomNavigationBarTheme.backgroundColor,
        shape: BoxShape.circle,
      ),
      child: Container(
        height: 18.h,
        padding: theme.badgeTheme.padding,
        decoration: BoxDecoration(
          color: theme.badgeTheme.backgroundColor,
          shape: BoxShape.circle,
        ),
        child: FittedBox(
          child: Text(
            '20',
            style: theme.badgeTheme.textStyle!,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
