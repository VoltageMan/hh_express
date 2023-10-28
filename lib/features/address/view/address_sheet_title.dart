import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hh_express/features/components/widgets/svg_icons.dart';
import 'package:hh_express/helpers/extentions.dart';
import 'package:hh_express/helpers/modal_sheets.dart';
import 'package:hh_express/settings/consts.dart';
import 'package:hh_express/settings/theme.dart';

class AddressSheetTitle extends StatelessWidget {
  const AddressSheetTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPaddings.horiz_16.copyWith(top: 16.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () async {
              ModelBottomSheetHelper.doPop();
              await ModelBottomSheetHelper.showAddressSheet(null);
              /// 6 index of it self to return addres sheet back
              ModelBottomSheetHelper.showProfileSheets(6);
            },
            child: SizedBox(
              width: 22.sp,
              child: FittedBox(
                child: Icon(
                  Icons.add_rounded,
                  color: AppColors.darkBlue,
                ),
              ),
            ),
          ),
          Text(
            context.l10n.delivery,
            style: AppTheme.titleMedium16(context),
          ),
          MyImageIcon(
            path: AssetsPath.crossIcon,
            contSize: 20.sp,
            iconSize: 20.sp,
            onTap: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }
}
