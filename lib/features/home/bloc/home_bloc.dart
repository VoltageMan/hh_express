import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hh_express/app/setup.dart';
import 'package:hh_express/helpers/extentions.dart';
import 'package:hh_express/models/pagination/pagination_model.dart';
import 'package:hh_express/models/products/product_model.dart';
import 'package:hh_express/repositories/products/product_repo.dart';
import 'package:hh_express/settings/consts.dart';
import 'package:hh_express/settings/enums.dart';

part 'home_state.dart';

class HomeBloc extends Cubit<HomeState> {
  HomeBloc() : super(HomeState(state: ProductAPIState.init));

  final _repo = getIt<ProductRepo>();
  double lastPosition = 0;

  Future<void> init() async {
    if (state.state != ProductAPIState.init &&
        state.state != ProductAPIState.error) {
      return;
    }
    'Init Home'.log();
    emit(HomeState(state: ProductAPIState.loading));
    final data = await _repo.getProducts(
      slugs: List.empty(),
      properties: List.empty(),
      page: 0,
    );
    if (data != null) {
      return emit(
        HomeState(
          state: ProductAPIState.succses,
          pagination: data[APIKeys.pagination],
          prods: List.from(data[APIKeys.products]),
        ),
      );
    }
    return emit(
      HomeState(
        state: ProductAPIState.error,
      ),
    );
  }

  Future<void> loadMore() async {
    emit(
      HomeState(
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
      page: state.pagination!.currentPage + 1,
    );
    if (data != null) {
      return emit(
        HomeState(
          state: ProductAPIState.succses,
          pagination: data[APIKeys.pagination],
          prods: List.from(state.prods ?? List.empty())
            ..addAll(data[APIKeys.products]),
        ),
      );
    }
    return emit(
      HomeState(
        state: ProductAPIState.loadingMoreError,
        pagination: state.pagination,
        prods: List.from(state.prods ?? List.empty()),
      ),
    );
  }
}
