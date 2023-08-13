import 'package:flutter/material.dart';
import 'package:hh_express/features/categories/view/details/cat_details_app_bar.dart';
import 'package:hh_express/features/categories/view/details/cat_details_info.dart';
import 'package:hh_express/features/home/view/components/product_builder.dart';
import 'package:hh_express/helpers/modal_sheets.dart';

class CategoryDetails extends StatelessWidget {
  const CategoryDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (ModelBottomSheetHelper.sheetShown) {
          Navigator.pop(ModelBottomSheetHelper.currentContext!);
          return false;
        }
        return true;
      },
      child: const Scaffold(
        appBar: CatDetailsAppbar(),
        body: CustomScrollView(
          slivers: [
            CategoryDetailsInfo(),
            HomeProdBuilder(),
          ],
        ),
      ),
    );
  }
}
