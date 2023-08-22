import 'dart:developer';

import 'package:bookazon/data/data_source/remote/api_service.dart';
import 'package:bookazon/data/models/responses/auth_response_model.dart';
import 'package:bookazon/data/network/network_info.dart';

import '../error_handler/error_handler.dart';
import '../models/requests/auth_requests_model.dart';

abstract class AuthRepository {
  Future<AuthResponse> login(LoginRequest request);
  Future<AuthResponse> register(RegisterRequest request);
  Future<AuthResponse> forgotPassword(String email);
  Future<AuthResponse> verifyEmail(String otp);
  Future<AuthResponse> resetPassword(ResetPasswordRequest request);
  Future<void> logout(String token);
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
        throw CustomException("Repo Error: $e");
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
          endPoint: EndPoints.register,
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
  Future<AuthResponse> forgotPassword(String email) async {
    if (await _networkInfo.isConnected) {
      try {
        var response = await _apiService.postData(
          endPoint: EndPoints.forgetPassword,
          body: {
            "email": email,
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
  Future<AuthResponse> verifyEmail(String otp) async {
    if (await _networkInfo.isConnected) {
      try {
        var response = await _apiService.postData(
          endPoint: EndPoints.checkOtp,
          body: {
            "token": otp,
          },
        );
        return AuthResponse.fromJson(response.data);
      } catch (e) {
        throw CustomException("repo error $e");
      }
    } else {
      throw CustomException("Check your network connection");
    }
  }

  @override
  Future<AuthResponse> resetPassword(ResetPasswordRequest request) async {
    if (await _networkInfo.isConnected) {
      try {
        var response = await _apiService.postData(
          endPoint: EndPoints.updatePassword,
          body: {
            "email": request.email,
            "password": request.password,
            "password_confirmation": request.password,
            "token": request.token,
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
  Future<void> logout(String token) async {
    if (await _networkInfo.isConnected) {
      try {
        await _apiService.postData(
          endPoint: EndPoints.logout,
          body: {},
          token: token,
        );
      } catch (e) {
        throw CustomException(e.toString());
      }
    } else {
      throw CustomException("Check your network connection");
    }
  }
}
