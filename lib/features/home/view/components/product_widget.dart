import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hh_express/features/components/widgets/place_holder.dart';
import 'package:hh_express/helpers/extentions.dart';
import 'package:hh_express/helpers/routes.dart';
import 'package:hh_express/models/products/product_model.dart';
import 'package:hh_express/settings/consts.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:hh_express/settings/theme.dart';

class HomeProdWidget extends StatelessWidget {
  const HomeProdWidget({super.key, required this.index, this.prod});
  final int index;
  final ProductModel? prod;
  @override
  Widget build(BuildContext context) {
    final isLoading = prod == null;
    final hasDiscount = prod?.discount == null;
    return GestureDetector(
      onTap: () {
        if (isLoading) return;
        appRouter.currentContext.push(AppRoutes.prodDetails);
      },
      child: Container(
        width: 160.w,
        margin: AppPaddings.homeProdmargin(index),
        padding: AppPaddings.homeProdPadding(index),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 200.h,
              decoration: BoxDecoration(
                color: AppColors.lightGrey,
                borderRadius: AppBorderRadiuses.border_6,
              ),
              padding: EdgeInsets.symmetric(vertical: 1.5.h, horizontal: 0.w),
              margin: EdgeInsets.only(bottom: 10.h),
              child: isLoading
                  ? MyShimerPlaceHolder(
                      radius: BorderRadius.circular(4.r),
                    )
                  : ClipRRect(
                      borderRadius: AppBorderRadiuses.border_4,
                      child: CachedNetworkImage(
                        imageUrl: prod!.image,
                        placeholder: (context, url) {
                          return const MyShimerPlaceHolder();
                        },
                        errorWidget: (context, url, error) =>
                            const MyShimerPlaceHolder(),
                        fit: BoxFit.cover,
                      ),
                    ),
            ),
            isLoading
                ? MyShimerPlaceHolder(
                    radius: AppBorderRadiuses.border_2,
                    height: 15.h,
                  )
                : Text(
                    '${prod?.name}',
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(fontSize: 13.sp),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
            isLoading
                ? MyShimerPlaceHolder(
                    margin: AppPaddings.vertic_6,
                    radius: AppBorderRadiuses.border_2,
                    height: 28.h,
                  )
                : Container(
                    margin: AppPaddings.vertic_6,
                    child: Text(
                      '${prod?.description}',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ),
            isLoading
                ? MyShimerPlaceHolder(
                    height: 17.h,
                    radius: AppBorderRadiuses.border_2,
                  )
                : Container(
                    alignment: Alignment.bottomCenter,
                    width: double.infinity,
                    child: Row(
                      children: [
                        FittedBox(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            '${prod?.salePrice} TMT',
                            style: Theme.of(context).textTheme.titleLarge,
                            textAlign: TextAlign.start,
                          ),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        hasDiscount
                            ? FittedBox(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  '${prod!.price} Tmt',
                                  style:
                                      AppTheme.lineThroughTitleSmall(context),
                                  textAlign: TextAlign.start,
                                ),
                              )
                            : const SizedBox(),
                      ],
                    ),
                  )
          ],
        ),
      ),
    );
  }
}
