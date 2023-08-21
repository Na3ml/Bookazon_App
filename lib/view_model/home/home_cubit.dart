import 'package:bookazon/data/error_handler/error_handler.dart';
import 'package:bookazon/data/models/requests/home_requests_model.dart';
import 'package:bookazon/data/repository/home_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/stay_model.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepository repo;
  HomeCubit(this.repo) : super(HomeInitial());

  static HomeCubit get(BuildContext context) => BlocProvider.of(context);

  late final TextEditingController searchController;

  void init() {
    searchController = TextEditingController();
  }

  void dispose() {
    searchController.dispose();
  }

  List<StayModel> stays = [];
  Future<void> getSearchStays(SearchStayRequest request) async {
    emit(SearchLoadingState());
    try {
      repo.searchAccomodation(request).then((elements) {
        stays.addAll(elements as Iterable<StayModel>);
        emit(SearchSuccessState());
      });
    } catch (error) {
      if (error is CustomException) {
        emit(SearchErrorState(error.message));
      }
    }
  }

  List<StayModel> offerStays = [];
  Future<void> getOfferStays() async {
    emit(DataLoadingState());
    try {
      repo.getOfferStays().then((elements) {
        offerStays.addAll(elements as Iterable<StayModel>);
        emit(DataSuccessState());
      });
    } catch (error) {
      if (error is CustomException) {
        emit(DataErrorState(error.message));
      }
    }
  }

  List<StayModel> popularStays = [];
  Future<void> getPopularStays() async {
    emit(DataLoadingState());
    try {
      repo.getPopularStays().then((elements) {
        popularStays.addAll(elements as Iterable<StayModel>);
        emit(DataSuccessState());
      });
    } catch (error) {
      if (error is CustomException) {
        emit(DataErrorState(error.message));
      }
    }
  }

  DateTime? fromDate;
  DateTime? toDate;

  void changeFromDate(DateTime date) {
    fromDate = date;
    emit(ChangeDateState(date, true));
  }

  void changeToDate(DateTime date) {
    toDate = date;
    emit(ChangeDateState(date, false));
  }

  int roomsCount = 1;
  int adultsCount = 1;
  int childrenCount = 0;
  void changeRoomsCount(int count) {
    if (count > 0) {
      roomsCount = count;
      emit(ChangeRoomsCountState(count));
    }
  }

  void changeAdultsCount(int count) {
    if (count > 0) {
      adultsCount = count;
      emit(ChangeAdultsCountState(count));
    }
  }

  void changeChildrenCount(int count) {
    if (count >= 0) {
      childrenCount = count;
      emit(ChangeChildrenCountState(count));
    }
  }
}