import 'package:flutter/material.dart';
import 'package:hh_express/features/categories/view/details/cat_details_app_bar.dart';
import 'package:hh_express/features/categories/view/details/cat_details_info.dart';
import 'package:hh_express/features/home/view/components/product_builder.dart';

class CategoryDetails extends StatelessWidget {
  const CategoryDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CatDetailsAppbar(),
      body: CustomScrollView(
        slivers: [
          CategoryDetailsInfo(),
          HomeProdBuilder(),
        ],
      ),
    );
  }
}
