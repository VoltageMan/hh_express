import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hh_express/helpers/extentions.dart';
import 'package:hh_express/helpers/modal_sheets.dart';
import 'package:hh_express/helpers/routes.dart';
import 'package:hh_express/helpers/spacers.dart';
import 'package:hh_express/settings/consts.dart';
import 'package:hh_express/settings/theme.dart';
import 'package:video_player/video_player.dart';

class VideoDetails extends StatefulWidget {
  const VideoDetails({super.key});

  @override
  State<VideoDetails> createState() => _VideoDetailsState();
}

class _VideoDetailsState extends State<VideoDetails> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(
        Uri.parse('${EndPoints.baseUrl}video1.mp4'))
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    final displayMedium14 = AppTheme.displayMedium14(context);
    return WillPopScope(
      onWillPop: () async {
        return ModelBottomSheetHelper.doPop();
      },
      child: Scaffold(
        body: GestureDetector(
          onPanUpdate: (details) {
            if (details.delta.dy > 5) {
              context.pop();
            }
          },
          child: Container(
            color: Colors.black,
            child: Stack(
              alignment: Alignment.center,
              children: [
                _controller.value.isInitialized
                    ? GestureDetector(
                        onTap: () {
                          if (_controller.value.isPlaying) {
                            _controller.pause();
                            return;
                          }
                          _controller.play();
                        },
                        child: AspectRatio(
                            aspectRatio: _controller.value.aspectRatio,
                            child: VideoPlayer(_controller)),
                      )
                    : Center(child: CircularProgressIndicator.adaptive()),
                Positioned(
                  top: 0,
                  left: 0,
                  child: Padding(
                    padding: AppPaddings.horiz16_vertic12
                        .copyWith(top: AppSpacing.topPad + 16.h),
                    child: GestureDetector(
                      onTap: () => appRouter.currentContext.pop(),
                      child: Icon(
                        Icons.arrow_back_rounded,
                        color: context.theme.scaffoldBackgroundColor,
                        size: 28.sp,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: AppPaddings.horiz16_botto20,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              ModelBottomSheetHelper.showFilterSheet();
                            },
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  height: 45.sp,
                                  width: 45.sp,
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    border: AppBorderRadiuses.defBorder,
                                    borderRadius: AppBorderRadiuses.border_6,
                                  ),
                                  child: ClipRRect(
                                    borderRadius: AppBorderRadiuses.border_4,
                                    child: CachedNetworkImage(
                                      imageUrl: AssetsPath.exampleImage2,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: AppPaddings.left_12
                                      .add(AppPaddings.right_5),
                                  child: Text(
                                    context.l10n.similarProducts,
                                    style: displayMedium14,
                                  ),
                                ),
                                Icon(
                                  Icons.keyboard_arrow_down_rounded,
                                  color: context.theme.scaffoldBackgroundColor,
                                  size: 28.sp,
                                )
                              ],
                            ),
                          ),
                          Expanded(child: SizedBox())
                        ],
                      ),
                      Padding(
                        padding: AppPaddings.vertic_20,
                        child: Text(
                          'Lorem ipsum is a pseudo-Latin text used in web design, typography, layout, and printisdfds...',
                          style: displayMedium14,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      VideoProgressIndicator(_controller,
                          colors: VideoProgressColors(
                              playedColor: Colors.white,
                              bufferedColor: Colors.grey,
                              backgroundColor: Colors.blueGrey),
                          allowScrubbing: true)
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
