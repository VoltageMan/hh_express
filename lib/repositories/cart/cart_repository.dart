import 'package:hh_express/models/cart/cart_model/cart_model.dart';
import 'package:hh_express/models/cart/cart_update/cart_update_model.dart';

abstract class CartRepo {
  // Future getCartDetails(String id);
  Future<CartModel?> getCurrentCart();
  Future<CartModel?> updateCart(CartUpdateModel model);
  Future<CartModel?> completeCart(String uuid);
  Future<CartModel?> clearCart();
  // Future getCartList();
}
