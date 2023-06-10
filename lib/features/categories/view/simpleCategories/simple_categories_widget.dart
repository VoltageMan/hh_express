import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hh_express/features/components/widgets/place_holder.dart';
import 'package:hh_express/settings/consts.dart';
import 'package:hh_express/settings/theme.dart';

class SimpleCategoryWidget extends StatelessWidget {
  const SimpleCategoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    const isLoading = 1 == 2;
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: AppPaddings.horiz_4,
        decoration: BoxDecoration(
          color: AppColors.lightGrey,
          borderRadius: AppBorderRadiuses.border_6,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: AppBorderRadiuses.top_6,
              child: CachedNetworkImage(
                  height: 60.h,
                  fit: BoxFit.cover,
                  imageUrl:
                      'https://cdn.pixabay.com/photo/2020/05/31/16/53/bookmarks-5243253_640.jpg',
                  placeholder: (context, url) => const MyShimerPlaceHolder(),
                  errorWidget: (context, url, error) =>
                      const MyShimerPlaceHolder(),
                  imageBuilder: isLoading
                      ? (context, imageProvider) => const MyShimerPlaceHolder()
                      : null),
            ),
            Expanded(
              child: Container(
                padding: isLoading ? AppPaddings.all_6 : AppPaddings.all_2,
                alignment: Alignment.center,
                child: isLoading
                    ? MyShimerPlaceHolder(
                        radius: AppBorderRadiuses.border_2,
                      )
                    : Text(
                        'Gyshky eşik',
                        style: AppTheme.bodyMedium10(context),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
