import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hh_express/features/categories/view/mainCategories/main_category_builder.dart';
import 'package:hh_express/features/categories/view/simpleCategories/simple_categories_builder.dart';
import 'package:hh_express/helpers/spacers.dart';
import 'package:hh_express/settings/consts.dart';

class CategoryBody extends StatefulWidget {
  const CategoryBody({super.key});

  @override
  State<CategoryBody> createState() => _CategoryBodyState();
}

class _CategoryBodyState extends State<CategoryBody> {
  final controller = ScrollController();
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MainCategoriesBuilder(
          controller: controller,
        ),
        SelectedLine(selectedIndex: 4, controller: controller),
        AppSpacing.vertical_24,
        const SimpleCategoriesBuilder(),
      ],
    );
  }
}

class SelectedLine extends StatefulWidget {
  const SelectedLine(
      {super.key, required this.selectedIndex, required this.controller});
  final int selectedIndex;
  final ScrollController controller;

  @override
  State<SelectedLine> createState() => _SelectedLineState();
}

class _SelectedLineState extends State<SelectedLine> {
  final myCon = ScrollController();

  @override
  void initState() {
    widget.controller.addListener(() {
      myCon.jumpTo(widget.controller.offset);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 2.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: AppPaddings.left_16,
        physics: const NeverScrollableScrollPhysics(),
        controller: myCon,
        itemBuilder: (context, index) => widget.selectedIndex == index
            ? Container(
                height: 2,
                width: 68.w,
                margin: AppPaddings.horiz_4,
                color: AppColors.darkBlue,
              )
            : SizedBox(
                width: 76.w,
              ),
      ),
    );
  }
}
