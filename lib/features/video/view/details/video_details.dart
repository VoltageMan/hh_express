import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hh_express/features/components/widgets/place_holder.dart';
import 'package:hh_express/helpers/extentions.dart';
import 'package:hh_express/helpers/modal_sheets.dart';
import 'package:hh_express/helpers/routes.dart';
import 'package:hh_express/helpers/spacers.dart';
import 'package:hh_express/settings/consts.dart';
import 'package:hh_express/settings/theme.dart';

class VideoDetails extends StatefulWidget {
  const VideoDetails({super.key});

  @override
  State<VideoDetails> createState() => _VideoDetailsState();
}

class _VideoDetailsState extends State<VideoDetails> {
  @override
  Widget build(BuildContext context) {
    final displayMedium14 = AppTheme.displayMedium14(context);
    return WillPopScope(
      onWillPop: () async {
        if (ModelBottomSheetHelper.sheetShown) {
          Navigator.pop(ModelBottomSheetHelper.currentContext!);
          return false;
        }

        return true;
      },
      child: Scaffold(
        body: Container(
          child: Stack(
            children: [
              SizedBox.expand(
                child: CachedNetworkImage(
                  imageUrl: AssetsPath.exampleImage2,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => MyShimerPlaceHolder(),
                ),
              ),
              Padding(
                padding: AppPaddings.horiz16_vertic12
                    .copyWith(top: AppSpacing.topPad + 16.h),
                child: GestureDetector(
                  onTap: () => appRouter.currentContext.pop(),
                  child: Icon(
                    Icons.arrow_back_rounded,
                    color: context.theme.scaffoldBackgroundColor,
                    size: 28.sp,
                  ),
                ),
              ),
              Padding(
                padding: AppPaddings.horiz16_botto20,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            ModelBottomSheetHelper.showFilterSheet();
                          },
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                height: 45.sp,
                                width: 45.sp,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  border: AppBorderRadiuses.defBorder,
                                  borderRadius: AppBorderRadiuses.border_6,
                                ),
                                child: ClipRRect(
                                  borderRadius: AppBorderRadiuses.border_4,
                                  child: CachedNetworkImage(
                                    imageUrl: AssetsPath.exampleImage2,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: AppPaddings.left_12
                                    .add(AppPaddings.right_5),
                                child: Text(
                                  context.l10n.similarProducts,
                                  style: displayMedium14,
                                ),
                              ),
                              Icon(
                                Icons.keyboard_arrow_down_rounded,
                                color: context.theme.scaffoldBackgroundColor,
                                size: 28.sp,
                              )
                            ],
                          ),
                        ),
                        Expanded(child: SizedBox())
                      ],
                    ),
                    Padding(
                      padding: AppPaddings.vertic_20,
                      child: Text(
                        'Lorem ipsum is a pseudo-Latin text used in web design, typography, layout, and printisdfds...',
                        style: displayMedium14,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 5.h,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: _theList,
                        ),
                        borderRadius: AppBorderRadiuses.border_20,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

final List<Color> _theList = [
  AppColors.white,
  AppColors.white,
  AppColors.white,
  AppColors.white,
  AppColors.white,
  AppColors.white,
  AppColors.white,
  AppColors.white,
  AppColors.white,
  AppColors.white,
  AppColors.white,
  AppColors.white,
  AppColors.white,
  AppColors.white,
  AppColors.white,
  AppColors.white,
  AppColors.white,
  AppColors.white,
  AppColors.black.withOpacity(0.59),
  AppColors.black.withOpacity(0.59),
  AppColors.black.withOpacity(0.59),
  AppColors.black.withOpacity(0.59),
  AppColors.black.withOpacity(0.59),
  AppColors.black.withOpacity(0.59),
  AppColors.black.withOpacity(0.59),
  AppColors.black.withOpacity(0.59),
  AppColors.black.withOpacity(0.59),
  AppColors.black.withOpacity(0.59),
  AppColors.black.withOpacity(0.59),
  AppColors.black.withOpacity(0.59),
  AppColors.black.withOpacity(0.59),
  AppColors.black.withOpacity(0.59),
  AppColors.black.withOpacity(0.59),
  AppColors.black.withOpacity(0.59),
  AppColors.black.withOpacity(0.59),
  AppColors.black.withOpacity(0.59),
  AppColors.black.withOpacity(0.59),
  AppColors.black.withOpacity(0.59),
  AppColors.black.withOpacity(0.59),
  AppColors.black.withOpacity(0.59),
  AppColors.black.withOpacity(0.59),
  AppColors.black.withOpacity(0.59),
  AppColors.black.withOpacity(0.59),
];
