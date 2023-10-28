import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hh_express/features/components/widgets/place_holder.dart';
import 'package:hh_express/features/components/widgets/svg_icons.dart';
import 'package:hh_express/helpers/extentions.dart';
import 'package:hh_express/helpers/spacers.dart';
import 'package:hh_express/settings/consts.dart';
import 'package:hh_express/settings/theme.dart';

class NotificationWidget extends StatelessWidget {
  const NotificationWidget({super.key, this.notifi});

  final dynamic notifi;
  @override
  Widget build(BuildContext context) {
    final theme = context.theme.textTheme;
    final isLoading = notifi == null;
    if (isLoading) {
      return _LoadingWidget();
    }
    return Padding(
      padding: AppPaddings.horiz16_vertic18,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyImageIcon(
            path: AssetsPath.crossIcon,
            contSize: 24.sp,
            color: AppColors.mainOrange,
            onTap: () {},
          ),
          AppSpacing.horizontal_12,
          SizedBox(
            width: 292.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '# 7548 Zakazyňyz kabul edildi',
                  style: theme.titleLarge,
                ),
                Padding(
                  padding: AppPaddings.vertic_8,
                  child: Text(
                    'Zakazyňyz kabul edildi doly maglumatlary profiliňizde görüp bilersiňiz.',
                    style: theme.titleSmall,
                  ),
                ),
                Text(
                  '15.04.2023 1:01 PM',
                  style: AppTheme.bodyMedium10(context),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _LoadingWidget extends StatelessWidget {
  const _LoadingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPaddings.horiz16_vertic18,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyShimerPlaceHolder(
            height: 24.sp,
            width: 24.sp,
          ),
          AppSpacing.horizontal_12,
          SizedBox(
            width: 292.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyShimerPlaceHolder(
                  height: 20.h,
                  width: 160.w,
                ),
                Padding(
                    padding: AppPaddings.vertic_8,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MyShimerPlaceHolder(
                          height: 20.h,
                        ),
                        MyShimerPlaceHolder(
                          height: 20.h,
                          width: 100.w,
                          margin: AppPaddings.top_6,
                        ),
                      ],
                    )),
                MyShimerPlaceHolder(
                  height: 20.h,
                  width: 140.w,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
