import 'package:cached_network_image/cached_network_image.dart';
import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hh_express/features/components/my_text_button.dart';
import 'package:hh_express/features/components/widgets/place_holder.dart';
import 'package:hh_express/features/home/bloc/home_bloc.dart';
import 'package:hh_express/helpers/extentions.dart';
import 'package:hh_express/helpers/spacers.dart';
import 'package:hh_express/settings/consts.dart';
import 'package:hh_express/settings/theme.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final titleSmall = AppSpacing.getTextHeight(12)..log();
    final titleLarge = AppSpacing.getTextHeight(14)..log();
    final textTheme = context.theme.textTheme;
    final height = (titleLarge + (titleSmall * 3) + 32.h + (15.h * 2))..log();
    return Scaffold(
      body: DynamicHeightGridView(
        crossAxisCount: 1,
        itemCount: 10,
        builder: (context, index) {
          return Container(
            height: (((AppSpacing.getTextHeight(14) * 3) + 12.h) +
                (AppSpacing.getTextHeight(12) * 3) +
                26.h),
            width: double.infinity,
            margin: EdgeInsets.symmetric(
              horizontal: 16.w,
              vertical: 6.h,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: AppBorderRadiuses.border_5,
                  child: CachedNetworkImage(
                    imageUrl: AssetsPath.macBook,
                    // todo error builder
                    placeholder: (context, url) {
                      return MyShimerPlaceHolder();
                    },
                    width: 115.w,
                    height: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                AppSpacing.horizontal_15,
                Expanded(
                  child: Container(
                    color: Colors.red,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Lorem ipsum is a pseudo-Latin text used in web design, typography, l...",
                          style: textTheme.titleSmall,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Padding(
                          padding: AppPaddings.vertic_12,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "550 TMT - 700 TMT",
                                maxLines: 1,
                                style: AppTheme.titleLargeW600(context),
                              ),
                              // todo hasDiscount condition
                              Text(
                                "1400 TMT",
                                style: AppTheme.lineThroughTitleSmall(context),
                                maxLines: 1,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: AppSpacing.getTextHeight(14) + 12.h,
                          child: Row(
                            children: [
                              Expanded(
                                flex: 5,
                                child: MyDarkTextButton(
                                  //todo localization
                                  title: 'satyn al',
                                  padding: EdgeInsets.symmetric(
                                    vertical: 6.h,
                                    horizontal: 14.w,
                                  ),
                                ),
                              ),
                              AppSpacing.horizontal_8,
                              Expanded(
                                flex: 6,
                                child: MyDarkTextButton(
                                  title: context.l10n.addToCart,
                                  padding: EdgeInsets.symmetric(
                                    vertical: 6.h,
                                    horizontal: 14.w,
                                  ),
                                ),
                              ),
                              AppSpacing.horizontal_8
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
