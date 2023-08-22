import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

const String baseUrl = "https://bookazon.tadafoq.com/api/";

class EndPoints {
  EndPoints._();

  static const String login = "auth/login";
  static const String register = "auth/register";
  static const String forgetPassword = "auth/reset-password";
  static const String checkOtp = "auth/check-token";
  static const String updatePassword = "auth/update-password";
  static const String userProfile = "auth/user-profile";
  static const String logout = "auth/logout";

  static const String search = "search";
  static const String offer = "offer";
  static const String popular = "popular";
}

class ApiService {
  final Dio _dio;

  static Map<String, String> headers = {
    // "Content-Type": "application/json",
  };

  ApiService()
      : _dio = Dio(
          BaseOptions(
            baseUrl: baseUrl,
            headers: headers,
            receiveDataWhenStatusError: true,
            connectTimeout: const Duration(milliseconds: 3600),
            receiveTimeout: const Duration(milliseconds: 3600),
          ),
        ) {
    if (!kReleaseMode) {
      _dio.interceptors.add(
        // Pretty Dio logger is a Dio interceptor that logs network calls in a pretty, easy to read format.
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseHeader: true,
        ),
      );
    }
  }

  Future<Response> getData({
    required String endPoint,
    Map<String, dynamic>? query,
  }) async {
    return await _dio.get(
      endPoint,
      queryParameters: query,
    );
  }

  Future<Response> postData({
    required String endPoint,
    required Map<String, dynamic> body,
    Map<String, dynamic>? query,
    String? token,
  }) async {
    return await _dio.post(
      endPoint,
      data: body,
      queryParameters: query,
      options: Options(
        headers: {"Authorization": "Bearer $token"},
      ),
    );
  }
}
