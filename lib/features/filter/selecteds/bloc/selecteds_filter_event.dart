part of 'selecteds_filter_bloc.dart';

abstract class SelectedsFilterEvent extends Equatable {
  const SelectedsFilterEvent();
}

class ClearSelecteds extends SelectedsFilterEvent {
  const ClearSelecteds();

  @override
  List<Object?> get props => [];
}

class RemoveSelected extends SelectedsFilterEvent {
  const RemoveSelected({required this.title});
  final String title;

  @override
  List<Object?> get props => [];
}

class AddSelected extends SelectedsFilterEvent {
  const AddSelected({required this.title});
  final String title;

  @override
  List<Object?> get props => [];
}
