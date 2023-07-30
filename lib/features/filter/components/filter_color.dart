import 'package:flutter/material.dart';
import 'package:hh_express/settings/consts.dart';

/// this widget for show colors in filter
class FilterColorWidget extends StatelessWidget {
  const FilterColorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

//!

/// this widget for show colors in filter when they selected
class SelectedFilterColorWidget extends StatelessWidget {
  const SelectedFilterColorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: AppBorderRadiuses.border_6,
        color: AppColors.mediumGrey,
      ),
    );
  }
}
