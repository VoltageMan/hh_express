import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hh_express/app/setup.dart';
import 'package:hh_express/features/components/widgets/place_holder.dart';
import 'package:hh_express/helpers/extentions.dart';
import 'package:hh_express/helpers/routes.dart';
import 'package:hh_express/repositories/auth/auth_repositori.dart';
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
    final isLoading = false;
    return GestureDetector(
      onTap: () {
        // final user = UserModel(
        //   entity: '99361616161',
        //   id: 2,
        //   name: 'IronMan',
        //   password: 'ArcalykWoda',
        // );
        // 'sssososo'.log();
        final repo = getIt<AuthRepo>();
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
                    'Oglanlar üçin uzyn ýaşyl köýnek',
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
                          : 'Bu gaty gowy köýnek, marka öz harytlaryna garantiýa berýär we bu köýnegiň reňki ýaşyl',
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
