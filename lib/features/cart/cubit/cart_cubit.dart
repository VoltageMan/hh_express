import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hh_express/app/setup.dart';
import 'package:hh_express/data/local/secured_storage.dart';
import 'package:hh_express/helpers/overlay_helper.dart';
import 'package:hh_express/models/cart/cart_model/cart_model.dart';
import 'package:hh_express/models/cart/cart_update/cart_update_model.dart';
import 'package:hh_express/repositories/cart/cart_repository.dart';
import 'package:hh_express/settings/enums.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartState(apiState: CartAPIState.init));
  final _repo = getIt<CartRepo>();
  Future<void> getCurrentCart() async {
    emit(
      CartState(
        apiState: CartAPIState.loading,
        cart: state.cart,
      ),
    );
    if (LocalStorage.getToken == null) {
      emit(
        CartState(
          apiState: CartAPIState.unAuthorized,
          cart: state.cart,
        ),
      );
      return;
    }
    final data = await _repo.getCurrentCart();
    if (data != null) {
      emit(
        CartState(
          apiState: CartAPIState.succses,
          cart: data,
        ),
      );
      return;
    }
    emit(
      CartState(
        apiState: CartAPIState.error,
        cart: data,
      ),
    );
  }

  Future<void> cartUpdate(CartUpdateModel model) async {
    OverlayHelper.showLoading();
    final data = await _repo.updateCart(model);
    SnackBarHelper.showMessageSnack(
        data != null ? 'succses' : 'some things went wrong');
    OverlayHelper.remove();
  }

  int getQuantity(int id, {List? selectedProps}) {
    if (state.apiState == CartAPIState.unAuthorized) {
      return 0;
    }
    final list = state.cart!.orders.map((e) => e.product.id).toList();
    final index = list.indexOf(id);
    if (index == -1) {
      return 0;
    }

    return state.cart!.orders[index].quantity;
  }

  Future<void> complete() async {}
}
