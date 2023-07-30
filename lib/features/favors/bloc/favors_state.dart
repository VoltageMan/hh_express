part of 'favors_bloc.dart';

abstract class FavorsState extends Equatable {
  const FavorsState();
  
  @override
  List<Object> get props => [];
}

class FavorsInitial extends FavorsState {}
