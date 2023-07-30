import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'favors_event.dart';
part 'favors_state.dart';

class FavorsBloc extends Bloc<FavorsEvent, FavorsState> {
  FavorsBloc() : super(FavorsInitial()) {
    on<FavorsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
