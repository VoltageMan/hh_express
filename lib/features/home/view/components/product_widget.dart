import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hh_express/features/components/widgets/place_holder.dart';
import 'package:hh_express/helpers/extentions.dart';
import 'package:hh_express/helpers/routes.dart';
import 'package:hh_express/models/profile/user/user_model.dart';
import 'package:hh_express/settings/consts.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:hh_express/settings/theme.dart';

class HomeProdWidget extends StatelessWidget {
  const HomeProdWidget({super.key, required this.index, this.prod});
  final int index;
  final dynamic prod;
  @override
  Widget build(BuildContext context) {
    final hasDiscount = index % 2 == 1;
    final isLoading = prod != null;
    return GestureDetector(
      onTap: () {
        appRouter.location.log();
        AppRoutes.navBar.first.log();
        // final user = UserModel(
        //   entity: '99361616161',
        //   id: 2,
        //   name: 'IronMan',
        //   password: 'ArcalykWoda',
        // );
        // 'sssososo'.log();
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
              height: 150.h,
              decoration: BoxDecoration(
                color: AppColors.lightGrey,
                borderRadius: AppBorderRadiuses.border_6,
              ),
              padding: EdgeInsets.symmetric(vertical: 1.5.h, horizontal: 1.w),
              margin: EdgeInsets.only(bottom: 10.h),
              child: isLoading
                  ? MyShimerPlaceHolder(
                      radius: BorderRadius.circular(4.r),
                    )
                  : ClipRRect(
                      borderRadius: AppBorderRadiuses.border_4,
                      child: CachedNetworkImage(
                        imageUrl: index % 2 == 0
                            ? AssetsPath.exampleImage1
                            : AssetsPath.exampleImage2,
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
                    'Луис вуитон коллобарация с гуччи пздц вешь',
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(fontSize: 13.sp),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
            isLoading
                ? MyShimerPlaceHolder(
                    margin: AppPaddings.vertic_10,
                    radius: AppBorderRadiuses.border_2,
                    height: 28.h,
                  )
                : Container(
                    margin: AppPaddings.vertic_10,
                    child: Text(
                      index % 2 == 0
                          ? 'hii'
                          : 'Lorem Ipsum Dolar sit amet dalse huy znaet, i tak dlya testa some text here is its is',
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
                            '509 TMT',
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
                                  '700Tmt',
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
