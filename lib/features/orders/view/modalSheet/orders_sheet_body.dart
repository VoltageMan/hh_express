import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hh_express/features/components/my_text_button.dart';
import 'package:hh_express/features/components/widgets/nav_bar_body.dart';
import 'package:hh_express/features/components/widgets/sheet_titles.dart';
import 'package:hh_express/features/orders/view/modalSheet/orders_widget.dart';
import 'package:hh_express/helpers/extentions.dart';
import 'package:hh_express/helpers/spacers.dart';

class OrdersSheetBody extends StatelessWidget {
  const OrdersSheetBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BottomSheetTitle(
          title: context.l10n.myOrders,
          isPadded: true,
        ),
        AppSpacing.vertical_10,
        SizedBox(
          height: 434.h,
          child: ListView.builder(
            itemBuilder: (context, index) {
              return const OrdersWidget(
                order: 2,
              );
            },
          ),
        ),
        NavBarBody(
          child: MyDarkTextButton(
            title: context.l10n.clear,
            onTap: () {
              Navigator.pop(context);
            },
          ),
        )
      ],
    ).toSingleChildScrollView;
  }
}
