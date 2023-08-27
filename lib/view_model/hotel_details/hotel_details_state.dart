part of 'hotel_details_cubit.dart';

class HotelDetailsState extends Equatable {
  const HotelDetailsState();

  @override
  List<Object> get props => [];
}

class HotelDetailsInitial extends HotelDetailsState {}

class FavoriteState extends HotelDetailsState {
  final bool value;

  const FavoriteState(this.value);

  @override
  List<Object> get props => [value];
}

class RoomViewState extends HotelDetailsState {
  final bool value;

  const RoomViewState(this.value);

  @override
  List<Object> get props => [value];
}
