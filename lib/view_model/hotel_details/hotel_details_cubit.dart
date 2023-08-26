import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'hotel_details_state.dart';

class HotelDetailsCubit extends Cubit<HotelDetailsState> {
  HotelDetailsCubit() : super(HotelDetailsInitial());

  static HotelDetailsCubit get(BuildContext context) =>
      BlocProvider.of(context);

  bool isFavorite = false;
  void changeFavorite() {
    isFavorite = !isFavorite;
    emit(FavoriteState(isFavorite));
  }

  bool isRoomViewed = false;
  void addRoomView([bool? value]) {
    isRoomViewed = value ?? !isRoomViewed;
    emit(RoomViewState(isRoomViewed));
  }
}
