import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hh_express/features/orders/view/details/orderStateWidget/order_state_check.dart';
import 'package:hh_express/features/orders/view/details/orderStateWidget/state_date_wiget.dart';
import 'package:hh_express/helpers/spacers.dart';
import 'package:hh_express/settings/consts.dart';

class OrderStateWidget extends StatefulWidget {
  const OrderStateWidget({
    super.key,
    this.prod,
  });
  final dynamic prod;

  @override
  State<OrderStateWidget> createState() => _OrderStateWidgetState();
}

class _OrderStateWidgetState extends State<OrderStateWidget> {
  double? maxHeight;
  bool isLoading = true;
  bool loadingWent = false;
  final key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final isLoading = widget.prod == null;
    return Container(
      key: key,
      height: maxHeight,
      margin: AppPaddings.all_16,
      padding: AppPaddings.horiz16_vertic12,
      decoration: BoxDecoration(
        borderRadius: AppBorderRadiuses.border_6,
        border: Border.all(
          color: AppColors.lightGrey,
          width: 1.5.sp,
        ),
      ),
      child: isLoading
          ? _LoadingWidget()
          : Row(
              children: [
                OrderStateCheck(
                  checkCount: 3,
                  tickedsCount: 3,
                  maxHeight: maxHeight,
                  isLoading: false,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(
                      3,
                      (index) => OrderStateWDate(
                        date: 'some',
                      ),
                    ),
                  ),
                ),
                AppSpacing.horizontal_12,
                OrderStateCheck(
                  checkCount: 2,
                  tickedsCount: 2,
                  maxHeight: maxHeight,
                  isLoading: false,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(
                      3,
                      (index) => index == 2
                          ? SizedBox(
                              height: AppSpacing.getTextHeight(12 * 2),
                            )
                          : OrderStateWDate(
                              date: 'some',
                            ),
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}

class _LoadingWidget extends StatefulWidget {
  const _LoadingWidget();

  @override
  State<_LoadingWidget> createState() => _LoadingWidgetState();
}

class _LoadingWidgetState extends State<_LoadingWidget> {
  double? maxHeight;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
              3,
              (index) => Padding(
                padding: index == 1 ? AppPaddings.vertic_24 : EdgeInsets.zero,
                child: OrderStateWDate(),
              ),
            ),
          ),
        ),
        AppSpacing.horizontal_12,
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
              3,
              (index) {
                return index == 2
                    ? SizedBox(
                        height: AppSpacing.getTextHeight(12 * 2),
                      )
                    : Padding(
                        padding: index == 1
                            ? AppPaddings.vertic_24
                            : EdgeInsets.zero,
                        child: OrderStateWDate(),
                      );
              },
            ),
          ),
        ),
      ],
    );
  }
}
