import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hh_express/features/components/widgets/place_holder.dart';
import 'package:hh_express/features/video/cubit/simmilar_prods_cubit.dart';
import 'package:hh_express/helpers/extentions.dart';
import 'package:hh_express/helpers/routes.dart';
import 'package:hh_express/models/videos/video_model.dart';
import 'package:hh_express/settings/consts.dart';
import 'package:video_player/video_player.dart';

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
    aspect = !(widget.index % 2 == 0) ? (160 / 107) : (160 / 205);
    super.initState();
  }

  @override
  void dispose() {
    videoController?.dispose();
    super.dispose();
  }

  late final double aspect;

  VideoPlayerController? videoController;
  Future<void> initVideoController() async {
    if (widget.model == null || isVideoInited) return;
    videoController =
        VideoPlayerController.networkUrl(Uri.parse(widget.model!.url));
    await videoController!.initialize();
    setState(() {});
    videoController!.play();
    videoController!.pause();
  }

  bool get isVideoInited {
    if (videoController == null) return false;
    return videoController!.value.isInitialized;
  }

  @override
  Widget build(BuildContext context) {
    initVideoController();
    final isLoading = widget.model == null;
    if (isLoading) {
      return _WidgetsPlaceHolder(index: widget.index);
    }
    return GestureDetector(
      onTap: () {
        videoController!.value.log();
        if (!isVideoInited) return;
        context.push(AppRoutes.videoDetails, extra: widget.model);
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
                    child: SizedBox.expand(
                      child: !isVideoInited
                          ? MyShimerPlaceHolder()
                          : FittedBox(
                              alignment: Alignment.center,
                              fit: BoxFit.cover,
                              child: Container(
                                color: AppColors.lightGray,
                                width: videoController!.value.size.width,
                                height: videoController!.value.size.height,
                                child: videoController!.value.hasError
                                    ? Icon(
                                        Icons.video_file_outlined,
                                        size: 25.sp,
                                        color: Colors.white,
                                      )
                                    : VideoPlayer(
                                        videoController!,
                                      ),
                              ),
                            ),
                    ),
                  ),
                  Container(
                    margin: AppPaddings.all_6,
                    padding: AppPaddings.horiz6_vertic3,
                    decoration: BoxDecoration(
                        color: AppColors.darkBlue.withOpacity(.6),
                        borderRadius: AppBorderRadiuses.border_4),
                    child: Text(
                      videoController?.value.duration.toTime ?? '00:00',
                      style: context.theme.textTheme.labelLarge,
                    ),
                  )
                ],
              ),
            ),
          ),
          Text(
            '${widget.model!.name}',
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
