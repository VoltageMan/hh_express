import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hh_express/features/components/widgets/place_holder.dart';
import 'package:hh_express/settings/consts.dart';
import 'package:hh_express/settings/theme.dart';

class OrderInfoListTile extends StatelessWidget {
  const OrderInfoListTile({
    super.key,
    required this.title,
    required this.content,
    this.contentBold,
    this.titleBold,
  });
  final String? title;
  final String? content;
  final bool? titleBold;
  final bool? contentBold;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    final isLoading = content == null;
    return Padding(
      padding: titleBold != null || contentBold != null
          ? EdgeInsets.zero
          : AppPaddings.bottom_15,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          isLoading
              ? MyShimerPlaceHolder(
                  width: 115.w,
                  height: 18.h,
                  radius: AppBorderRadiuses.border_4,
                )
              : Text(
                  title!,
                  style: titleBold ?? false
                      ? theme.titleLarge
                      : theme.displaySmall,
                ),
          isLoading
              ? MyShimerPlaceHolder(
                  width: 70.w,
                  height: 18.h,
                  radius: AppBorderRadiuses.border_4,
                )
              : Text(
                  content!,
                  style: contentBold ?? false
                      ? theme.bodyLarge
                      : AppTheme.bodyMedium14(context),
                ),
        ],
      ),
    );
  }
}
