import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:hh_express/features/video/components/video_widget.dart';
import 'package:hh_express/settings/consts.dart';

class HomeVideos extends StatefulWidget {
  const HomeVideos({super.key});

  @override
  State<HomeVideos> createState() => _TestScrennStaee();
}

class _TestScrennStaee extends State<HomeVideos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MasonryGridView.count(
        padding: AppPaddings.horiz_16.add(AppPaddings.top_12),
        crossAxisCount: 2,
        crossAxisSpacing: 8.w,
        mainAxisSpacing: 12.h,
        itemBuilder: (context, index) {
          return VideoWidget(
            index: index,
          );
        },
      ),
    );
  }
}
