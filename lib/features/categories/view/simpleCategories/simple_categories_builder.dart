import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hh_express/features/categories/view/simpleCategories/simple_categories_widget.dart';
import 'package:hh_express/settings/consts.dart';

class SimpleCategoriesBuilder extends StatelessWidget {
  const SimpleCategoriesBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: AppPaddings.horiz_12,
      sliver: SliverGrid.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          mainAxisExtent: 80.h,
          mainAxisSpacing: 8.h,
        ),
        itemBuilder: (context, index) {
          return SimpleCategoryWidget();
        },
      ),
    );
  }
}
