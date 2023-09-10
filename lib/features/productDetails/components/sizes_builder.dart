import 'package:flutter/material.dart';
import 'package:hh_express/helpers/extentions.dart';
import 'package:hh_express/settings/consts.dart';

class ProdSizesBuilder extends StatefulWidget {
  const ProdSizesBuilder({super.key});

  @override
  State<ProdSizesBuilder> createState() => _ProdSizesBuilderState();
}

class _ProdSizesBuilderState extends State<ProdSizesBuilder> {
  int selected = 0;
  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: MyBehavior(),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(15, (index) {
            return ProdSizeWidget(
              isFirst: index == 0,
              onTap: () {
                setState(() {
                  selected = index;
                });
              },
              size: '$index',
              isSelected: index == selected,
            );
          }),
        ),
      ),
    );
  }
}

class ProdSizeWidget extends StatelessWidget {
  const ProdSizeWidget({
    super.key,
    required this.onTap,
    required this.size,
    required this.isSelected,
    required this.isFirst,
  });
  final String size;
  final bool isSelected;
  final VoidCallback onTap;
  final bool isFirst;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: AppDurations.duration_50ms,
        margin: AppPaddings.right_14
            .add(isFirst ? AppPaddings.left_16 : EdgeInsets.zero),
        decoration: BoxDecoration(
          border: isSelected
              ? Border.all(color: AppColors.mainOrange)
              : Border.all(color: AppColors.darkGray),
          borderRadius: AppBorderRadiuses.border_6,
          color: isSelected ? AppColors.mainOrange.withOpacity(0.2) : null,
        ),
        alignment: Alignment.center,
        padding: AppPaddings.horiz_21.add(AppPaddings.vertic_8),
        child: Text(
          size,
          style: context.theme.textTheme.displaySmall!.copyWith(
              color: isSelected ? AppColors.appOrange : AppColors.darkGray),
        ),
      ),
    );
  }
}
