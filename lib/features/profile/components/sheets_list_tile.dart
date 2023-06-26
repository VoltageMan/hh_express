import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hh_express/settings/consts.dart';
import 'package:hh_express/settings/theme.dart';

class ProfileSelectListTile extends StatelessWidget {
  const ProfileSelectListTile(
      {super.key,
      required this.title,
      required this.isSelected,
      required this.onTap});
  final String title;
  final VoidCallback onTap;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: AppPaddings.horiz_16,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: AppTheme.bodyMedium14(context),
            ),
            AnimatedContainer(
              height: 20.sp,
              width: 20.sp,
              margin: AppPaddings.vertic_12,
              decoration: BoxDecoration(
                color: isSelected ? AppColors.mainOrange : Colors.white,
                shape: BoxShape.circle,
                border: isSelected
                    ? null
                    : Border.all(
                        color: AppColors.darkGrey,
                        width: 2,
                      ),
              ),
              alignment: Alignment.center,
              duration: AppDurations.duration_150ms,
              child: isSelected
                  ? AnimatedContainer(
                      height: 10.sp,
                      width: 10.sp,
                      duration: AppDurations.duration_150ms,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.white,
                      ),
                    )
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}
