import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
                height: 151.h,
              ),
              SizedBox(
                height: 15.h,
                width:9999999999999999.w,
                child: Text(
                  'Luis Vuiton Pizdesssss gapjyk collobaration with offWthite',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(fontSize: 13.sp),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Container(
                height: 28.h,
                margin: EdgeInsets.symmetric(vertical: 10.h),
                child: Text(
                  'Lorem Ipsum Dolar sit amet dalse huy znaet, i tak dlya testa some text here is its is',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),
              Container(
                alignment: Alignment.bottomCenter,
                height: 17.h,
                width: double.infinity,
                child: Row(
                  children: [
                    Expanded(
                      child: FittedBox(
                        child: Text(
                          '5000079 Tmt',
                          style: Theme.of(context).textTheme.titleLarge,
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Expanded(
                      child: FittedBox(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '700 Tmt',
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(
                                  decoration: TextDecoration.lineThrough,
                                  decorationThickness: 2.sp),
                          textAlign: TextAlign.start,
                        ),
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
