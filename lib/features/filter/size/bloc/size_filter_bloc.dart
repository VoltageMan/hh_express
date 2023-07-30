import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'size_filter_event.dart';
part 'size_filter_state.dart';

class SizeFilterBloc extends Bloc<SizeFilterEvent, SizeFilterState> {
  SizeFilterBloc() : super(SizeFilterInitial()) {
    on<SizeFilterEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
