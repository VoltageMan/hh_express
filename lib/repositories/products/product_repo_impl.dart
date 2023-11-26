import 'package:hh_express/data/remote/dio_client.dart';
import 'package:hh_express/models/delivery_info/deliery_info_model.dart';
import 'package:hh_express/models/pagination/pagination_model.dart';
import 'package:hh_express/models/products/product_model.dart';
import 'package:hh_express/repositories/products/product_repo.dart';
import 'package:hh_express/settings/consts.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ProductRepo)
class ProductRepoImpl extends ProductRepo with DioClientMixin {
  @override
  Future<Map<String, dynamic>?> getProducts({
    required List<String> slugs,
    required List<int> properties,
    required int page,
    String? search,
    int? videoId,
  }) async {
    final response = await dio.get(
        endPoint: _endPoint(slugs, properties, page, videoId),
        queryParameters: search != null ? {'search': search} : null);
    if (response.success) {
      // converting paginationModel from json
      final data = response.data[APIKeys.products];
      final pagination = PaginationModel.fromJson(data[APIKeys.pagination]);

      // converting productList from json
      final products = (data[APIKeys.data] as List<dynamic>)
          .map((e) => ProductModel.fromJson(e as Map<String, dynamic>))
          .toList();
      return {
        APIKeys.pagination: pagination,
        APIKeys.products: products,
      };
    }
    return null;
  }

  @override
  Future<List<DeliveryInfoModel>?> getDeliveryInfo() async {
    final response = await dio.get(endPoint: EndPoints.deliveryInfo);
    if (response.success) {
      final dataList =
          (response.data as Map<String, dynamic>)[APIKeys.deliveryInfo] as List;
      return dataList.map((e) => DeliveryInfoModel.fromMap(e)).toList();
    }
    return null;
  }

  String _endPoint(
      List<String> slugs, List<int> properties, int page, int? videoId) {
    if (slugs.isEmpty && properties.isEmpty) {
      return '${EndPoints.products}?${APIKeys.page}=$page';
    }
    List<String> slugList = List.empty();
    List<String> propertyList = List.empty();
    if (slugs.isNotEmpty) {
      slugList = List.generate(
        slugs.length,
        (index) {
          return '${APIKeys.categories}${APIKeys.urlDecoder}=${slugs[index]}';
        },
      );
    }
    if (properties.isNotEmpty) {
      propertyList = List.generate(
        properties.length,
        (index) {
          return '${APIKeys.properties}${APIKeys.urlDecoder}=${properties[index]}';
        },
      );
    }
    final propertiesUrl = propertyList.join('&');
    final slugsUrl = slugList.join('&');
    final videoParam = videoId == null ? '' : 'video_id=$videoId';
    final joiner = propertiesUrl.isNotEmpty && slugsUrl.isNotEmpty ? '&' : '';
    return '${EndPoints.products}?$propertiesUrl$joiner$slugsUrl&${APIKeys.page}=$page&ishome=true$videoId';
  }
}
