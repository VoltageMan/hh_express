import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hh_express/settings/consts.dart';

class MyImageIcon extends StatelessWidget {
  const MyImageIcon({
    super.key,
    required this.path,
    this.iconSize,
    this.contSize,
    this.color,
  });
  final String path;
  final double? iconSize;
  final double? contSize;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    final contSize = this.contSize ?? 26.sp;
    final iconSize = this.iconSize ?? 18.2.sp;
    return Container(
      // color: Colors.red,
      alignment: Alignment.center,
      height: contSize,
      width: contSize,
      child: SvgPicture.asset(
        path,
        height: iconSize,
        width: iconSize,
        color: color ?? AppColors.darkBlue,
      ),
    );
  }
}
