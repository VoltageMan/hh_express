import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hh_express/features/mainScreen/view/navBar/cart_icon.dart';
import 'package:hh_express/features/widgets/svg_icons.dart';
import 'package:hh_express/settings/consts.dart';
import 'package:hh_express/settings/globals.dart';

final bodyIndex = ValueNotifier<int>(0);

class MyNavBar extends StatelessWidget {
  const MyNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).bottomNavigationBarTheme;
    return Container(
      decoration: BoxDecoration(
        color: theme.backgroundColor,
        boxShadow: AppColors.navBarShaow,
      ),
      child: Row(
        children: List.generate(
          5,
          (index) => index == 3
              ? CartIcon(
                  onTap: () => bodyIndex.value = 3,
                )
              : GestureDetector(
                  onTap: () {
                    bodyIndex.value = index;
                    locale.value = 'ru';
                  },
                  child: Container(
                    // gyralaryna basanda basylanok without color
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
                              AppTitles.navBarTitles![index],
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
