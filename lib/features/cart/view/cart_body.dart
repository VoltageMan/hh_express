import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hh_express/data/local/secured_storage.dart';
import 'package:hh_express/data/remote/dio_client.dart';
import 'package:hh_express/features/cart/cubit/cart_cubit.dart';
import 'package:hh_express/features/cart/view/cart_info_widget.dart';
import 'package:hh_express/features/cart/view/widget.dart';
import 'package:hh_express/features/categories/view/body.dart';
import 'package:hh_express/features/components/my_text_button.dart';
import 'package:hh_express/features/product_details/view/product_details_body.dart';
import 'package:hh_express/helpers/extentions.dart';
import 'package:hh_express/helpers/overlay_helper.dart';
import 'package:hh_express/helpers/spacers.dart';
import 'package:hh_express/settings/consts.dart';
import 'package:hh_express/settings/enums.dart';

class CartScreen extends StatelessWidget with DioClientMixin {
  CartScreen({super.key});
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
        return Stack(
          alignment: Alignment.bottomCenter,
          children: [
            ListView.custom(
              childrenDelegate: SliverChildListDelegate(
                [
                  for (var i in state.cart!.orders)
                    CartWidget(
                      model: i,
                    ),
                  CartInfoWidget(
                    model: state.cart,
                  ),
                  AppSpacing.vertical_60,
                  AppSpacing.vertical_30,
                ],
              ),
            ),
            Padding(
              padding: AppPaddings.all_16,
              child: MyDarkTextButton(
                title: context.l10n.next,
                width: double.infinity,
                onTap: () async {
                  final str = 'uuid';
                  String? uuid = await LocalStorage.readStr(str);
                  if (uuid == null) {
                    try {
                      final response = await dio.post(
                        endPoint: EndPoints.crateAddres,
                        data: {
                          'address': 'hitrowka',
                        },
                      );
                      if (response.success) {
                        final data = response.data['address']['uuid'];
                        final save =
                            await LocalStorage.saveStr(key: 'uuid', val: data);
                        uuid = data;
                      } else {
                        SnackBarHelper.showMessageSnack(
                            'some things went wrong');
                      }
                    } catch (e) {
                      SnackBarHelper.showMessageSnack('some things went wrong');
                      return;
                    }
                  }
                  context.read<CartCubit>().complete(uuid ?? 'emty');
                },
              ),
            )
          ],
        );
      },
    );
  }
}
