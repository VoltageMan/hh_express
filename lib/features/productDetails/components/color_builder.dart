import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hh_express/helpers/extentions.dart';
import 'package:hh_express/helpers/spacers.dart';
import 'package:hh_express/settings/consts.dart';

class ProdColorBuilder extends StatefulWidget {
  const ProdColorBuilder({super.key});

  @override
  State<ProdColorBuilder> createState() => _ProdColorBuilderState();
}

class _ProdColorBuilderState extends State<ProdColorBuilder> {
  Color selected = Colors.purple;

  final List<Color> colors = [
    Colors.purple,
    Colors.black,
    Colors.green,
    Colors.yellow,
    Colors.grey,
    Colors.blue,
    Colors.deepOrange,
    Colors.amber,
    Colors.brown,
    Colors.red,
    Colors.white,
  ];
  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: MyBehavior(),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: colors.map((item) {
            return Column(
              children: [
                ProdColorWidget(
                  isFirst: item == Colors.purple,
                  onTap: () {
                    setState(() {
                      selected = item;
                    });
                  },
                  color: item,
                  isSelected: item == selected,
                ),
                if (item == selected) AppSpacing.vertical_8
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}

class ProdColorWidget extends StatelessWidget {
  ProdColorWidget({
    super.key,
    required this.onTap,
    required this.color,
    required this.isSelected,
    required this.isFirst,
  });
  final Color color;
  final bool isSelected;
  final VoidCallback onTap;
  final bool isFirst;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        width: 20.w,
        height: 20.w,
        duration: AppDurations.duration_50ms,
        margin: AppPaddings.right_14
            .add(isFirst ? AppPaddings.left_16 : EdgeInsets.zero),
        decoration: BoxDecoration(
            border: Border.all(color: AppColors.darkGray),
            color: color,
            borderRadius: AppBorderRadiuses.border_8),
        alignment: Alignment.center,
        child: isSelected
            ? Icon(
                Icons.check,
                size: 16,
                color: AppColors.black,
              )
            : SizedBox(),
      ),
    );
  }
}
