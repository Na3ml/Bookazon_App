import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'booking_state.dart';

class BookingCubit extends Cubit<BookingState> {
  BookingCubit() : super(BookingInitial());

  static BookingCubit get(BuildContext context) => BlocProvider.of(context);

  int bookingType = 0;
  void changeType(int type) {
    bookingType = type;
    emit(ChangeBookingState(type));
  }
}
