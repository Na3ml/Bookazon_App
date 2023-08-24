part of 'filter_cubit.dart';

class FilterState extends Equatable {
  const FilterState();

  @override
  List<Object> get props => [];
}

class FilterInitial extends FilterState {}

class ChangeCountryState extends FilterState {
  final int index;

  const ChangeCountryState(this.index);

  @override
  List<Object> get props => [index];
}

class ChangeSortingState extends FilterState {
  final int index;

  const ChangeSortingState(this.index);

  @override
  List<Object> get props => [index];
}

class ChangeBudgetRange extends FilterState {
  final RangeValues range;

  const ChangeBudgetRange(this.range);

  @override
  List<Object> get props => [range];
}

class ChangeStarState extends FilterState {
  final int index;

  const ChangeStarState(this.index);

  @override
  List<Object> get props => [index];
}

class ChangeFacilitesState extends FilterState {
  final int index;
  final bool value;

  const ChangeFacilitesState({required this.index, required this.value});

  @override
  List<Object> get props => [index, value];
}

class ChangeStayTypeState extends FilterState {
  final int index;
  final bool value;

  const ChangeStayTypeState({required this.index, required this.value});

  @override
  List<Object> get props => [index, value];
}
