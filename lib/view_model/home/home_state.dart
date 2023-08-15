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
