import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hh_express/features/home/view/components/product_widget.dart';

class HomeProdBuilder extends StatelessWidget {
  const HomeProdBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverDynamicHeightGridView(
      crossAxisCount: 2,
      mainAxisSpacing: 10.h,
      itemCount: 99999,
      builder: (context, index) {
        return HomeProdWidget(
          index: index,
        );
      },
    );
  }
}
