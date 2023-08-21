// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class AuthResponse {
  final int status;
  final String message;
  final Data? data;

  AuthResponse({
    required this.status,
    required this.message,
    this.data,
  });

  factory AuthResponse.fromJson(Map<String, dynamic> json) {
    return AuthResponse(
      status: json['status'],
      message: json['message'],
      data: json['status'] == 1 ? Data.fromMap(json['data']) : null,
    );
  }
}

class Data {
  final String token;
  final User user;

  Data({
    required this.token,
    required this.user,
  });

  factory Data.fromMap(Map<String, dynamic> map) {
    return Data(
      token: map['token'] as String,
      user: User.fromMap(map['user'] as Map<String, dynamic>),
    );
  }
}

class User {
  final int id;
  final String firstName;
  final String lastName;
  final String email;
  final String phoneNumber;

  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phoneNumber,
  });

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] as int,
      firstName: map['firstName'] as String,
      lastName: map['lastName'] as String,
      email: map['email'] as String,
      phoneNumber: map['phoneNumber'] as String,
    );
  }
}
