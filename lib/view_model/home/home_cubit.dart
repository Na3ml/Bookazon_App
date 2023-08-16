import 'package:bookazon/data/error_handler/error_handler.dart';
import 'package:bookazon/data/models/stays_model.dart';
import 'package:bookazon/data/models/requests/home_requests_model.dart';
import 'package:bookazon/data/repository/home_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepository repo;
  HomeCubit(this.repo) : super(HomeInitial());

  static HomeCubit get(BuildContext context) => BlocProvider.of(context);

  List<StayModel> stays = [];
  Future<void> getSearchStays(SearchStayRequest request) async {
    emit(SearchLoadingState());
    try {
      repo.searchAccomodation(request).then((elements) {
        stays.addAll(elements);
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
        offerStays.addAll(elements);
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
        popularStays.addAll(elements);
        emit(DataSuccessState());
      });
    } catch (error) {
      if (error is CustomException) {
        emit(DataErrorState(error.message));
      }
    }
  }
}
