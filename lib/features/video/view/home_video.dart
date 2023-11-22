import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:hh_express/features/categories/view/body.dart';
import 'package:hh_express/features/product_details/view/product_details_body.dart';
import 'package:hh_express/features/video/components/video_widget.dart';
import 'package:hh_express/features/video/cubit/video_cubit.dart';
import 'package:hh_express/helpers/extentions.dart';
import 'package:hh_express/settings/consts.dart';
import 'package:hh_express/settings/enums.dart';

class HomeVideos extends StatefulWidget {
  const HomeVideos({super.key});

  @override
  State<HomeVideos> createState() => _TestScrennStaee();
}

class _TestScrennStaee extends State<HomeVideos> {
  late final cubit = context.read<VideoCubit>()..getVideos();

  final scrollController = ScrollController();

  @override
  void initState() {
    scrollController.addListener(() {
      if (scrollController.position.pixels >=
              (scrollController.position.maxScrollExtent - 30.h) &&
          scrollController.position.isScrollingNotifier.value) {
        final state = cubit.state;
        if (state.apiState != OrderHistoryAPIState.success ||
            state.pagination!.currentPage == state.pagination!.lastPage) {
          return;
        }
        cubit.getVideos();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<VideoCubit, VideoState>(
        bloc: cubit,
        builder: (context, state) {
          final apiState = state.apiState;
          if (apiState == VideoAPIState.init) return SizedBox();
          if (apiState == VideoAPIState.error)
            return CategoryErrorBody(
              onTap: () {
                cubit.getVideos(forRefresh: true);
              },
            );
          final isLoading = apiState == VideoAPIState.loading;
          return RefreshIndicator(
            onRefresh: () async {},
            child: CustomScrollView(
              slivers: [
                SliverPadding(
                  padding: AppPaddings.horiz_16.add(AppPaddings.top_12),
                  sliver: SliverMasonryGrid.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 8.w,
                    mainAxisSpacing: 12.h,
                    childCount: isLoading ? null : state.models.length,
                    itemBuilder: (context, index) {
                      return VideoWidget(
                        index: index,
                        model: isLoading ? null : state.models[index],
                      );
                    },
                  ),
                ),
                if (apiState == VideoAPIState.loadingMore)
                  CenterLoading().toSliverBox,
                if (apiState == VideoAPIState.errorMore)
                  CategoryErrorBody(
                    onTap: cubit.getVideos,
                  ).toSliverBox
              ],
            ),
          );
        },
      ),
    );
  }
}
