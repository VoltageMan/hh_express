import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hh_express/features/components/widgets/place_holder.dart';
import 'package:hh_express/features/video/cubit/video_cubit.dart';
import 'package:hh_express/features/video/view/details/cubit/video_details_cubit.dart';
import 'package:hh_express/features/video/view/details/my_video_player.dart';
import 'package:hh_express/helpers/extentions.dart';
import 'package:hh_express/helpers/modal_sheets.dart';
import 'package:hh_express/helpers/routes.dart';
import 'package:hh_express/helpers/spacers.dart';
import 'package:hh_express/models/videos/video_model.dart';
import 'package:hh_express/settings/consts.dart';
import 'package:hh_express/settings/theme.dart';

class VideoDetails extends StatefulWidget {
  const VideoDetails({super.key, this.index = 0});
  final int index;
  @override
  State<VideoDetails> createState() => _VideoDetailsState();
}

class _VideoDetailsState extends State<VideoDetails> {
  late dynamic _controller;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  late final pageController = PageController(initialPage: widget.index);
  late final homeVideoBloc = context.read<VideoCubit>();
  // late final currentPage = ValueNotifier<int>(widget.index);

  HomeVideoModel get currentModel {
    return homeVideoBloc.state.models[vdCubit!.state.currentPage];
  }

  void comeBackListener() {
    if (appRouter.location == AppRoutes.videoDetails) {
      vdCubit!.changePage(vdCubit!.state.lastPage);
      appRouter.removeListener(comeBackListener);
    }
  }

  VideoDetailsCubit? vdCubit;
  void initVideoDBloc(BuildContext ctx) {
    if (vdCubit != null) return;
    vdCubit = ctx.read<VideoDetailsCubit>();
  }

  //!
  @override
  Widget build(BuildContext context) {
    final displayMedium14 = AppTheme.displayMedium14(context);
    return BlocProvider(
      create: (context) => VideoDetailsCubit(widget.index),
      child: Builder(builder: (context) {
        initVideoDBloc(context);
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
                    BlocBuilder<VideoCubit, VideoState>(
                      bloc: homeVideoBloc,
                      builder: (context, state) {
                        return PageView.builder(
                          controller: pageController,
                          itemCount: homeVideoBloc.state.models.length,
                          onPageChanged: (value) {
                            vdCubit!.changePage(value);
                            if (value ==
                                homeVideoBloc.state.models.length - 2) {
                              homeVideoBloc.loadMore();
                            }
                          },
                          itemBuilder: (context, index) {
                            return MyVideoPlayerWidget(
                              model: homeVideoBloc.state.models[index],
                              index: index,
                            );
                          },
                        );
                      },
                    ),
                    Positioned(
                      top: 0,
                      left: 0,
                      child: Padding(
                        padding: AppPaddings.horiz16_vertic12
                            .copyWith(top: AppSpacing.topPad + 16.h),
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                if (appRouter.location !=
                                    AppRoutes.videoDetails) return;
                                appRouter.currentContext.pop();
                              },
                              child: Icon(
                                Icons.arrow_back_rounded,
                                color: context.theme.scaffoldBackgroundColor,
                                size: 28.sp,
                              ),
                            ),
                            GestureDetector(
                              onTap: () async {
                                if (appRouter.location !=
                                    AppRoutes.videoDetails) return;
                                vdCubit!.changePage(-1);
                                context.push(AppRoutes.prodDetails,
                                    extra: currentModel);

                                appRouter.addListener(comeBackListener);
                              },
                              child: Icon(
                                Icons.arrow_forward_rounded,
                                color: context.theme.scaffoldBackgroundColor,
                                size: 28.sp,
                              ),
                            ),
                          ],
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
                                  ModelBottomSheetHelper.showVideoSimmilarProds(
                                      currentModel.product.categorySlug);
                                },
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    BlocBuilder<VideoDetailsCubit,
                                            VideoDetailsState>(
                                        bloc: vdCubit,
                                        builder: (context, state) {
                                          if (state.currentPage.isNegative)
                                            return SizedBox();
                                          return Container(
                                            height: 45.sp,
                                            width: 45.sp,
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                              color: AppColors.darkGrey,
                                              border:
                                                  AppBorderRadiuses.defBorder,
                                              borderRadius:
                                                  AppBorderRadiuses.border_6,
                                            ),
                                            child: ClipRRect(
                                              borderRadius:
                                                  AppBorderRadiuses.border_4,
                                              child: CachedNetworkImage(
                                                imageUrl:
                                                    currentModel.product.image,
                                                fit: BoxFit.cover,
                                                errorWidget:
                                                    (context, url, error) {
                                                  return Icon(
                                                      Icons.image_outlined);
                                                },
                                                placeholder: (context, url) =>
                                                    MyShimerPlaceHolder(),
                                              ),
                                            ),
                                          );
                                        }),
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
                                      color:
                                          context.theme.scaffoldBackgroundColor,
                                      size: 28.sp,
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: AppPaddings.vertic_20,
                            child: BlocBuilder<VideoDetailsCubit,
                                VideoDetailsState>(
                              bloc: vdCubit,
                              builder: (context, state) {
                                if (state.currentPage.isNegative)
                                  return SizedBox();
                                return Text(
                                  homeVideoBloc
                                      .state.models[state.currentPage].name,
                                  style: displayMedium14,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
