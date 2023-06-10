import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hh_express/features/components/widgets/place_holder.dart';
import 'package:hh_express/settings/consts.dart';
import 'package:hh_express/settings/theme.dart';

class MainCategoriesWidget extends StatelessWidget {
  const MainCategoriesWidget({
    super.key,
    required this.isFirst,
    required this.isLast,
    required this.isSelected,
  });
  final bool isFirst;
  final bool isLast;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    const isLoading = 1 == 2;
    return Container(
      width: 76.w,
      height: 90.h,
      padding: AppPaddings.horiz_10half,
      margin: isFirst
          ? AppPaddings.left_16
          : isLast
              ? AppPaddings.right_16
              : null,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 55.h,
            padding: AppPaddings.all_2,
            decoration: const BoxDecoration(
              color: AppColors.lightGrey,
              shape: BoxShape.circle,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(9999.r),
              child: CachedNetworkImage(
                fit: BoxFit.cover,
                imageUrl:
                    'https://cdn.pixabay.com/photo/2020/05/31/16/53/bookmarks-5243253_640.jpg',
                placeholder: (context, url) => const MyShimerPlaceHolder(),
                errorWidget: (context, url, error) =>
                    const MyShimerPlaceHolder(),
                imageBuilder: isLoading
                    ? (context, imageProvider) => const MyShimerPlaceHolder()
                    : null,
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: isLoading
                  ? SizedBox(
                      height: 12,
                      child: MyShimerPlaceHolder(
                        radius: AppBorderRadiuses.border_2,
                      ),
                    )
                  : Text(
                      'iPhone we macbooks',
                      style: AppTheme.bodyMedium10(context),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                    ),
            ),
          ),
          !isLoading && isSelected
              ? Container(
                  height: 2.h,
                  decoration: BoxDecoration(
                    color: AppColors.darkBlue,
                    borderRadius: AppBorderRadiuses.border_2,
                  ),
                )
              : const SizedBox()
        ],
      ),
    );
  }
}
