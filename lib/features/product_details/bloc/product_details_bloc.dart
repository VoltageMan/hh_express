import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:hh_express/app/setup.dart';
import 'package:hh_express/helpers/extentions.dart';
import 'package:hh_express/models/product_details/product_details_model.dart';
import 'package:hh_express/repositories/product_details/product_details_repository.dart';
import 'package:hh_express/settings/enums.dart';

part 'product_details_state.dart';

class ProductDetailsBloc extends Cubit<ProductDetailsState> {
  ProductDetailsBloc()
      : super(
          ProductDetailsState(
            state: ProdDetailsAPIState.init,
            products: List.empty(
              growable: true,
            ),
          ),
        );
  int? currentProdId;
  List<int> sesectedProps = List.empty(growable: true);
  final repo = getIt<ProductDetailsRepo>();

  Future<void> init(int id) async {
    currentProdId = id;
    final cancleToken = CancelToken();
    emit(
      ProductDetailsState(
        state: ProdDetailsAPIState.loading,
        products: List.from(state.products),
        cancelToken: cancleToken,
      ),
    );
    final product = await repo.get(
      id,
      cancleToken,
    );
    if (product != null) {
      sesectedProps.add(0);
      return emit(
        ProductDetailsState(
          state: ProdDetailsAPIState.succses,
          products: List.from(state.products)..add(product),
        ),
      );
    }
    if (cancleToken.isCancelled) return;
    return emit(
      ProductDetailsState(
        state: ProdDetailsAPIState.error,
        products: List.from(state.products),
      )..log(message: 'Getting Error'),
    );
  }

  void screenDispose() {
    state.cancelToken?.cancel();
    final List<ProductDetailsModel> newProd = List.from(state.products);
    if (state.state == ProdDetailsAPIState.succses) {
      sesectedProps.removeLast();
      newProd.removeLast();
    }
    currentProdId = newProd.isNotEmpty ? newProd.last.id : null;
    emit(
      ProductDetailsState(
        products: newProd,
        state: ProdDetailsAPIState.succses,
      )..log(message: 'disposing Succses State'),
    );
  }

  int fingProdIndex(int id) {
    return state.products.map((e) => e.id).toList().indexOf(id);
  }
}
