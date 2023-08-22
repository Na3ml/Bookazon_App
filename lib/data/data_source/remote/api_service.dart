import 'package:dio/dio.dart';

const String baseUrl = "https://bookazon.tadafoq.com/api/";

class EndPoints {
  EndPoints._();

  static const String login = "auth/login";
  static const String register = "auth/register";
  static const String logout = "auth/logout";
  static const String userProfile = "auth/user-profile";
  static const String search = "search";
  static const String offer = "offer";
  static const String popular = "popular";
  
}

class Headers {
  Headers._();

  static const String contentType = "content-type";
  static const String applicationJson = "application/json";
  static const String accept = "accept";
}

class ApiService {
  final Dio _dio;

  static Map<String, String> headers = {
    Headers.contentType: Headers.applicationJson,
    Headers.accept: Headers.applicationJson,
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
        );

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
  }) async {
    return await _dio.post(
      endPoint,
      data: body,
      queryParameters: query,
    );
  }
}
