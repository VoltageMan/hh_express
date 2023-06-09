import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hh_express/helpers/extentions.dart';

part 'selecteds_filter_event.dart';
part 'selecteds_filter_state.dart';

class SelectedsFilterBloc
    extends Bloc<SelectedsFilterEvent, SelectedsFilterState> {
  SelectedsFilterBloc() : super(SelectedsFilterState(filters: List.empty())) {
    on<SelectedsFilterEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<ClearSelecteds>((event, emit) {
      'Clearselected event'.log();

      emit(SelectedsFilterState(filters: List.empty()));
    });
    on<RemoveSelected>(
      (event, emit) {
        'REmoveSelected event'.log();
        emit(
          SelectedsFilterState(
            filters: List.from(state.filters)..add(event.title),
          ),
        );
      },
    );
  }
}
