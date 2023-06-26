import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hh_express/features/mainScreen/view/components/navBar/cart_icon.dart';
import 'package:hh_express/features/components/widgets/svg_icons.dart';
import 'package:hh_express/helpers/extentions.dart';
import 'package:hh_express/helpers/routes.dart';
import 'package:hh_express/settings/consts.dart';

final bodyIndex = ValueNotifier<int>(0);

class MyNavBar extends StatelessWidget {
  const MyNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).bottomNavigationBarTheme;
    final l10n = context.l10n;
    final navBarTitles = [
      l10n.home,
      l10n.video,
      l10n.category,
      l10n.cart,
      l10n.profile,
    ];
    return Container(
      decoration: BoxDecoration(
        color: theme.backgroundColor,
        boxShadow: AppColors.navBarShaow,
      ),
      child: Row(
        children: List.generate(
          navBarTitles.length,
          (index) => index == 3
              ? CartIcon(
                  onTap: () {
                    bodyIndex.value = index;
                    context.go(AppRoutes.navBar[index], extra: index);
                  },
                )
              : GestureDetector(
                  onTap: () {
                    bodyIndex.value = index;
                    context.go(AppRoutes.navBar[index], extra: index);
                  },
                  child: Container(
                    // gyralaryna basanda basylanok, without color
                    color: AppColors.transparent,
                    height: 72.h,
                    width: 72.w,
                    alignment: Alignment.center,
                    child: ValueListenableBuilder(
                      valueListenable: bodyIndex,
                      builder: (context, bodyIndex, child) {
                        final isSelected = bodyIndex == index;
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            MyImageIcon(
                              path: AssetsPath.navBarIcons[index],
                              color: isSelected
                                  ? theme.selectedItemColor
                                  : theme.unselectedItemColor,
                              iconSize: 20.8.w,
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            Text(
                              navBarTitles[index],
                              style: isSelected
                                  ? theme.selectedLabelStyle
                                  : theme.unselectedLabelStyle,
                            )
                          ],
                        );
                      },
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
