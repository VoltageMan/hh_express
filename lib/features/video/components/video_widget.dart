import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hh_express/features/components/widgets/place_holder.dart';
import 'package:hh_express/helpers/extentions.dart';
import 'package:hh_express/settings/consts.dart';

class VideoWidget extends StatelessWidget {
  const VideoWidget({super.key, required this.index, this.videoModel});
  final int index;
  final dynamic videoModel;

  @override
  Widget build(BuildContext context) {
    final isLoading = false;
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
                child: CachedNetworkImage(
                  height: index % 2 == 0 ? 205.h : 107.h,
                  imageUrl: index % 2 == 0
                      ? AssetsPath.exampleImage2
                      : AssetsPath.exampleImage1,
                  imageBuilder: (context, imageProvider) =>
                      const MyShimerPlaceHolder(),
                  errorWidget: (context, url, error) =>
                      const MyShimerPlaceHolder(),
                  placeholder: (context, url) => const MyShimerPlaceHolder(),
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                margin: AppPaddings.all_6,
                padding: isLoading ? null : AppPaddings.horiz6_vertic3,
                decoration: BoxDecoration(
                    color: AppColors.darkBlue.withOpacity(.6),
                    borderRadius: AppBorderRadiuses.border_4),
                child: isLoading
                    ? MyShimerPlaceHolder(
                        radius: AppBorderRadiuses.border_4,
                        height: 28.h,
                        width: 55.w,
                      )
                    : Text(
                        '00:$index',
                        style: context.theme.textTheme.labelLarge,
                      ),
              )
            ],
          ),
        ),
        isLoading
            ? MyShimerPlaceHolder(
                radius: AppBorderRadiuses.border_4,
                height: 28.h,
              )
            : Text(
                index % 2 == 0
                    ? 'hii'
                    : 'Lorem Ipsum Dolar sit amet dalse huy znaet, i tak dlya testa some text here is its is',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleSmall,
              ),
      ],
    );
  }
}

const myLovetoLeyli = true;
