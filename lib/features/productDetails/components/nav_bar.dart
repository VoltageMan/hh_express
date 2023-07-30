import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hh_express/features/components/confirm_some.dart';
import 'package:hh_express/features/components/widgets/nav_bar_body.dart';
import 'package:hh_express/features/productDetails/components/counter_button.dart';
import 'package:hh_express/helpers/extentions.dart';
import 'package:hh_express/helpers/modal_sheets.dart';
import 'package:hh_express/helpers/spacers.dart';

class ProdDetailsBottomBar extends StatelessWidget {
  const ProdDetailsBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final soem = SliverChildBuilderDelegate(
      (context, index) {
        return SizedBox();
      },
    );
    return NavBarBody(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: ConfirmSomeTh(
              title: l10n.buy,
              onTap: () {
                ModelBottomSheetHelper.showBuyProd();
              },
            ),
          ),
          AppSpacing.horizontal_16,
          Expanded(
            child: CounterButton(
              title: l10n.addToCart,
              onAdd: (count) {
                '$count add'.log();
              },
              onRemove: (count) {
                '$count remm'.log();
              },
            ),
          ),
        ],
      ),
    );
  }
}

class MyWidget extends ScrollView {
  const MyWidget({super.key});

  @override
  List<Widget> buildSlivers(BuildContext context) {
    return [];
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
