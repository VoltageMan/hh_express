
abstract class CartRepo {
  Future getCartDetails(String id);
  Future getCurrentCart();
  Future updateCart();
  Future getCartList();
  Future completeCart();
}
