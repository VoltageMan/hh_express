import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hh_express/features/categories/view/body.dart';
import 'package:hh_express/features/direct_order/cubit/direct_order_cubit.dart';
import 'package:hh_express/features/product_details/view/modalSheet/product_modal_body.dart';
import 'package:hh_express/features/product_details/view/product_details_body.dart';
import 'package:hh_express/models/bill_moedl.dart';
import 'package:hh_express/models/cart/cart_update/cart_update_model.dart';
import 'package:hh_express/settings/enums.dart';

class DirectOrderSheetBody extends StatelessWidget {
  const DirectOrderSheetBody({super.key, required this.model});
  final CartUpdateModel model;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DirectOrderCubit()..init(model),
      child: BlocBuilder<DirectOrderCubit, DirectOrderState>(
        bloc: context.read<DirectOrderCubit>(),
        builder: (context, state) {
          final apiState = state.apiState;
          if (apiState == APIState.init) return SizedBox();
          if (apiState == APIState.loading) return CenterLoading();
          if (apiState == APIState.error) return CategoryErrorBody();
          return BuyProdSheetBody(
            model: state.cartModel!.orders.first,
            bill: BillModel.fromCartModel(state.cartModel!),
          );
        },
      ),
    );
  }
}
