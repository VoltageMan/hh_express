import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hh_express/helpers/spacers.dart';
import 'package:hh_express/settings/consts.dart';
import 'package:hh_express/settings/theme.dart';

class DeliveryWidget extends StatelessWidget {
  const DeliveryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: AppPaddings.bottom12_top20.add(AppPaddings.horiz_16),
          child: Text(
            'Teslimat',
            style: AppTheme.titleMedium14(context),
          ),
        ),
        ...List.generate(
          3,
          (index) => index == 1
              ? AppSpacing.vertical_16
              : Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 20.w, right: 9.w),
                      child: SvgPicture.asset(
                        index == 0
                            ? AssetsPath.deliveryPlane
                            : AssetsPath.deliveryTrack,
                        height: AppSpacing.getTextHeight(10),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        'Uçakla teslimat, siparişin kabul edildiği tarihten itibaren 1 ila 2 hafta içinde yapılır.',
                        style: AppTheme.bodyMedium10(context),
                      ),
                    )
                  ],
                ),
        )
      ],
    );
  }
}
