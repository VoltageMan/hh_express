import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hh_express/features/categories/view/body.dart';
import 'package:hh_express/features/favors/components/favors_widget.dart';
import 'package:hh_express/features/favors/bloc/favors_bloc.dart';
import 'package:hh_express/features/product_details/view/product_details_body.dart';
import 'package:hh_express/helpers/extentions.dart';
import 'package:hh_express/helpers/spacers.dart';
import 'package:hh_express/settings/enums.dart';

class FavrosBuilder extends StatefulWidget {
  const FavrosBuilder({super.key});

  @override
  State<FavrosBuilder> createState() => _FavrosBuilderState();
}

class _FavrosBuilderState extends State<FavrosBuilder> {
  late final cubit = context.read<FavorsCubit>()..getFavors();

  final scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 340.h,
      child: BlocBuilder<FavorsCubit, FavorsState>(
        bloc: cubit,
        builder: (context, state) {
          final apiState = state.apiState;
          if (apiState == FavorsAPIState.unauthorized)
            return Center(
              child: Text(context.l10n.unauthorized),
            );
          if (apiState == FavorsAPIState.init) return SizedBox();
          if (apiState == FavorsAPIState.error) return CategoryErrorBody();
          final isLoading = apiState == FavorsAPIState.loading;
          if (state.models.isEmpty && apiState != FavorsAPIState.loading) {
            return Center(
              child: Text(
                context.l10n.empty,
              ),
            );
          }
          return CustomScrollView(
            controller: scrollController,
            slivers: [
              AppSpacing.vertical_10.toSliverBox,
              SliverList.builder(
                itemCount: isLoading ? 10 : state.models.length,
                itemBuilder: (context, index) {
                  return FavorsWidget(
                    /// condition to show loading
                    model: isLoading ? null : state.models[index],
                  );
                },
              ),
              if (apiState == FavorsAPIState.errorMore)
                CategoryErrorBody(
                  onTap: () {
                    cubit.getFavors();
                  },
                ).toSliverBox,
              if (apiState == FavorsAPIState.loadingMore)
                CenterLoading().toSliverBox
            ],
          );
        },
      ),
    );
  }
}
