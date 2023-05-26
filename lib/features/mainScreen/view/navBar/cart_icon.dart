import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hh_express/features/mainScreen/view/navBar/nav_bar.dart';
import 'package:hh_express/features/widgets/svg_icons.dart';
import 'package:hh_express/settings/consts.dart';

class CartIcon extends StatelessWidget {
  const CartIcon({super.key});
  static const isCartEmpty = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => bodyIndex.value = 3,
      child: Container(
        color: AppColors.transparent,
        height: 72.h,
        width: 72.w,
        child: Stack(
          alignment: Alignment.topRight,
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
                          ? AppColors.mainOrange
                          : AppColors.darkGrey,
                      iconSize: 20.8.w,
                    ),
                    SizedBox(
                      height: 2.h,
                      width: double.infinity,
                    ),
                    Text(
                      MyBNavigationBar.titles[3],
                      style: Theme.of(context).textTheme.labelSmall!.copyWith(
                            color: bodyIndex == 3
                                ? AppColors.mainOrange
                                : AppColors.darkGrey,
                          ),
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

/// add State Manager to text
class CartBadge extends StatelessWidget {
  const CartBadge({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 4.h, right: 13.w),
      padding: EdgeInsets.all(2.5.sp),
      decoration: const BoxDecoration(
        color: AppColors.white,
        shape: BoxShape.circle,
      ),
      child: Container(
        height: 20.sp,
        width: 20.sp,
        padding: EdgeInsets.all(3.sp),
        decoration: const BoxDecoration(
          color: AppColors.mainOrange,
          shape: BoxShape.circle,
        ),
        child: FittedBox(
          child: Text(
            '20',
            style: Theme.of(context).textTheme.labelSmall!,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
