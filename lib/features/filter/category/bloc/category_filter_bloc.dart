import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'category_filter_event.dart';
part 'category_filter_state.dart';

class CategoryFilterBloc extends Bloc<CategoryFilterEvent, CategoryFilterState> {
  CategoryFilterBloc() : super(CategoryFilterInitial()) {
    on<CategoryFilterEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
