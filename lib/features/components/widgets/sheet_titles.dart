import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hh_express/features/components/widgets/svg_icons.dart';
import 'package:hh_express/settings/consts.dart';
import 'package:hh_express/settings/theme.dart';

class BottomSheetTitle extends StatelessWidget {
  const BottomSheetTitle({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: 20.sp,
        ),
        Text(
          title,
          style: AppTheme.titleMedium16(context),
        ),
        MyImageIcon(
          path: AssetsPath.crossIcon,
          contSize: 20.sp,
          iconSize: 20.sp,
          onTap: () => Navigator.pop(context),
        )
      ],
    );
  }
}
