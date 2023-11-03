import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hh_express/features/components/widgets/place_holder.dart';
import 'package:hh_express/settings/consts.dart';
import 'package:hh_express/settings/theme.dart';

class OrderStateWDate extends StatelessWidget {
  const OrderStateWDate({super.key, this.date});
  final String? date;
  @override
  Widget build(BuildContext context) {
    final isLoading = date == null;
    if (isLoading) return _LoadingWidget();
    final theme = Theme.of(context).textTheme;

    return Container(
      // color: Colors.red,
      height: 40.h,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          isLoading
              ? MyShimerPlaceHolder(
                  height: 16.h,
                  width: 70.w,
                  radius: AppBorderRadiuses.border_4,
                )
              : Text(
                  'Garaşylýar',
                  style: AppTheme.titleLarge12(context),
                ),
          isLoading
              ? MyShimerPlaceHolder(
                  height: 16.h,
                  width: 90.w,
                  radius: AppBorderRadiuses.border_4,
                )
              : Text(
                  '14.05.23/09:21',
                  style: theme.titleSmall,
                ),
        ],
      ),
    );
  }
}

class _LoadingWidget extends StatelessWidget {
  const _LoadingWidget();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MyShimerPlaceHolder(
          height: 16.h,
          width: 70.w,
          radius: AppBorderRadiuses.border_4,
        ),
        SizedBox(height: 6.h),
        MyShimerPlaceHolder(
          height: 16.h,
          width: 90.w,
          radius: AppBorderRadiuses.border_4,
        )
      ],
    );
  }
}
