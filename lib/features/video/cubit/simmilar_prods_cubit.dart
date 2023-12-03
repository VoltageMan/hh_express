import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hh_express/app/setup.dart';
import 'package:hh_express/models/pagination/pagination_model.dart';
import 'package:hh_express/models/products/product_model.dart';
import 'package:hh_express/repositories/products/product_repo.dart';
import 'package:hh_express/settings/consts.dart';
import 'package:hh_express/settings/enums.dart';

part 'simmilar_prods_state.dart';

class SimmilarProdsCubit extends Cubit<SimmilarProdsState> {
  SimmilarProdsCubit() : super(SimmilarProdsState(state: ProductAPIState.init));
  int videoId = 0;
  final _repo = getIt<ProductRepo>();

  Future<void> init({bool forUpdate = false}) async {
    if (state.state != ProductAPIState.init &&
        state.state != ProductAPIState.error &&
        !forUpdate) {
      return;
    }
    emit(
      SimmilarProdsState(state: ProductAPIState.loading),
    );
    final data = await _repo.getProducts(
      videoId: videoId,
      slugs: List.empty(),
      properties: List.empty(),
      page: 0,
    );

    if (data != null) {
      return emit(
        SimmilarProdsState(
          state: ProductAPIState.success,
          pagination: data[APIKeys.pagination],
          prods: List.from(
            data[APIKeys.products],
          ),
        ),
      );
    }
    return emit(SimmilarProdsState(state: ProductAPIState.error));
  }

  Future<void> loadMore() async {
    emit(
      SimmilarProdsState(
        state: ProductAPIState.loadingMore,
        pagination: state.pagination,
        prods: List.from(
          state.prods ?? List.empty(),
        ),
      ),
    );
    final data = await _repo.getProducts(
      slugs: List.empty(),
      properties: List.empty(),
      videoId: videoId,
      page: state.pagination!.currentPage + 1,
    );
    if (data != null) {
      return emit(
        SimmilarProdsState(
          state: ProductAPIState.success,
          pagination: data[APIKeys.pagination],
          prods: List.from(state.prods ?? List.empty())
            ..addAll(
              data[APIKeys.products],
            ),
        ),
      );
    }
    return emit(
      SimmilarProdsState(
        state: ProductAPIState.loadingMoreError,
        pagination: state.pagination,
        prods: List.from(state.prods ?? List.empty()),
      ),
    );
  }

  void clear() {
    emit(SimmilarProdsState(state: ProductAPIState.init));
  }
}
