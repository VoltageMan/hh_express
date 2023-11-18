import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hh_express/features/components/widgets/place_holder.dart';
import 'package:hh_express/features/favors/components/favors_widget.dart';
import 'package:hh_express/features/orders/view/details/orderInfo/order_info_widget.dart';
import 'package:hh_express/features/orders/view/details/orderStateWidget/order_state_widget.dart';
import 'package:hh_express/features/orders/view/details/orders_app_bar.dart';
import 'package:hh_express/helpers/extentions.dart';
import 'package:hh_express/settings/consts.dart';
import 'package:hh_express/settings/theme.dart';

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final titlesTheme = AppTheme.titleMedium16(context);
    const isLoading = true;
    return Scaffold(
      appBar: const OrderDetailsAppBar(),
      body: isLoading
          ? _LoadingBody()
          : ListView.custom(
              childrenDelegate: SliverChildListDelegate(
                [
                  const OrderStateWidget(
                    prod: 2,
                  ),
                  Padding(
                    padding: AppPaddings.left_18.copyWith(bottom: 12.h),
                    child: Text(
                      context.l10n.products,
                      style: titlesTheme,
                    ),
                  ),
                  ...List.generate(
                    2,
                    (index) => FavorsWidget(
                      isFavor: index != 0,
                    ),
                  ),
                  Padding(
                    padding: AppPaddings.left_18,
                    child: Text(
                      'Gelmeli wagty',
                      style: titlesTheme,
                    ),
                  ),
                  const OrderInfoWidget(prod: 2)
                ],
              ),
            ),
    );
  }
}

class _LoadingBody extends StatelessWidget {
  const _LoadingBody();

  @override
  Widget build(BuildContext context) {
    return ListView.custom(
      childrenDelegate: SliverChildListDelegate(
        [
          const OrderStateWidget(),
          Padding(
            padding: AppPaddings.left_18.copyWith(bottom: 12.h),
            child: MyShimerPlaceHolder(
              height: 23.h,
              margin: EdgeInsets.only(right: 260.w),
              width: 25.w,
              radius: AppBorderRadiuses.border_4,
            ),
          ),
          ...List.generate(
            2,
            (index) => FavorsWidget(isFavor: index != 0),
          ),
          Padding(
            padding: AppPaddings.left_18,
            child: MyShimerPlaceHolder(
              height: 23.h,
              margin: EdgeInsets.only(right: 260.w),
              width: 25.w,
              radius: AppBorderRadiuses.border_4,
            ),
          ),
          const OrderInfoWidget()
        ],
      ),
    );
  }
}
