import 'package:extended_wrap/extended_wrap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hh_express/features/components/confirm_some.dart';
import 'package:hh_express/features/components/widgets/sheet_titles.dart';
import 'package:hh_express/features/filter/components/filter_title.dart';
import 'package:hh_express/features/filter/components/just_filter.dart';
import 'package:hh_express/features/filter/components/siwtch_listile.dart';
import 'package:hh_express/helpers/extentions.dart';
import 'package:hh_express/helpers/spacers.dart';
import 'package:hh_express/settings/consts.dart';

class FilterSheetBody extends StatefulWidget {
  const FilterSheetBody({super.key});

  @override
  State<FilterSheetBody> createState() => _FilterSheetBodyState();
}

class _FilterSheetBodyState extends State<FilterSheetBody> {
  final List<String> selecteds = [
    'Kategoriýa: Maýkalar',
    'Ölçeg: 40',
    'Brend: Adidas',
    'Gucci',
  ];
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      height: 735.h,
      decoration: BoxDecoration(
        color: theme.scaffoldBackgroundColor,
        borderRadius: AppBorderRadiuses.border_10,
      ),
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: AppPaddings.horiz16_vertic12,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BottomSheetTitle(
                      title: AppTitles.filter!,
                    ),
                    AppSpacing.vertical_15,
                    ExtendedWrap(
                      alignment: WrapAlignment.start,
                      spacing: 10.w,
                      maxLines: 2,
                      children: List.generate(
                        selecteds.length,
                        (index) => JustFilterWidget(
                          title: selecteds[index],
                          isSelected: true,
                        ),
                      ),
                    ),
                    JustFilterWidget(
                      title: AppTitles.removeAll,
                    ),
                    AppSpacing.vertical_15,
                    Container(
                      color: AppColors.lightGrey,
                      height: 1.h,
                    ),
                    AppSpacing.vertical_15,
                    FilterTitle(
                      title: AppTitles.navBarTitles![2],
                    ),
                    const FilterSwithListTile(),
                  ],
                ),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              boxShadow: AppColors.navBarShaow,
              color: AppColors.white,
            ),
            height: 72.h,
            padding: AppPaddings.horiz16_vertic12,
            child: ConfirmSomeTh(
              title: 'Harytlar (500)',
              onTap: () {
                'Some'.log();
              },
            ),
          ),
        ],
      ),
    );
  }
}
