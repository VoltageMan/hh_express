import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hh_express/settings/consts.dart';
import 'package:shimmer/shimmer.dart';

/// Place holder
class MyShimerPlaceHolder extends StatelessWidget {
  const MyShimerPlaceHolder({super.key, this.height, this.radius, this.margin});
  final double? height;
  final BorderRadius? radius;
  final EdgeInsets? margin;
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      period: AppDurations.duration_1500ms,
      baseColor: AppColors.shimmerBaseColor,
      highlightColor: AppColors.shimmerHighlightColor,
      child: Container(
        margin: margin,
        height: height,
        decoration: BoxDecoration(
          borderRadius: radius,
          color: AppColors.shimmerBodyColor,
        ),
      ),
    );
  }
}
