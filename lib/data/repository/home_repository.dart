import 'package:bookazon/data/data_source/remote/api_service.dart';
import 'package:bookazon/data/models/requests/home_requests_model.dart';

import '../error_handler/error_handler.dart';
import '../models/stays_model.dart';
import '../network/network_info.dart';

abstract class HomeRepository {
  Future<List<StayModel>> searchAccomodation(SearchStayRequest request);
  Future<List<StayModel>> getPopularStays();
  Future<List<StayModel>> getOfferStays();
}

class HomeRepositoryImpl implements HomeRepository {
  final NetworkInfo _networkInfo;
  final ApiService _apiService;

  HomeRepositoryImpl({
    required NetworkInfo networkInfo,
    required ApiService apiService,
  })  : _networkInfo = networkInfo,
        _apiService = apiService;

  @override
  Future<List<StayModel>> searchAccomodation(SearchStayRequest request) async {
    List<StayModel> stays = [];
    if (await _networkInfo.isConnected) {
      try {
        final response = await _apiService.postData(
          endPoint: EndPoints.search,
          body: {
            "going_to": request.goingTo,
            "start_time": request.startTime,
            "end_time": request.endTime,
            "room_count": request.roomCount,
            "adult_count": request.adultCount,
            "children_count": request.childrenAges.length,
            "children_ages": request.childrenAges
          },
        );
        for (var stay in response.data as List<Map<String, dynamic>>) {
          stays.add(StayModel.fromMap(stay));
        }
        return stays;
      } catch (e) {
        throw CustomException(e.toString());
      }
    } else {
      throw CustomException("Check your network connection");
    }
  }

  @override
  Future<List<StayModel>> getOfferStays() async {
    List<StayModel> stays = [];
    if (await _networkInfo.isConnected) {
      try {
        final response = await _apiService.getData(
          endPoint: EndPoints.offer,
        );
        for (var stay in response.data as List<Map<String, dynamic>>) {
          stays.add(StayModel.fromMap(stay));
        }
        return stays;
      } catch (e) {
        throw CustomException(e.toString());
      }
    } else {
      throw CustomException("Check your network connection");
    }
  }

  @override
  Future<List<StayModel>> getPopularStays() async {
    List<StayModel> stays = [];
    if (await _networkInfo.isConnected) {
      try {
        final response = await _apiService.getData(
          endPoint: EndPoints.popular,
        );
        for (var stay in response.data as List<Map<String, dynamic>>) {
          stays.add(StayModel.fromMap(stay));
        }
        return stays;
      } catch (e) {
        throw CustomException(e.toString());
      }
    } else {
      throw CustomException("Check your network connection");
    }
  }
}
