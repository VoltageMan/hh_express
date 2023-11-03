import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hh_express/features/orders/view/details/orderStateWidget/order_state_check.dart';
import 'package:hh_express/features/orders/view/details/orderStateWidget/state_date_wiget.dart';
import 'package:hh_express/helpers/spacers.dart';
import 'package:hh_express/settings/consts.dart';

class OrderStateWidget extends StatelessWidget {
  const OrderStateWidget({super.key, this.prod});
  final dynamic prod;
  @override
  Widget build(BuildContext context) {
    final isLoading = prod == null;
    if (isLoading) return _LoadingWidget();
    return Container(
      height: 200.h,
      margin: AppPaddings.all_16,
      padding: AppPaddings.horiz16_vertic12,
      decoration: BoxDecoration(
        borderRadius: AppBorderRadiuses.border_6,
        border: Border.all(
          color: AppColors.lightGrey,
          width: 1.5.sp,
        ),
      ),
      alignment: Alignment.topRight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          OrderStateCheck(
            checkCount: 3,
            tickedsCount: 3,
          ),
          AppSpacing.horizontal_5_5,
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
              3,
              (index) => OrderStateWDate(
                date: 'some',
              ),
            ),
          ),
          const Expanded(child: SizedBox()),
          OrderStateCheck(
            checkCount: 2,
            tickedsCount: 2,
          ),
          AppSpacing.horizontal_5_5,
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
              3,
              (index) {
                return index != 2
                    ? OrderStateWDate(date: '2134')
                    : SizedBox(
                        height: 40.h,
                      );
              },
            ),
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
    return Container(
      height: 200.h,
      margin: AppPaddings.all_16,
      padding: AppPaddings.horiz16_vertic12,
      decoration: BoxDecoration(
        borderRadius: AppBorderRadiuses.border_6,
        border: Border.all(
          color: AppColors.lightGrey,
          width: 1.5.sp,
        ),
      ),
      alignment: Alignment.topRight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          OrderStateCheck(checkCount: 3, tickedsCount: null),
          AppSpacing.horizontal_5_5,
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
              3,
              (index) => OrderStateWDate(),
            ),
          ),
          const Expanded(
            child: SizedBox(),
          ),
          OrderStateCheck(
            checkCount: 2,
            tickedsCount: null,
          ),
          AppSpacing.horizontal_5_5,
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
              3,
              (index) {
                return index != 2
                    ? OrderStateWDate()
                    : SizedBox(
                        height: 40.h,
                      );
              },
            ),
          ),
        ],
      ),
    );
  }
}
