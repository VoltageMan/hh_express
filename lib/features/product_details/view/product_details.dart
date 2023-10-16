import 'package:flutter/material.dart';
import 'package:hh_express/features/product_details/components/app_bar.dart';
import 'package:hh_express/features/product_details/components/nav_bar.dart';
import 'package:hh_express/features/product_details/view/product_details_body.dart';
import 'package:hh_express/models/cart/cart_update/cart_update_model.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key, required this.id});
  final int id;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ProdDetailsAppBar(),
      body: ProdDetailsBody(
        id: id,
      ),
      bottomNavigationBar: ProdDetailsBottomBar(
        id: id,
      ),
    );
  }
}
