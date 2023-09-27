import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hh_express/app/setup.dart';
import 'package:hh_express/features/categories/bloc/category_bloc.dart';
import 'package:hh_express/models/property/property_model.dart';
import 'package:hh_express/models/property/values/property_value_model.dart';
import 'package:hh_express/repositories/filters/filters_repository.dart';
import 'package:hh_express/settings/enums.dart';
import 'package:meta/meta.dart';

part 'filter_event.dart';
part 'filter_state.dart';

final class FilterBloc extends Bloc<FilterEvent, FilterState> {
  FilterBloc() : super(FilterState.empty(FilterAPIState.init)) {
    final repo = getIt<FilterRepo>();

    on<AddFilterProperty>(
      (event, emit) {
        final theProp = event.model;
        if (isSelected(theProp.id)) return;

        emit(
          FilterState(
            filterByNews: state.filterByNews,
            properties: List.from(state.properties!),
            selecteds: List.from(state.selecteds)..add(theProp),
            state: FilterAPIState.succses,
          ),
        );
      },
    );
    on<RemoveFilterProperty>(
      (event, Emitter emit) {
        final newProp = event.model;
        emit(
          FilterState(
            filterByNews: state.filterByNews,
            properties: List.from(state.properties!),
            selecteds: List.from(state.selecteds)..remove(newProp),
            state: FilterAPIState.succses,
          ),
        );
      },
    );
    on<ClearFilter>(
      (event, Emitter emit) {
        emit(
          FilterState(
            filterByNews: state.filterByNews,
            properties: List.from(state.properties!),
            selecteds: List.empty(),
            state: FilterAPIState.succses,
          ),
        );
      },
    );
    on<FilterInit>((event, emit) async {
      if (state.properties!.isNotEmpty) return;
      emit(FilterState.empty(FilterAPIState.loading));
      final data = await repo.getProps();
      if (data != null) {
        return emit(
          FilterState(
            filterByNews: false,
            properties: data,
            selecteds: List.empty(),
            state: FilterAPIState.succses,
          ),
        );
      }
      return emit(FilterState.empty(FilterAPIState.error));
    });
  }

  bool isSelected(int id) {
    final num = state.selecteds.map((e) => e.id).toList().indexOf(id);
    return num != -1;
  }
}
