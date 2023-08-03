import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hh_express/features/cart/view/cart_count.dart';
import 'package:hh_express/features/components/widgets/place_holder.dart';
import 'package:hh_express/features/components/widgets/svg_icons.dart';
import 'package:hh_express/helpers/extentions.dart';
import 'package:hh_express/settings/consts.dart';
import 'package:hh_express/settings/theme.dart';

class CartWidget extends StatefulWidget {
  const CartWidget({super.key});

  @override
  State<CartWidget> createState() => _CartWidgetState();
}

class _CartWidgetState extends State<CartWidget> {
  double? height;
  @override
  Widget build(BuildContext context) {
    final mqWidth = MediaQuery.sizeOf(context).width;
    '$mqWidth ww'.log();
    return Container(
      alignment: Alignment.center,
      margin: AppPaddings.left20_right12.add(AppPaddings.top_16),
      decoration: BoxDecoration(
        borderRadius: AppBorderRadiuses.border_6,
        border: AppBorderRadiuses.defBorder,
      ),
      child: Row(
        children: [
          Container(
            height: height ?? 105.h,
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
              borderRadius: BorderRadius.horizontal(left: Radius.circular(5.r)),
              child: CachedNetworkImage(
                imageUrl: AssetsPath.macBook,
                fit: BoxFit.cover,
                placeholder: (context, url) => MyShimerPlaceHolder(
                  radius: BorderRadius.horizontal(
                    left: Radius.circular(5.r),
                  ),
                ),
              ),
            ),
          ),
          MeasureSize(
            onChange: (size) {
              if (height != null) {
                return;
              }
              setState(() {
                height = size.height..log();
              });
            },
            child: Padding(
              padding: AppPaddings.vertic_12.add(AppPaddings.horiz_12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 200.w,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'MacBook  2023',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: AppTheme.titleMedium16(context),
                        ),
                        MyImageIcon(
                          path: AssetsPath.deleteIcon,
                          color: AppColors.darkGrey,
                          contSize: 24.sp,
                          iconSize: 19.sp,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: AppPaddings.vertic_6,
                    child: Text(
                      '700.12 TMT',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppTheme.titleMedium14(context),
                    ),
                  ),
                  SizedBox(
                    width: 200.w,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Halanlaryma gos',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: context.theme.textTheme.bodySmall,
                        ),
                        CartCountButton(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
