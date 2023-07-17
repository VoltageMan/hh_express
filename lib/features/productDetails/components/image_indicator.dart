import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hh_express/helpers/extentions.dart';
import 'package:hh_express/settings/consts.dart';

class ImageIndicator extends StatefulWidget {
  const ImageIndicator({super.key, required this.controller});
  final TabController controller;

  @override
  State<ImageIndicator> createState() => _ImageIndicatorState();
}

class _ImageIndicatorState extends State<ImageIndicator> {
  @override
  void initState() {
    _currentIndex.value = widget.controller.index;
    widget.controller.addListener(() {
      _currentIndex.value = widget.controller.index;
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  final _currentIndex = ValueNotifier<int>(0);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        widget.controller.length,
        (index) {
          return ValueListenableBuilder(
            valueListenable: _currentIndex,
            builder: (context, value, child) {
              final isSelected = _currentIndex.value == index;
              return AnimatedContainer(
                duration: AppDurations.duration_250ms,
                margin: AppPaddings.horiz_2.add(AppPaddings.vertic_15),
                height: 7.sp,
                width: isSelected ? 21.w : 7.sp,
                decoration: BoxDecoration(
                  borderRadius: AppBorderRadiuses.border_50,
                  color: isSelected ? AppColors.darkBlue : AppColors.darkGrey,
                ),
              );
            },
          );
        },
      ),
    );
  }
}
