import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hh_express/features/categories/view/simpleCategories/simple_categories_widget.dart';
import 'package:hh_express/helpers/extentions.dart';
import 'package:hh_express/helpers/spacers.dart';
import 'package:hh_express/settings/consts.dart';

class SimpleCategoriesBuilder extends StatelessWidget {
  const SimpleCategoriesBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ScrollConfiguration(
        behavior: MyBehavior(),
        child: PageView.builder(
          physics: NeverScrollableScrollPhysics(),
          itemCount: 7,
          itemBuilder: (context, index) => GridView.builder(
            shrinkWrap: true,
            itemCount: 20,
            padding: AppPaddings.horiz12_vertic17.add(AppPaddings.top_6),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 1 / 0.8,
              mainAxisSpacing: 10.h,
            ),
            itemBuilder: (context, index) {
              return SimpleCategoryWidget(
                index: index,
              );
            },
          ),
        ),
      ),
    );
  }
}


 

//  CustomScrollView(
//             slivers: [
//               SliverPadding(
//                 padding: AppPaddings.horiz12_vertic17.add(AppPaddings.top_6),
//                 sliver: SliverDynamicHeightGridView(
//                   crossAxisCount: 3,
//                   itemCount: 20,
//                   builder: (context, index) {
//                     return SimpleCategoryWidget(
//                       index: index - 1,
//                     );
//                   },
//                 ),
//               ),
//             ],
//           ),