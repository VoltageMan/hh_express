part of 'home_bloc.dart';

final class HomeState extends Equatable {
  const HomeState({
    required this.state,
    this.pagination,
    this.prods,
  });

  final ProductAPIState state;
  final List<ProductModel>? prods;
  final PaginationModel? pagination;

  @override
  List<Object?> get props => [state, prods, pagination];
}
