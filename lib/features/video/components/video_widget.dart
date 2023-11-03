import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hh_express/features/components/widgets/place_holder.dart';
import 'package:hh_express/helpers/extentions.dart';
import 'package:hh_express/helpers/routes.dart';
import 'package:hh_express/settings/consts.dart';
import 'dart:math' as random show Random;

class VideoWidget extends StatelessWidget {
  const VideoWidget({super.key, required this.index, this.videoModel});
  final int index;
  final dynamic videoModel;

  @override
  Widget build(BuildContext context) {
    final isLoading = true;
    if (isLoading) {
      return _WidgetsPlaceHolder(index: index);
    }
    return GestureDetector(
      onTap: () {
        appRouter.currentContext.push(AppRoutes.videoDetails);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: AppPaddings.bottom_10,
            height: index % 2 == 0 ? 205.h : 107.h,
            child: Stack(
              alignment: Alignment.topLeft,
              children: [
                ClipRRect(
                  borderRadius: AppBorderRadiuses.border_6,
                  child: CachedNetworkImage(
                    height: index % 2 == 0 ? 205.h : 107.h,
                    imageUrl: AssetsPath.exampleImage2,
                    errorWidget: (context, url, error) =>
                        const MyShimerPlaceHolder(),
                    placeholder: (context, url) => const MyShimerPlaceHolder(),
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  margin: AppPaddings.all_6,
                  padding: AppPaddings.horiz6_vertic3,
                  decoration: BoxDecoration(
                      color: AppColors.darkBlue.withOpacity(.6),
                      borderRadius: AppBorderRadiuses.border_4),
                  child: Text(
                    '00:$index',
                    style: context.theme.textTheme.labelLarge,
                  ),
                )
              ],
            ),
          ),
          Text(
            random.Random().nextBool()
                ? 'hii'
                : 'Lorem Ipsum Dolar sit amet dalse huy znaet, i tak dlya testa some text here is its is',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ],
      ),
    );
  }
}

class _WidgetsPlaceHolder extends StatelessWidget {
  const _WidgetsPlaceHolder({
    required this.index,
  });
  final int index;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: AppPaddings.bottom_10,
          height: index % 2 == 0 ? 205.h : 107.h,
          child: Stack(
            alignment: Alignment.topLeft,
            children: [
              ClipRRect(
                borderRadius: AppBorderRadiuses.border_6,
                child: MyShimerPlaceHolder(),
              ),
              Container(
                  margin: AppPaddings.all_6,
                  decoration: BoxDecoration(
                      color: AppColors.darkBlue.withOpacity(.6),
                      borderRadius: AppBorderRadiuses.border_4),
                  child: MyShimerPlaceHolder(
                    radius: AppBorderRadiuses.border_4,
                    height: 28.h,
                    width: 55.w,
                  ))
            ],
          ),
        ),
        MyShimerPlaceHolder(
          radius: AppBorderRadiuses.border_4,
          height: 28.h,
        )
      ],
    );
  }
}
