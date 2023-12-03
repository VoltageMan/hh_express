import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hh_express/features/filter/components/prop_widegets/filter_color.dart';
import 'package:hh_express/features/product_details/bloc/product_details_bloc.dart';
import 'package:hh_express/helpers/extentions.dart';
import 'package:hh_express/models/property/property_model.dart';
import 'package:hh_express/settings/consts.dart';
import 'package:hh_express/settings/theme.dart';

class ProdColorBuilder extends StatefulWidget {
  const ProdColorBuilder({
    super.key,
    required this.model,
  });
  final PropertyModel model;
  @override
  State<ProdColorBuilder> createState() => _ProdColorBuilderState();
}

class _ProdColorBuilderState extends State<ProdColorBuilder> {
  late final bloc = context.read<ProductDetailsBloc>();
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
            '${model.name}',
            style: AppTheme.titleMedium14(context),
          ),
        ),
        ScrollConfiguration(
          behavior: MyBehavior(),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: model.values.map((item) {
                final isSelected =
                    bloc.getSelectedPropid(model.name) == item.id;
                return Column(
                  children: [
                    AnimatedPadding(
                      duration: Duration(milliseconds: 100),
                      padding:
                          isSelected ? EdgeInsets.zero : AppPaddings.top_12,
                      child: FilterColorWidget(
                        isMargined: true,
                        color: item,
                        isSelected: isSelected,
                        onTap: () {
                          bloc.selecProp(model.name, item.id);
                          setState(() {});
                        },
                      ),
                    ),
                  ],
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }
}

class AnimatedSpace extends StatelessWidget {
  const AnimatedSpace({super.key, this.height, this.width});
  final double? height;
  final double? width;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: AppDurations.duration_50ms,
      height: height,
      width: width,
    );
  }
}
// class ProdColorWidget extends StatelessWidget {
//   ProdColorWidget({
//     super.key,
//     required this.onTap,
//     required this.color,
//     required this.isSelected,
//     required this.isFirst,
//   });
//   final Color color;
//   final bool isSelected;
//   final VoidCallback onTap;
//   final bool isFirst;

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: AnimatedContainer(
//         width: 20.w,
//         height: 20.w,
//         duration: AppDurations.duration_50ms,
//         margin: AppPaddings.right_14
//             .add(isFirst ? AppPaddings.left_16 : EdgeInsets.zero),
//         decoration: BoxDecoration(
//             border: Border.all(color: AppColors.darkGray),
//             color: color,
//             borderRadius: AppBorderRadiuses.border_8),
//         alignment: Alignment.center,
//         child: isSelected
//             ? Icon(
//                 Icons.check,
//                 size: 16,
//                 color: AppColors.black,
//               )
//             : SizedBox(),
//       ),
//     );
//   }
// }
