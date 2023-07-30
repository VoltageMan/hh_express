import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hh_express/settings/consts.dart';

class CartCountButton extends StatelessWidget {
  const CartCountButton({super.key});

  @override
  Widget build(BuildContext context) {
    // there was litte space couse borderSide and i solve it with Stack
    return SizedBox(
      height: 24.sp,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 32.w,
            color: AppColors.darkGrey,
            alignment: Alignment.center,
            padding: AppPaddings.all_5,
            margin: AppPaddings.horiz_6,
            child: const FittedBox(
              alignment: Alignment.center,
              child: Text('1'),
            ),
          ),
          Container(
            width: 92.w,
            decoration: BoxDecoration(
              border: AppBorderRadiuses.defBorderDark,
              borderRadius: AppBorderRadiuses.border_6,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: AppPaddings.left_6,
                  child: const FittedBox(
                    alignment: Alignment.centerLeft,
                    child: Icon(
                      Icons.remove_rounded,
                    ),
                  ),
                ),
                Container(
                  margin: AppPaddings.right_6,
                  child: const FittedBox(
                    alignment: Alignment.centerRight,
                    child: Icon(
                      Icons.add_rounded,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
