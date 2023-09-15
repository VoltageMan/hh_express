part of 'product_details_bloc.dart';

class ProductDetailsState {
  final ProdDetailsAPIState state;
  final ProductDetailsModel? product;

  const ProductDetailsState({
    this.product,
    required this.state,
  });
}
