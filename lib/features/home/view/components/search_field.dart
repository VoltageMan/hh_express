import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hh_express/features/components/widgets/svg_icons.dart';
import 'package:hh_express/helpers/extentions.dart';
import 'package:hh_express/settings/consts.dart';

class HomeSearchField extends StatefulWidget {
  const HomeSearchField({super.key});
//  final TextEditingController controller;
  @override
  State<HomeSearchField> createState() => _HoemSearchFieldState();
}

class _HoemSearchFieldState extends State<HomeSearchField> {
  final focus = FocusNode();
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).inputDecorationTheme;
    return Container(
      alignment: Alignment.centerLeft,
      padding: AppPaddings.all_2,
      margin: AppPaddings.vertic_6,
      decoration: BoxDecoration(
        color: theme.fillColor,
        borderRadius: AppBorderRadiuses.border_6,
      ),
      child: TextField(
        maxLines: 1,
        scribbleEnabled: false,
        // scrollPadding: EdgeInsets.zero,
        textInputAction: TextInputAction.search,
        focusNode: focus,
        style: Theme.of(context).textTheme.bodyMedium,
        decoration: InputDecoration(
          hintText: context.l10n.searchHint,
          prefixIcon: Padding(
            padding: EdgeInsets.symmetric(
              vertical: 7.h,
            ),
            child: MyImageIcon(
              path: AssetsPath.searchIcon,
              iconSize: 20.8.h,
            ),
          ),
          border: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
        ),
      ),
    );
  }
}
