import 'package:flutter/material.dart';
import 'package:hh_express/features/filter/components/filter_color.dart';
import 'package:hh_express/features/filter/selecteds/view/components/remove_selected.dart';
import 'package:hh_express/helpers/spacers.dart';
import 'package:hh_express/settings/consts.dart';
import 'package:hh_express/settings/theme.dart';

class JustFilterWidget extends StatelessWidget {
  JustFilterWidget({
    super.key,
    this.isSelected,
    required this.title,
  });
  final bool? isSelected;
  final String? title;

  @override
  Widget build(BuildContext context) {
    final isSelected = this.isSelected ?? false;
    final forAll = title == AppTitles.removeAll;
    final isLight = !isSelected || forAll;
    final textTheme = !isSelected
        ? AppTheme.titleMedium12(context)
        : AppTheme.displayMedium12(context);
    return GestureDetector(
      child: Container(
        margin: AppPaddings.bottom_10,
        padding: AppPaddings.horiz10_vertic5,
        decoration: BoxDecoration(
          borderRadius: AppBorderRadiuses.border_6,
          color: isLight ? AppColors.lightGrey : AppColors.mainOrange,
        ),
        child: isSelected || forAll
            ? Wrap(
                children: [
                  title != null
                      ? Text(
                          title!,
                          style: textTheme,
                        )
                      : const SelectedFilterColorWidget(),
                  AppSpacing.horizontal_5,
                  RemoveSelectedWidget(forAll: forAll),
                ],
              )
            : Text(
                title!,
                style: textTheme,
              ),
      ),
    );
  }
}
