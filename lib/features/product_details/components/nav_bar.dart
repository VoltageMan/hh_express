import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hh_express/features/cart/cubit/cart_cubit.dart';
import 'package:hh_express/features/components/my_text_button.dart';
import 'package:hh_express/features/components/widgets/nav_bar_body.dart';
import 'package:hh_express/features/product_details/bloc/product_details_bloc.dart';
import 'package:hh_express/features/product_details/components/counter_button.dart';
import 'package:hh_express/helpers/extentions.dart';
import 'package:hh_express/helpers/modal_sheets.dart';
import 'package:hh_express/helpers/overlay_helper.dart';
import 'package:hh_express/helpers/spacers.dart';
import 'package:hh_express/models/cart/cart_update/cart_update_model.dart';
import 'package:hh_express/settings/enums.dart';

class ProdDetailsBottomBar extends StatefulWidget {
  const ProdDetailsBottomBar({
    super.key,
    required this.id,
  });
  final int id;

  @override
  State<ProdDetailsBottomBar> createState() => _ProdDetailsBottomBarState();
}

class _ProdDetailsBottomBarState extends State<ProdDetailsBottomBar> {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return BlocBuilder<ProductDetailsBloc, ProductDetailsState>(
      builder: (context, state) {
        if (state.state != ProdDetailsAPIState.succses)
          return Container(
            height: 72.h,
            color: Colors.transparent,
          );
        final cartCubit = context.read<CartCubit>();
        final quantity = cartCubit.getQuantity(widget.id);
        return NavBarBody(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: MyDarkTextButton(
                  title: l10n.buy,
                  onTap: () {
                    ModelBottomSheetHelper.showBuyProd();
                  },
                ),
              ),
              AppSpacing.horizontal_16,
              Expanded(
                child: CounterButton(
                  quantity: quantity,
                  title: l10n.addToCart,
                  onAdd: () {
                    if (cartCubit.state == CartAPIState.unAuthorized) {
                      SnackBarHelper.showMessageSnack('Un Authorized');
                      return;
                    }
                    cartCubit.cartUpdate(
                      CartUpdateModel(
                        productId: widget.id,
                        properties: List.empty(),
                        quantity: quantity + 1,
                      ),
                    );
                  },
                  onRemove: () {
                    cartCubit.cartUpdate(
                      CartUpdateModel(
                        productId: widget.id,
                        properties: [],
                        quantity: quantity - 1,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
