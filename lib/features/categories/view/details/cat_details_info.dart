import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hh_express/helpers/extentions.dart';
import 'package:hh_express/settings/theme.dart';

class CategoryDetailsInfo extends StatelessWidget {
  const CategoryDetailsInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.only(
        left: 16.w,
        top: 10.h,
        bottom: 15.h,
      ),
      sliver: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Maykalar', style: AppTheme.bodyLargeW500(context)),
          Text(
            'Diňe oglan üçin',
            style: AppTheme.titleLarge18(context),
          ),
          Text(
            '1235 products',
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ],
      ).toSliverBox,
    );
  }
}
