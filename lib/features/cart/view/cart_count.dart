import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hh_express/helpers/extentions.dart';
import 'package:hh_express/settings/consts.dart';

class CartCount extends StatefulWidget {
  const CartCount({super.key});

  @override
  State<CartCount> createState() => _CartCountState();
}

class _CartCountState extends State<CartCount> {
  int count = 1;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              border: AppBorderRadiuses.defBorderDark,
              borderRadius: AppBorderRadiuses.border_4,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      if (count == 0) return;
                      count--;
                      setState(() {});
                    },
                    child: FittedBox(
                      child: Icon(
                        Icons.remove_outlined,
                        color: AppColors.darkGrey,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 32.w),
                Expanded(
                    child: GestureDetector(
                  onTap: () {
                    if (count == 99) return;

                    count++;
                    setState(() {});
                  },
                  child: FittedBox(
                    child: Icon(
                      Icons.add_outlined,
                      color: AppColors.darkGrey,
                    ),
                  ),
                )),
              ],
            ),
          ),
          Container(
            width: 32.w,
            padding: AppPaddings.horiz_6,
            alignment: Alignment.center,
            color: AppColors.darkGrey,
            child: FittedBox(
              child: Text(
                '$count',
                style: context.theme.textTheme.labelSmall,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
