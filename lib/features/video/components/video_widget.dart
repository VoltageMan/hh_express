import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hh_express/features/components/widgets/place_holder.dart';
import 'package:hh_express/helpers/extentions.dart';
import 'package:hh_express/helpers/routes.dart';
import 'package:hh_express/models/videos/video_model.dart';
import 'package:hh_express/settings/consts.dart';

class VideoWidget extends StatefulWidget {
  const VideoWidget({super.key, required this.index, this.model});
  final int index;
  final HomeVideoModel? model;

  @override
  State<VideoWidget> createState() => _VideoWidgetState();
}

class _VideoWidgetState extends State<VideoWidget> {
  @override
  void initState() {
    aspect = !(widget.index % 2 == 0) ? 160 / 107 : 160 / 205;
    super.initState();
  }

  late final double aspect;

  late final model = widget.model;
  @override
  Widget build(BuildContext context) {
    final isLoading = model == null;
    if (isLoading) {
      return _WidgetsPlaceHolder(index: widget.index);
    }
    return GestureDetector(
      onTap: () {
        context.push(AppRoutes.videoDetails);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: AppPaddings.bottom_10,
            child: AspectRatio(
              aspectRatio: aspect,
              child: Stack(
                alignment: Alignment.topLeft,
                children: [
                  ClipRRect(
                    borderRadius: AppBorderRadiuses.border_6,
                    child: CachedNetworkImage(
                      height: double.infinity,
                      width: double.infinity,
                      imageUrl: AssetsPath.exampleImage2,
                      errorWidget: (context, url, error) =>
                          const MyShimerPlaceHolder(),
                      placeholder: (context, url) =>
                          const MyShimerPlaceHolder(),
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
                      '00:${widget.index}',
                      style: context.theme.textTheme.labelLarge,
                    ),
                  )
                ],
              ),
            ),
          ),
          Text(
            '${model?.name}',
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
