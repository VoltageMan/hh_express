part of 'category_filter_bloc.dart';

abstract class CategoryFilterState extends Equatable {
  const CategoryFilterState();
  
  @override
  List<Object> get props => [];
}

class CategoryFilterInitial extends CategoryFilterState {}
