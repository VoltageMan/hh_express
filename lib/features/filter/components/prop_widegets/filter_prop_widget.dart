import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hh_express/helpers/extentions.dart';
import 'package:hh_express/models/property/values/property_value_model.dart';
import 'package:hh_express/settings/consts.dart';
import 'package:hh_express/settings/theme.dart';

class FilterPropWidget extends StatelessWidget {
  FilterPropWidget({
    super.key,
    required this.model,
    this.onTap,
  });
  final PropertyValue model;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final textTheme = AppTheme.titleMedium12(context);
    return GestureDetector(
      onTap: () {
        if (onTap == null) return;
        onTap!();
      },
      child: Container(
        height: 30.sp,
        margin: AppPaddings.bottom_10,
        padding: AppPaddings.horiz10_vertic5,
        decoration: BoxDecoration(
          borderRadius: AppBorderRadiuses.border_8,
          color: AppColors.lightGrey,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '${model.value}',
              style: textTheme,
            ),
          ],
        ),
      ),
    );
  }
}
