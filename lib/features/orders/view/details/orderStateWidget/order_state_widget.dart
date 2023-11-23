import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hh_express/features/orders/view/details/orderStateWidget/order_state_check.dart';
import 'package:hh_express/features/orders/view/details/orderStateWidget/state_date_wiget.dart';
import 'package:hh_express/helpers/extentions.dart';
import 'package:hh_express/helpers/spacers.dart';
import 'package:hh_express/models/cart/cart_model/cart_model.dart';
import 'package:hh_express/settings/consts.dart';

class OrderStateWidget extends StatefulWidget {
  const OrderStateWidget({
    super.key,
    this.models,
  });
  final List<OrderStateModel>? models;
  static double? _maxHeihgt;
  @override
  State<OrderStateWidget> createState() => _OrderStateWidgetState();
}

class _OrderStateWidgetState extends State<OrderStateWidget> {
  bool isLoading = true;
  bool loadingWent = false;
  @override
  void initState() {
    super.initState();
    if (OrderStateWidget._maxHeihgt == null) {
      WidgetsBinding.instance.addPostFrameCallback((_) => setMaxHeihgt());
    }
  }

  void setMaxHeihgt() {
    if (OrderStateWidget._maxHeihgt != null || !mounted) return;
    OrderStateWidget._maxHeihgt = context.size?.height;
  }

  int get getTickCount {
    int length = 0;
    for (var i in widget.models!) {
      if (i.completed_at == null) return length;
    }
    return length;
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = widget.models == null;
    return GestureDetector(
      onTap: () {
        OrderStateWidget._maxHeihgt.log();
      },
      child: Container(
        height: OrderStateWidget._maxHeihgt,
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
                    models: List.from(widget.models!)..removeRange(3, 6),
                    maxHeight: OrderStateWidget._maxHeihgt,
                    isLoading: false,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(
                        3,
                        (index) => OrderStateWDate(
                          model: widget.models![index],
                        ),
                      ),
                    ),
                  ),
                  AppSpacing.horizontal_12,
                  OrderStateCheck(
                    models: (List.from(widget.models!)..removeRange(0, 4)),
                    maxHeight: OrderStateWidget._maxHeihgt,
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
                                model: widget.models![5 - index],
                              ),
                      ),
                    ),
                  ),
                ],
              ),
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
