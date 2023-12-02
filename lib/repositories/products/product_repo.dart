import 'package:hh_express/models/delivery_info/deliery_info_model.dart';

abstract class ProductRepo {
  Future<Map<String, dynamic>?> getProducts({
    required List<String> slugs,
    required List<int> properties,
    required int page,
    String? search,
    int? videoId,
  });
  Future<DeliveryInfoModel?> getDeliveryInfo();
}
