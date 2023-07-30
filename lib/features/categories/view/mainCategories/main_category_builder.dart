import 'package:flutter/material.dart';
import 'package:hh_express/features/categories/view/mainCategories/main_category_widget.dart';
import 'package:hh_express/helpers/extentions.dart';
import 'package:hh_express/settings/consts.dart';

class MainCategoriesBuilder extends StatelessWidget {
  const MainCategoriesBuilder({super.key, required this.controller});
  final ScrollController controller;
  @override
  Widget build(BuildContext context) {
    final List<String> list = [
      'iPhone ',
      'Lorem ',
      'Pizde Prod',
      'Xiomilar',
      'Yene bir zat',
      'Lorem  ',
      'Lorem   Some SOme SOme',
    ];

    return ScrollConfiguration(
      behavior: MyBehavior(),
      child: SingleChildScrollView(
        controller: controller,
        padding: AppPaddings.top_16.add(AppPaddings.left_16),
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(
            list.length,
            (index) => MainCategoriesWidget(
              subTitle: list[index],
            )..log(),
          ),
        ),
      ),
    );
  }
}
