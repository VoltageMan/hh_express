import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hh_express/features/cart/cubit/cart_cubit.dart';
import 'package:hh_express/features/cart/view/cart_info_widget.dart';
import 'package:hh_express/features/cart/view/widget.dart';
import 'package:hh_express/features/categories/view/body.dart';
import 'package:hh_express/features/product_details/view/product_details_body.dart';
import 'package:hh_express/settings/enums.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        if (state.apiState == CartAPIState.init) return SizedBox();
        if (state.apiState == CartAPIState.loading) return CenterLoading();
        if (state.apiState == CartAPIState.error)
          return CategoryErrorBody(
            onTap: () {
              context.read<CartCubit>().getCurrentCart();
            },
          );
        if (state.apiState == CartAPIState.unAuthorized) {
          return Center(
            child: Text(
              'un Authorized',
            ),
          );
        }
        if (state.cart!.orders.isEmpty) {
          return Center(
            child: Text('Cart is empty'),
          );
        }
        return ListView.custom(
          childrenDelegate: SliverChildListDelegate(
            [
              for (var i in state.cart!.orders)
                CartWidget(
                  model: i,
                ),
              CartInfoWidget(
                model: state.cart,
              ),
            ],
          ),
        );
      },
    );
  }
}
