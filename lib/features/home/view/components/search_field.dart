import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as svgProv;
import 'package:hh_express/features/components/widgets/svg_icons.dart';
import 'package:hh_express/settings/consts.dart';

class HomeSearchField extends StatefulWidget {
  HomeSearchField({super.key});

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
      padding: AppPaddings.right_6,
      height: 40.h,
      width: 246.w,
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
        decoration: InputDecoration(
          hintText: AppTitles.searchHint,
          prefixIcon: Padding(
            padding: EdgeInsets.symmetric(
              vertical: 7.h,
            ),
            child: MyImageIcon(
              path: AssetsPath.searchIcon,
              iconSize: 20.8.h,
            ),
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 7.h),
          border: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
        ),
      ),
    );
  }
}
