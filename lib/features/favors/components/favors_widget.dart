import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hh_express/features/components/widgets/favors_image.dart';
import 'package:hh_express/features/components/widgets/place_holder.dart';
import 'package:hh_express/features/components/widgets/svg_icons.dart';
import 'package:hh_express/helpers/extentions.dart';
import 'package:hh_express/helpers/spacers.dart';
import 'package:hh_express/settings/consts.dart';
import 'package:hh_express/settings/theme.dart';

class FavorsWidget extends StatelessWidget {
  const FavorsWidget({super.key, this.isFavor, this.prod});
  final bool? isFavor;
  final dynamic prod;
  @override
  Widget build(BuildContext context) {
    final isLoading = prod == null;
    if (isLoading) return _LoadingWidget();
    return GestureDetector(
      onTap: () {
        'hello'.log();
      },
      child: Container(
        margin: AppPaddings.horiz16_botto10,
        height: 100.h,
        padding: AppPaddings.right_7,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: AppBorderRadiuses.border_6,
          border: AppBorderRadiuses.defBorder,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const FavorsImage(
              imgPath: 'Put Here Image Path',
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'MacBook  2023',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppTheme.titleMedium16(context),
                  ),
                  AppSpacing.vertical_7,
                  Text(
                    '700.12 TMT',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppTheme.titleMedium14(context),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                shadowColor: AppColors.transparent,
                side: BorderSide.none,
                disabledBackgroundColor: AppColors.white,
                shape: const CircleBorder(),
                padding: AppPaddings.all_5,
                minimumSize: const Size(0, 0),
                maximumSize: Size(35.w, 35.h),
                backgroundColor: AppColors.white,
                foregroundColor: Colors.grey.withOpacity(0.1),
              ),
              child: MyImageIcon(
                path: AssetsPath.favorIcon,
                color:
                    isFavor ?? true ? AppColors.mainOrange : AppColors.darkGrey,
                contSize: 24.sp,
                iconSize: 19.w,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _LoadingWidget extends StatelessWidget {
  const _LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: AppPaddings.horiz16_botto10,
      height: 100.h,
      padding: AppPaddings.right_7,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: AppBorderRadiuses.border_6,
        border: AppBorderRadiuses.defBorder,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const FavorsImage(),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MyShimerPlaceHolder(
                  height: 21.h,
                  radius: AppBorderRadiuses.border_4,
                ),
                AppSpacing.vertical_7,
                MyShimerPlaceHolder(
                  height: 21.h,
                  radius: AppBorderRadiuses.border_4,
                ),
              ],
            ),
          ),
          Padding(
            padding: AppPaddings.all_5,
            child: MyShimerPlaceHolder(
              child: MyImageIcon(
                path: AssetsPath.favorIcon,
                color: AppColors.shimmerBodyColor,
                contSize: 24.sp,
                iconSize: 19.w,
              ),
            ),
          )
        ],
      ),
    );
  }
}
