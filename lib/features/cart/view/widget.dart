import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hh_express/features/cart/cubit/cart_cubit.dart';
import 'package:hh_express/features/cart/view/cart_count.dart';
import 'package:hh_express/features/components/widgets/place_holder.dart';
import 'package:hh_express/features/components/widgets/svg_icons.dart';
import 'package:hh_express/helpers/extentions.dart';
import 'package:hh_express/helpers/modal_sheets.dart';
import 'package:hh_express/helpers/spacers.dart';
import 'package:hh_express/models/cart/cart_order_model/cart_order_model.dart';
import 'package:hh_express/models/cart/cart_update/cart_update_model.dart';
import 'package:hh_express/settings/consts.dart';
import 'package:hh_express/settings/theme.dart';

class CartWidget extends StatefulWidget {
  CartWidget({
    required this.model,
  });
  CartOrderModel model;
  @override
  State<CartWidget> createState() => _CartWidgetState();
}

class _CartWidgetState extends State<CartWidget> {
  double getSize() {
    final paddings = 50.h;
    final textSizes = AppSpacing.getTextHeight(42);
    final height = paddings + textSizes;
    return height;
  }

  late CartOrderModel model = widget.model;
  late final product = model.product;
  late final cubit = context.read<CartCubit>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        ModelBottomSheetHelper.showBuyProd();
      },
      child: Container(
        width: 360.w,
        height: getSize(),
        alignment: Alignment.center,
        margin: AppPaddings.left20_right12.add(AppPaddings.top_16),
        decoration: BoxDecoration(
          borderRadius: AppBorderRadiuses.border_6,
          border: AppBorderRadiuses.defBorder,
        ),
        child: Row(
          children: [
            Container(
              height: double.infinity,
              width: 95.w,
              decoration: BoxDecoration(
                border: Border(
                  right: BorderSide(
                    color: AppColors.lightGrey,
                    width: 1.5.w,
                  ),
                ),
              ),
              child: ClipRRect(
                borderRadius:
                    BorderRadius.horizontal(left: Radius.circular(5.r)),
                child: CachedNetworkImage(
                  imageUrl: product.image,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => MyShimerPlaceHolder(
                    radius: BorderRadius.horizontal(
                      left: Radius.circular(5.r),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: AppPaddings.vertic_12.add(AppPaddings.horiz_12),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                product.name,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: AppTheme.titleMedium16(context),
                              ),
                              Padding(
                                padding: AppPaddings.vertic_6,
                                child: Text(
                                  '${AppPaddings.thousandsSeperator(product.salePrice)} TMT',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: AppTheme.titleMedium14(context),
                                ),
                              ),
                            ],
                          ),
                        ),
                        MyImageIcon(
                          path: AssetsPath.deleteIcon,
                          color: AppColors.darkGrey,
                          contSize: 24.sp,
                          iconSize: 19.sp,
                          onTap: () async {
                            final cubit = context.read<CartCubit>();
                            await cubit.cartUpdate(
                              CartUpdateModel(
                                productId: product.id,
                                properties:
                                    model.selectedPropsId ?? List.empty(),
                                quantity: 0,
                              ),
                            );
                            print('hii');
                          },
                        ),
                      ],
                    ),
                    Expanded(
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            'Halanlaryma goş',
                            style: context.theme.textTheme.bodySmall,
                          ),
                          SizedBox(
                            width: 23.w,
                          ),
                          CartCount(
                            count: model.quantity,
                            onAdd: () async {
                              final newCount = model.quantity + 1;
                              final val = await cubit.cartUpdate(
                                CartUpdateModel(
                                  productId: product.id,
                                  properties:
                                      model.selectedPropsId ?? List.empty(),
                                  quantity: newCount,
                                ),
                              );
                              if (val) {
                                model = model.copyWith(quantity: newCount);
                              }
                            },
                            onRemove: () async {
                              final newCount = model.quantity - 1;
                              final val = await cubit.cartUpdate(
                                CartUpdateModel(
                                  productId: product.id,
                                  properties:
                                      model.selectedPropsId ?? List.empty(),
                                  quantity: newCount,
                                ),
                              );
                              if (val) {
                                model = model.copyWith(quantity: newCount);
                              }
                            },
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
