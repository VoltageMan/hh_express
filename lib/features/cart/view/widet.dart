import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hh_express/features/cart/view/cart_count.dart';
import 'package:hh_express/features/components/widgets/place_holder.dart';
import 'package:hh_express/features/components/widgets/svg_icons.dart';
import 'package:hh_express/helpers/extentions.dart';
import 'package:hh_express/settings/consts.dart';
import 'package:hh_express/settings/theme.dart';

class CartWidget extends StatelessWidget {
  const CartWidget({super.key});
  
  @override
  Widget build(BuildContext context) {
    const isLoading = 1 == 1;
    return Container(
      margin: AppPaddings.left20_right12.add(AppPaddings.top_16),
      decoration: BoxDecoration(
        borderRadius: AppBorderRadiuses.border_6,
        border: AppBorderRadiuses.defBorder,
      ),
      child: Row(
        children: [
          Container(
            height: 110.h,
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
              borderRadius: BorderRadius.horizontal(
                left: Radius.circular(5.r),
              ),
              child: isLoading
                  ? const MyShimerPlaceHolder()
                  : CachedNetworkImage(
                      imageUrl: AssetsPath.macBook,
                      fit: BoxFit.cover,
                      placeholder: (context, url) =>
                          const MyShimerPlaceHolder(),
                    ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: AppPaddings.vertic_12.add(AppPaddings.horiz_12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: isLoading
                            ? MyShimerPlaceHolder(
                                height: 21.h,
                                radius: AppBorderRadiuses.border_4,
                              )
                            : Text(
                                'MacBook  2023',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: AppTheme.titleMedium16(context),
                              ),
                      ),
                      MyImageIcon(
                        path: AssetsPath.deleteIcon,
                        color: AppColors.darkGrey,
                        contSize: 24.sp,
                        iconSize: 19.sp,
                      ),
                    ],
                  ),
                  Padding(
                    padding: AppPaddings.vertic_6,
                    child: isLoading
                        ? MyShimerPlaceHolder(
                            height: 21.h,
                            radius: AppBorderRadiuses.border_4,
                          )
                        : Text(
                            '700.12 TMT',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: AppTheme.titleMedium14(context),
                          ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: isLoading
                            ? MyShimerPlaceHolder(
                                height: 21.h,
                                radius: AppBorderRadiuses.border_4,
                              )
                            : Text(
                                'Halanlaryma gos',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: context.theme.textTheme.bodySmall,
                              ),
                      ),
                      isLoading ? SizedBox() : CartCountButton(),
                    ],
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
