import 'package:flutter/material.dart';
import 'package:hh_express/features/components/my_text_button.dart';
import 'package:hh_express/features/components/widgets/nav_bar_body.dart';
import 'package:hh_express/features/productDetails/components/counter_button.dart';
import 'package:hh_express/helpers/extentions.dart';
import 'package:hh_express/helpers/spacers.dart';

class BuyProdBottomBar extends StatelessWidget {
  const BuyProdBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return NavBarBody(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: CounterButton(
              initCount: 1,
              title: 'bohoheyt',
              onAdd: (some) {},
              onRemove: (count) {
                // if count == 0 pop
                'kku'.log();
              },
            ),
          ),
          AppSpacing.horizontal_16,
          Expanded(
            child: MyDarkTextButton(
              title: l10n.buy,
              onTap: () {},
            ),
          ),
        ],
      ),
    );
  }
}
