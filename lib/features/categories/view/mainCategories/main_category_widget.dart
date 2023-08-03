import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hh_express/features/components/widgets/place_holder.dart';
import 'package:hh_express/helpers/spacers.dart';
import 'package:hh_express/settings/consts.dart';
import 'package:hh_express/settings/theme.dart';

class MainCategoriesWidget extends StatelessWidget {
  const MainCategoriesWidget({
    super.key,
    required this.subTitle,
  });

  final String subTitle;

  @override
  Widget build(BuildContext context) {
    const isLoading = false;
    return Container(
      width: 76.w,
      padding: AppPaddings.horiz_10half,
      margin: AppPaddings.top_6,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 55.sp,
            width: 55.sp,
            padding: AppPaddings.all_2,
            decoration: const BoxDecoration(
              color: AppColors.lightGrey,
              shape: BoxShape.circle,
            ),
            child: CircleAvatar(
              backgroundColor: AppColors.transparent,
              foregroundColor: AppColors.transparent,
              onForegroundImageError: (exception, stackTrace) {},
              foregroundImage: const CachedNetworkImageProvider(
                'https://docs.flutter.dev/assets/images/dash/dash-fainting.gif',
              ),
              child: MyShimerPlaceHolder(
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.shimmerBodyColor,
                  ),
                ),
              ),
            ),
          ),
          AppSpacing.vertical_10,
          Center(
            child: isLoading
                ? SizedBox(
                    height: 12,
                    child: MyShimerPlaceHolder(
                      radius: AppBorderRadiuses.border_2,
                    ),
                  )
                : Text(
                    subTitle,
                    style: AppTheme.bodyMedium10(context),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                  ),
          ),
        ],
      ),
    );
  }
}
