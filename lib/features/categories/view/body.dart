import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hh_express/features/categories/bloc/category_bloc.dart';
import 'package:hh_express/features/categories/view/mainCategories/main_category_builder.dart';
import 'package:hh_express/features/categories/view/simpleCategories/simple_categories_builder.dart';
import 'package:hh_express/helpers/extentions.dart';
import 'package:hh_express/settings/consts.dart';
import 'package:hh_express/settings/enums.dart';

class CategoryBody extends StatefulWidget {
  const CategoryBody({super.key});

  @override
  State<CategoryBody> createState() => _CategoryBodyState();
}

class _CategoryBodyState extends State<CategoryBody> {
  @override
  void initState() {
    final bloc = context.read<CategoryBloc>();
    bloc.add(ChangeCategory(slug: bloc.state.mains!.first.slug));

    super.initState();
  }

  bool hasError = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MainCategoriesBuilder(),
        const SimpleCategoriesBuilder(),
      ],
    );
  }
}

class CategoryErrorBody extends StatelessWidget {
  const CategoryErrorBody({super.key, this.onTap});
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(width: double.infinity),
        Icon(
          Icons.error_outline,
          color: AppColors.appOrange,
        ),
        ElevatedButton(
          onPressed: () {
            if (onTap != null) {
              onTap!.call();
              return;
            }
          },
          child: Text(
            'Try again',
          ),
        )
      ],
    );
  }
}
