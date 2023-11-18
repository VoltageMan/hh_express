import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hh_express/features/components/widgets/place_holder.dart';
import 'package:hh_express/helpers/spacers.dart';
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
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FittedBox(
          child: Text(
            'Pendings',
            maxLines: 1,
            style: AppTheme.titleLarge12(context),
          ),
        ),
        FittedBox(
          child: Text(
            '14.05.23/09:21',
            maxLines: 1,
            style: theme.titleSmall,
          ),
        )
      ],
    );
  }
}

class _LoadingWidget extends StatelessWidget {
  const _LoadingWidget();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    final height = AppSpacing.getTextHeight(12);

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        MyShimerPlaceHolder(
          height: height * 1.6,
          child: Container(
            height: height * 1.6,
            width: height * 1.6,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.shimmerBodyColor,
            ),
          ),
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(
              2,
              (index) => MyShimerPlaceHolder(
                height: height,
                margin: AppPaddings.horiz_8.copyWith(top: 2.h, bottom: 2.h),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
