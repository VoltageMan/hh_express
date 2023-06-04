import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hh_express/features/widgets/place_holder.dart';
import 'package:hh_express/settings/consts.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:hh_express/settings/theme.dart';

class HomeProdWidget extends StatelessWidget {
  const HomeProdWidget({super.key, required this.index});
  final int index;
  static const hasDiscount = true;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 12.h,
        left: index % 2 == 0 ? 16.w : 4.w,
        right: index % 2 == 1 ? 16.w : 4.w,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              color: AppColors.lightGrey,
              borderRadius: AppBorderRadiuses.borderRadius_6circular,
            ),
            padding: EdgeInsets.all(1.5.sp),
            margin: EdgeInsets.only(bottom: 10.h),
            child: ClipRRect(
              borderRadius: AppBorderRadiuses.borderRadius_4circular,
              child: CachedNetworkImage(
                imageUrl: index % 2 == 0
                    ? 'https://docs.flutter.dev/assets/images/dash/dash-fainting.gif'
                    : 'https://cdn.pixabay.com/photo/2020/05/31/16/53/bookmarks-5243253_640.jpg',
                placeholder: (context, url) {
                  return const MyShimerPlaceHolder();
                },
                imageBuilder: (context, imageProvider) {
                  return MyShimerPlaceHolder();
                },
                fit: BoxFit.cover,
              ),
            ),
          ),
          Text(
            'Луис вуитон коллобарация с гуччи пздц вешь',
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(fontSize: 13.sp),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10.h),
            child: Text(
              'Lorem Ipsum Dolar sit amet dalse huy znaet, i tak dlya testa some text here is its is',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            width: double.infinity,
            child: Row(
              children: [
                FittedBox(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '509 Tmt',
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
                          '700 Tmt',
                          style: AppTheme.lineThroughTitleSmall(context),
                          textAlign: TextAlign.start,
                        ),
                      )
                    : const SizedBox(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
