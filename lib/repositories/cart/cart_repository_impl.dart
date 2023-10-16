import 'package:hh_express/data/remote/dio_client.dart';
import 'package:hh_express/models/cart/cart_model/cart_model.dart';
import 'package:hh_express/models/cart/cart_update/cart_update_model.dart';
import 'package:hh_express/repositories/cart/cart_repository.dart';
import 'package:hh_express/settings/consts.dart';

class CartRepoImpl extends CartRepo with DioClientMixin {
  Future<CartModel?> getCurrentCart() async {
    final response = await dio.get(endPoint: EndPoints.currentCart);
    if (response.success) {
      final model = CartModel.fromJson(response.data);
      return model;
    }
    return null;
  }

  Future getCartDetails(String id) async {}
  Future<CartModel?> updateCart(CartUpdateModel model) async {
    final response = await dio.post(
      endPoint: EndPoints.cartUpdate,
      data: model.toJson(),
    );
    if (response.success) {
      final model = CartModel.fromJson(response.data);
      return model;
    }
    return null;
  }

  Future<bool> completeCart(String uuid) async {
    final response = await dio.get(endPoint: EndPoints.cartComplete);
    return response.success;
  }

  Future getCartList() async {}
}
