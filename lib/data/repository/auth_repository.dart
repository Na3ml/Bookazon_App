import 'package:bookazon/data/data_source/remote/api_service.dart';
import 'package:bookazon/data/models/responses/auth_response_model.dart';
import 'package:bookazon/data/network/network_info.dart';

import '../error_handler/error_handler.dart';
import '../models/requests/auth_requests_model.dart';

abstract class AuthRepository {
  Future<AuthResponse> login(LoginRequest request);
  Future<AuthResponse> register(RegisterRequest request);
  Future<bool> forgotPassword(String email);
  Future<bool> verifyEmail(VerifyEmailRequest request);
  Future<bool> resetPassword(ResetPasswordRequest request);
}

class AuthRepositoryImpl extends AuthRepository {
  final NetworkInfo _networkInfo;
  final ApiService _apiService;

  AuthRepositoryImpl({
    required NetworkInfo networkInfo,
    required ApiService apiService,
  })  : _networkInfo = networkInfo,
        _apiService = apiService;

  @override
  Future<AuthResponse> login(LoginRequest request) async {
    if (await _networkInfo.isConnected) {
      try {
        var response = await _apiService.postData(
          endPoint: EndPoints.login,
          body: {
            "email": request.email,
            "password": request.password,
          },
        );
        return AuthResponse.fromJson(response.data);
      } catch (e) {
        throw CustomException(e.toString());
      }
    } else {
      throw CustomException("Check your network connection");
    }
  }

  @override
  Future<AuthResponse> register(RegisterRequest request) async {
    if (await _networkInfo.isConnected) {
      try {
        var response = await _apiService.postData(
          endPoint: EndPoints.login,
          body: {
            "first_name": request.firstName,
            "last_name": request.lastName,
            "email": request.email,
            "password": request.password,
            "c_password": request.password,
            "phone_number": request.phone,
          },
        );
        return AuthResponse.fromJson(response.data);
      } catch (e) {
        throw CustomException(e.toString());
      }
    } else {
      throw CustomException("Check your network connection");
    }
  }

  @override
  Future<bool> forgotPassword(String email) async {
    if (await _networkInfo.isConnected) {
      try {
        var response = await _apiService.postData(
          endPoint: EndPoints.login,
          body: {
            "email": email,
          },
        );
        var responseModel = AuthResponse.fromJson(response.data);
        return responseModel.status == 1;
      } catch (e) {
        throw CustomException(e.toString());
      }
    } else {
      throw CustomException("Check your network connection");
    }
  }

  @override
  Future<bool> verifyEmail(VerifyEmailRequest request) async {
    if (await _networkInfo.isConnected) {
      try {
        var response = await _apiService.postData(
          endPoint: EndPoints.login,
          body: {
            "email": request.email,
            "otp": request.otp,
          },
        );
        var responseModel = AuthResponse.fromJson(response.data);
        return responseModel.status == 1;
      } catch (e) {
        throw CustomException(e.toString());
      }
    } else {
      throw CustomException("Check your network connection");
    }
  }

  @override
  Future<bool> resetPassword(ResetPasswordRequest request) async {
    if (await _networkInfo.isConnected) {
      try {
        var response = await _apiService.postData(
          endPoint: EndPoints.login,
          body: {
            "email": request.email,
            "password": request.password,
            "token": request.token,
          },
        );
        var responseModel = AuthResponse.fromJson(response.data);
        return responseModel.status == 1;
      } catch (e) {
        throw CustomException(e.toString());
      }
    } else {
      throw CustomException("Check your network connection");
    }
  }
}
