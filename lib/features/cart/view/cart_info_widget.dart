import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hh_express/features/orders/components/dashed_line.dart';
import 'package:hh_express/features/orders/components/order_info_list_tile.dart';
import 'package:hh_express/helpers/extentions.dart';
import 'package:hh_express/settings/consts.dart';

class CartInfoWidget extends StatelessWidget {
  const CartInfoWidget({super.key, this.prod});
  final dynamic prod;
  @override
  Widget build(BuildContext context) {
    final isLoading = prod == null;
    if (isLoading) return _LoadingWidget();
    return Container(
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
      child: Column(
        children: [
          for (int i = 0; i < 3; i++)
            OrderInfoListTile(
              title: context.l10n.orderState,
              content: isLoading
                  ? null
                  : i == 0
                      ? 'geldi'
                      : 'LQNSU346JK',
            ),
          DashedLine(
            isLoading: false,
          ),
          OrderInfoListTile(
            title: 'Jemi bahasy',
            content: isLoading ? null : '643 TMT',
            contentBold: true,
            titleBold: true,
          )
        ],
      ),
    );
  }
}

final class _LoadingWidget extends StatelessWidget {
  const _LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: Column(
        children: [
          for (int i = 0; i < 3; i++)
            OrderInfoListTile(
              title: null,
              content: null,
            ),
          DashedLine(
            isLoading: true,
          ),
          OrderInfoListTile(
            title: null,
            content: null,
            contentBold: true,
            titleBold: true,
          )
        ],
      ),
    );
  }
}
