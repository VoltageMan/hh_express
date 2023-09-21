import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hh_express/features/product_details/bloc/product_details_bloc.dart';
import 'package:hh_express/helpers/extentions.dart';
import 'package:hh_express/helpers/spacers.dart';
import 'package:hh_express/models/property/property_model.dart';
import 'package:hh_express/models/property/values/property_value_model.dart';
import 'package:hh_express/settings/consts.dart';
import 'package:hh_express/settings/theme.dart';

class PropertyBuilder extends StatefulWidget {
  const PropertyBuilder({super.key, required this.model, required this.id});
  final PropertyModel model;
  final int id;
  @override
  State<PropertyBuilder> createState() => _PropertyBuilderState();
}

class _PropertyBuilderState extends State<PropertyBuilder> {
  @override
  void initState() {
    // TODO: implement initState
    bloc = context.read<ProductDetailsBloc>();

    super.initState();
  }

  late final ProductDetailsBloc bloc;
  @override
  Widget build(BuildContext context) {
    final model = widget.model;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: AppPaddings.bottom12_top20.add(AppPaddings.horiz_16),
          child: Text(
            model.name,
            style: AppTheme.titleMedium14(context),
          ),
        ),
        ScrollConfiguration(
          behavior: MyBehavior(),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(model.values.length, (i) {
                return GestureDetector(
                  onTap: () {
                    bloc.sesectedProps.last = i;
                    setState(() {});
                  },
                  child: PropertyWidget(
                    isFirst: i == 0,
                    value: model.values[i],
                    isSelected: bloc.sesectedProps.last == i,
                  ),
                );
              }),
            ),
          ),
        ),
        AppSpacing.vertical_10,
      ],
    );
  }
}

class PropertyWidget extends StatelessWidget {
  const PropertyWidget({
    super.key,
    required this.isFirst,
    required this.value,
    required this.isSelected,
  });
  final PropertyValue value;
  final bool isFirst;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
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
        value.value,
        style: context.theme.textTheme.displaySmall!.copyWith(
            color: isSelected ? AppColors.appOrange : AppColors.darkGray),
      ),
    );
  }
}
