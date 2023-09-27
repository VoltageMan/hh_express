part of 'filter_bloc.dart';

final class FilterState extends Equatable {
  const FilterState({
    required this.filterByNews,
    required this.properties,
    required this.selecteds,
    required this.state,
  });
  final FilterAPIState state;
  final List<PropertyValue> selecteds;
  final List<PropertyModel>? properties;
  final bool filterByNews;

  @override
  List<Object?> get props => [state, selecteds, properties, filterByNews];

  factory FilterState.empty(FilterAPIState state) {
    return FilterState(
      filterByNews: false,
      properties: List.empty(),
      selecteds: List.empty(),
      state: state,
    );
  }
}
