part of 'home_cubit.dart';

class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

final class HomeInitial extends HomeState {}

/// data
class DataLoadingState extends HomeState {}

class DataSuccessState extends HomeState {}

class DataErrorState extends HomeState {
  final String error;
  const DataErrorState(this.error);

  @override
  List<Object> get props => [error];
}

/// Date
class ChangeDateState extends HomeState {
  final DateTime date;
  final bool isFromDate;

  const ChangeDateState(this.date, this.isFromDate);

  @override
  List<Object> get props => [date, isFromDate];
}

/// search
class SearchState extends HomeState {}

class SearchLoadingState extends SearchState {}

class SearchSuccessState extends SearchState {}

class SearchErrorState extends SearchState {
  final String error;
  SearchErrorState(this.error);

  @override
  List<Object> get props => [error];
}

/// guests count
class ChangeRoomsCountState extends HomeState {
  final int count;
  const ChangeRoomsCountState(this.count);
  @override
  List<Object> get props => [count];
}

class ChangeAdultsCountState extends HomeState {
  final int count;
  const ChangeAdultsCountState(this.count);
  @override
  List<Object> get props => [count];
}

class ChangeChildrenCountState extends HomeState {
  final int count;
  const ChangeChildrenCountState(this.count);
  @override
  List<Object> get props => [count];
}