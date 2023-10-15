import 'package:hh_express/data/remote/dio_client.dart';
import 'package:hh_express/repositories/cart/cart_repository.dart';
import 'package:hh_express/settings/consts.dart';

class CartRepoImpl extends CartRepo with DioClientMixin {
  Future getCurrentCart() async {
    dio.get(endPoint: EndPoints.currentCart);
  }

  Future getCartDetails(String id) async {}
  Future updateCart() async {}
  Future getCartList() async {}
  Future completeCart() async {}
}
