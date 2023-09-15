import 'package:hh_express/models/product_details/product_details_model.dart';

abstract class ProductDetailsRepo {
  Future<ProductDetailsModel?> get(int id);
}
