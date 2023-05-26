import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hh_express/features/mainScreen/view/navBar/cart_icon.dart';
import 'package:hh_express/features/widgets/svg_icons.dart';
import 'package:hh_express/helpers/spacers.dart';
import 'package:hh_express/settings/consts.dart';

final bodyIndex = ValueNotifier<int>(0);

class MyBNavigationBar extends StatelessWidget {
  const MyBNavigationBar({super.key});
  static final titles = [
    'Home',
    'Video',
    'Category',
    'Cart',
    'Profile',
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        boxShadow: AppColors.navBarShaow,
      ),
      child: Row(
        children: List.generate(5, (index) {
          if (index == 3) {
            return const CartIcon();
          }
          return GestureDetector(
            onTap: () => bodyIndex.value = index,
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
                            ? AppColors.mainOrange
                            : AppColors.darkGrey,
                        iconSize: 20.8.w,
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Text(
                        titles[index],
                        style: Theme.of(context).textTheme.labelSmall!.copyWith(
                              color: isSelected
                                  ? AppColors.mainOrange
                                  : AppColors.darkGrey,
                            ),
                      )
                    ],
                  );
                },
              ),
            ),
          );
        }),
      ),
    );
  }
}
