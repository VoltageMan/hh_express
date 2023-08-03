import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hh_express/features/components/widgets/place_holder.dart';
import 'package:hh_express/settings/consts.dart';

class OrderStateCheck extends StatelessWidget {
  const OrderStateCheck(
      {super.key, required this.checkCount, required this.tickedsCount});
  final int checkCount;
  final int? tickedsCount;
  @override
  Widget build(BuildContext context) {
    final isLoading = false;
    return Padding(
      padding: AppPaddings.vertic_8,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          AnimatedContainer(
            width: 2.w,
            height: 70.h * ((tickedsCount ?? 1) - 1),
            color: isLoading ? AppColors.transparent : AppColors.mainOrange,
            duration: AppDurations.duration_500ms,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
              3,
              (index) {
                final isNotChecked = checkCount < (index + 1);
                return isNotChecked
                    //  add not Checked box
                    ? SizedBox(
                        height: 24.sp,
                      )
                    : isLoading
                        ? MyShimerPlaceHolder(
                            height: 24.h,
                            child: Container(
                              height: 24.sp,
                              width: 24.sp,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.shimmerBodyColor,
                              ),
                            ),
                          )
                        : Container(
                            height: 24.sp,
                            width: 24.sp,
                            alignment: Alignment.center,
                            padding: AppPaddings.all_4,
                            decoration: const BoxDecoration(
                              color: AppColors.mainOrange,
                              shape: BoxShape.circle,
                            ),
                            child: const FittedBox(
                              child: Icon(
                                Icons.check_rounded,
                                color: AppColors.white,
                              ),
                            ),
                          );
              },
            ),
          )
        ],
      ),
    );
  }
}
