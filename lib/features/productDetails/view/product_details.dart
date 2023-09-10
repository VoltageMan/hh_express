import 'package:flutter/material.dart';
import 'package:hh_express/features/productDetails/components/app_bar.dart';
import 'package:hh_express/features/productDetails/components/nav_bar.dart';
import 'package:hh_express/features/productDetails/view/product_details_body.dart';
import 'package:hh_express/helpers/modal_sheets.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return ModelBottomSheetHelper.doPop();
      },
      child: const Scaffold(
        appBar: ProdDetailsAppBar(),
        body: ProdDetailsBody(),
        bottomNavigationBar: ProdDetailsBottomBar(),
      ),
    );
  }
}
