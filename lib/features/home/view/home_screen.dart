import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hh_express/features/mainScreen/view/main_app_bar.dart';
import 'package:hh_express/helpers/routes.dart';
import 'package:hh_express/helpers/spacers.dart';
import 'package:hh_express/settings/consts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final colors = [
    AppColors.mainOrange,
    AppColors.success,
    AppColors.lightGray,
    AppColors.darkGrey,
  ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisExtent: 255.h,
      ),
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.only(
            top: 12.h,
            left: index % 2 == 0 ? 16.w : 4.w,
            right: index % 2 == 1 ? 16.w : 4.w,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 10.h),
                decoration: BoxDecoration(
                  color: colors[index % 4],
                  borderRadius: AppBorderRadiuses.borderRadius_6circular,
                  border: Border.all(
                    color: AppColors.lightGrey,
                    width: 1.5.sp,
                  ),
                ),
                height: 152.h,
              ),
              SizedBox(
                height: 15.h,
                child: FittedBox(
                  child: Text(
                    'Luis Vuiton Some',
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(fontSize: 13.sp),
                  ),
                ),
              ),
              Container(
                height: 28.h,
                margin: EdgeInsets.symmetric(vertical: 10.h),
                child: Text(
                  'Lorem Ipsum Dolar sit amet dalse huy znaet ',
                  maxLines: 2,
                  overflow: TextOverflow.clip,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),
              SizedBox(
                height: 17.h,
                width: double.infinity,
                child: Row(
                  children: [
                    FittedBox(
                      child: Text(
                        '500 Tmt',
                        style: Theme.of(context).textTheme.titleLarge,
                        textAlign: TextAlign.start,
                      ),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    FittedBox(
                      child: Text(
                        '700 Tmt',
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            decoration: TextDecoration.lineThrough,
                            decorationThickness: 2.sp),
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
