// import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:hh_express/features/category_details/bloc/category_details_bloc.dart';
// import 'package:hh_express/features/home/view/components/product_widget.dart';
// import 'package:hh_express/settings/enums.dart';

// class CatDetailsProductBuilder extends StatelessWidget {
//   const CatDetailsProductBuilder({
//     super.key,
//   });
//   @override
//   Widget build(BuildContext context) {
//     final state = context.read<CategoryDetailsBloc>( ).state;
//     final isLoading = state.state == ProductAPIState.loading;
//     final prods = state.products;
//     return SliverDynamicHeightGridView(
//       crossAxisCount: 2,
//       mainAxisSpacing: 10.h,
//       itemCount: isLoading ? 100 : prods!.length,
//       builder: (context, index) {
//         return HomeProdWidget(
//           index: index,
//           prod: isLoading ? null : prods![index],
//         );
//       },
//     );
//   }
// }
