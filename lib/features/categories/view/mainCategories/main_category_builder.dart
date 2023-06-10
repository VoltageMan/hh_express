import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hh_express/features/categories/view/mainCategories/main_category_widget.dart';
import 'package:hh_express/settings/consts.dart';

class MainCategoriesBuilder extends StatelessWidget {
  const MainCategoriesBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: AppPaddings.top16_bottom24,
      height: 90.h,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          return MainCategoriesWidget(
            isSelected: index == 2,
            isFirst: index == 0,
            isLast: index == 4,
          );
        },
      ),
    );
  }
}
