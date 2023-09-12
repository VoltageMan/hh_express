import 'package:flutter/material.dart';
import 'package:hh_express/features/cart/view/cart_info_widget.dart';
import 'package:hh_express/features/cart/view/widget.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return ListView.custom(
      childrenDelegate: SliverChildListDelegate(
        [
          for (int i = 0; i < 6; i++)
            CartWidget(
              i,
              onChange: (p0) {},
            ),
          const CartInfoWidget(
              // prod: 'Some',
              ),
        ],
      ),
    );
  }
}
