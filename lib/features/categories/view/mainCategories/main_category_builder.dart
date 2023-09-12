import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hh_express/features/categories/bloc/category_bloc.dart';
import 'package:hh_express/features/categories/view/mainCategories/main_category_widget.dart';
import 'package:hh_express/helpers/extentions.dart';
import 'package:hh_express/models/categories/category_model.dart';
import 'package:hh_express/settings/enums.dart';

class MainCategoriesBuilder extends StatefulWidget {
  const MainCategoriesBuilder({
    super.key,
  });

  @override
  State<MainCategoriesBuilder> createState() => _MainCategoriesBuilderState();
}

class _MainCategoriesBuilderState extends State<MainCategoriesBuilder> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryBloc, CategoryState>(
      builder: (context, state) {
        'REbuilding ${state.state.name}'.log();
        final apiState = state.state;
        if (apiState == CategoryAPIState.succses ||
            apiState == CategoryAPIState.loadingSubs ||
            apiState == CategoryAPIState.errorSubs) {
          return _UiBuilder(
            selectedIndex: state.activIndex,
            list: state.mains,
          );
        }
        return _UiBuilder();
      },
    );
  }
}

class _UiBuilder extends StatelessWidget {
  const _UiBuilder({
    this.list,
    this.selectedIndex,
  });
  final List<CategoryModel>? list;
  final int? selectedIndex;
  @override
  Widget build(BuildContext context) {
    final isLoading = list == null;
    return ScrollConfiguration(
      behavior: MyBehavior(),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(
            list?.length ?? 15,
            (index) => MainCategoriesWidget(
              isSelected: isLoading ? false : selectedIndex == index,
              model: isLoading ? null : list![index],
            ),
          ),
        ),
      ),
    );
  }
}
