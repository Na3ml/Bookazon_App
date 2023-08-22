part of 'booking_cubit.dart';

class BookingState extends Equatable {
  const BookingState();

  @override
  List<Object> get props => [];
}

class BookingInitial extends BookingState {}

class ChangeBookingState extends BookingState {
  final int type;

  const ChangeBookingState(this.type);

  @override
  List<Object> get props => [type];
}
