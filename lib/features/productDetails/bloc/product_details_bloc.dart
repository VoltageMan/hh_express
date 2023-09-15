import 'package:bloc/bloc.dart';
import 'package:hh_express/app/setup.dart';
import 'package:hh_express/models/product_details/product_details_model.dart';
import 'package:hh_express/repositories/product_details/product_details_repository.dart';
import 'package:hh_express/settings/enums.dart';

part 'product_details_state.dart';

class ProductDetailsBloc extends Cubit<ProductDetailsState> {
  ProductDetailsBloc()
      : super(ProductDetailsState(state: ProdDetailsAPIState.init));

  final repo = getIt<ProductDetailsRepo>();
  Future<void> init(int id) async {
    emit(
      ProductDetailsState(
        state: ProdDetailsAPIState.loading,
      ),
    );
    final product = await repo.get(id);
    if (product != null) {
      return emit(
        ProductDetailsState(
          state: ProdDetailsAPIState.succses,
          product: product,
        ),
      );
    }
    return emit(ProductDetailsState(state: ProdDetailsAPIState.error));
  }
}
