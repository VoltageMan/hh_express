import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hh_express/app/setup.dart';
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
        final newState = FilterState.update(state);

        if (forHome) {
          newState.homeSelecteds.add(theProp);
        } else {
          newState.prodByCatselecteds.add(theProp);
        }
        emit(newState);
      },
    );
    on<RemoveFilterProperty>(
      (event, Emitter emit) {
        final theProp = event.model;
        final newState = FilterState.update(state);
        if (forHome) {
          newState.homeSelecteds.remove(theProp);
        } else {
          newState.prodByCatselecteds.remove(theProp);
        }
        emit(newState);
      },
    );
    on<ClearFilter>(
      (event, Emitter emit) {
        final newState = FilterState.update(state);
        if (forHome) {
          newState.homeSelecteds.clear();
        } else {
          newState.prodByCatselecteds.clear();
        }
        emit(newState);
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
            prodByCatselecteds: List.empty(growable: true),
            homeSelecteds: List.empty(growable: true),
            state: FilterAPIState.success,
          ),
        );
      }
      return emit(FilterState.empty(FilterAPIState.error));
    });
  }
  bool forHome = false;

  bool isSelected(int id) {
    final selecteds = forHome ? state.homeSelecteds : state.prodByCatselecteds;
    final num = selecteds.map((e) => e.id).toList().indexOf(id);
    return num != -1;
  }
}
