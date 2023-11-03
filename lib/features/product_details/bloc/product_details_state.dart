part of 'product_details_bloc.dart';

class ProductDetailsState extends Equatable {
  final ProdDetailsAPIState state;
  final ProductDetailsModel? product;
  final CancelToken? cancelToken;
  ProductDetailsState({
    this.product,
    required this.state,
    this.cancelToken,
  });

  @override
  List<Object?> get props => [state, product, cancelToken];
}
