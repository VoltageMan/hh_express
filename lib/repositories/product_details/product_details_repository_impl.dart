import 'package:hh_express/data/remote/dio_client.dart';
import 'package:hh_express/models/product_details/product_details_model.dart';
import 'package:hh_express/repositories/product_details/product_details_repository.dart';
import 'package:hh_express/settings/consts.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ProductDetailsRepo)
class ProductDetailsRepoImpl extends ProductDetailsRepo with DioClientMixin {
  Future<ProductDetailsModel?> get(int id) async {
    final response = await dio.get(endPoint: EndPoints.prodDetails(id));
    if (response.success) {
      return ProductDetailsModel.fromJson(Map.from(response.data));
    }
    return null;
  }
}
