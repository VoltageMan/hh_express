import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hh_express/features/components/widgets/place_holder.dart';
import 'package:hh_express/features/orders/components/dashed_line.dart';
import 'package:hh_express/features/orders/components/order_info_list_tile.dart';
import 'package:hh_express/helpers/extentions.dart';
import 'package:hh_express/helpers/routes.dart';
import 'package:hh_express/settings/consts.dart';

class OrdersWidget extends StatelessWidget {
  const OrdersWidget({super.key, this.order});
  final dynamic order;
  @override
  Widget build(BuildContext context) {
    final isLoading = order == null;
    final theme = Theme.of(context);

    final l10n = context.l10n;
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
        appRouter.routerDelegate.navigatorKey.currentContext!
            .push(AppRoutes.orderDetails);
      },
      child: Container(
        margin: AppPaddings.horiz_16.copyWith(bottom: 16.h),
        decoration: BoxDecoration(
          borderRadius: AppBorderRadiuses.border_6,
          border: Border.all(
            color: AppColors.lightGrey,
            width: 1.5.sp,
          ),
        ),
        padding: AppPaddings.all_16,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            isLoading
                ? SizedBox(
                    width: 150.w,
                    child: MyShimerPlaceHolder(
                      height: 18.h,
                      radius: AppBorderRadiuses.border_4,
                    ),
                  )
                : FittedBox(
                    child: Text(
                      'LQNSU346JK ',
                      style: theme.textTheme.titleLarge,
                      maxLines: 1,
                    ),
                  ),
            Padding(
              padding: AppPaddings.top15_bottom19,
              child: isLoading
                  ? SizedBox(
                      width: 115.w,
                      child: MyShimerPlaceHolder(
                        height: 18.h,
                        radius: AppBorderRadiuses.border_4,
                      ),
                    )
                  : Text(
                      '10.04.2023',
                      style: theme.textTheme.displaySmall,
                    ),
            ),
            DashedLine(
              isLoading: isLoading,
            ),
            for (int i = 0; i < 3; i++)
              OrderInfoListTile(
                title: i == 2 ? l10n.price : context.l10n.orderState,
                content: isLoading
                    ? null
                    : i == 2
                        ? '700 TMT'
                        : 'geldi',
                contentBold: i == 2 ? true : null,
              ),
          ],
        ),
      ),
    );
  }
}
