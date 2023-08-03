import 'package:flutter/material.dart';
import 'package:hh_express/features/categories/view/mainCategories/main_category_widget.dart';
import 'package:hh_express/helpers/extentions.dart';
import 'package:hh_express/settings/consts.dart';

class MainCategoriesBuilder extends StatefulWidget {
  const MainCategoriesBuilder({super.key, required this.controller});
  final ScrollController controller;

  @override
  State<MainCategoriesBuilder> createState() => _MainCategoriesBuilderState();
}

class _MainCategoriesBuilderState extends State<MainCategoriesBuilder> {
  final List<String> list = [
    'iPhone ',
    'Lorem ',
    'Prod',
    'Xiomilar',
    'Yene bir zat',
    'Lorem  ',
    'Lorem   Some SOme SOme',
  ];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: MyBehavior(),
      child: SingleChildScrollView(
        controller: widget.controller,
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(
            list.length,
            (index) => MainCategoriesWidget(
              subTitle: list[index],
              isSelected: selectedIndex == index,
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
