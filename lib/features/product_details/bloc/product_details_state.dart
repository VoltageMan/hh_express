part of 'product_details_bloc.dart';

class ProductDetailsState extends Equatable {
  final ProdDetailsAPIState state;
  final List<ProductDetailsModel> products;
  final CancelToken? cancelToken;
  ProductDetailsState({
    required this.products,
    required this.state,
    this.cancelToken,
  });

  @override
  List<Object?> get props => [state, products, cancelToken];
}
