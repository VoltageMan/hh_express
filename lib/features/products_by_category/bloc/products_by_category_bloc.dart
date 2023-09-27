import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hh_express/app/setup.dart';
import 'package:hh_express/features/filter/bloc/filter_bloc.dart';
import 'package:hh_express/helpers/extentions.dart';
import 'package:hh_express/helpers/routes.dart';
import 'package:hh_express/models/categories/category_model.dart';
import 'package:hh_express/models/pagination/pagination_model.dart';
import 'package:hh_express/models/products/product_model.dart';
import 'package:hh_express/models/property/values/property_value_model.dart';
import 'package:hh_express/repositories/products/product_repo.dart';
import 'package:hh_express/settings/consts.dart';
import 'package:hh_express/settings/enums.dart';

part 'products_by_category_state.dart';

class ProductsByCategoryBloc extends Cubit<ProductsByCategoryState> {
  ProductsByCategoryBloc()
      : super(ProductsByCategoryState(state: ProductAPIState.init));
  final _repo = getIt<ProductRepo>();

  List<PropertyValue> _filters = List.empty();

  Future<void> init(CategoryModel category) async {
    emit(
      ProductsByCategoryState(
        state: ProductAPIState.loading,
        category: category,
        pagination: null,
        products: null,
      ),
    );
    final data = await _repo.getProducts(
      slugs: List.empty(growable: true)..add(category.slug),
      properties: _filters.map((e) => e.id).toList(),
      page: 0,
    );
    if (data != null) {
      emit(
        ProductsByCategoryState(
          state: ProductAPIState.succses,
          pagination: data[APIKeys.pagination],
          products: List.from(data[APIKeys.products]),
          category: category,
        ),
      );
      return;
    }
    return emit(
      ProductsByCategoryState(
        state: ProductAPIState.error,
        category: category,
      ),
    );
  }

  Future<void> loadMore() async {
    emit(
      ProductsByCategoryState(
        state: ProductAPIState.loadingMore,
        category: state.category,
        pagination: state.pagination,
        products: List.from(state.products!),
      ),
    );
    final data = await _repo.getProducts(
      slugs: List.empty(growable: true)..add(state.category!.slug),
      properties: _filters.map((e) => e.id).toList(),
      page: state.pagination!.currentPage + 1,
    );
    if (data != null) {
      return emit(
        ProductsByCategoryState(
          state: ProductAPIState.succses,
          category: state.category,
          pagination: data[APIKeys.pagination],
          products: List.from(state.products ?? [])
            ..addAll(data[APIKeys.products]),
        ),
      );
    }
    return emit(
      ProductsByCategoryState(
        state: ProductAPIState.loadingMoreError,
        category: state.category,
        pagination: state.pagination,
        products: List.from(
          state.products ?? List.empty(),
        ),
      ),
    );
  }

  void filter() {
    final filterBloc = appRouter.currentContext.read<FilterBloc>();
    _filters = List.from(filterBloc.state.selecteds);
    if (state.state != ProductAPIState.init) return;
    init(state.category!);
  }
}
