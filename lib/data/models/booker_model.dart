// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class BookerModel extends Equatable {
  final String firstName;
  final String lastName;
  final String email;
  final String password;
  final String phoneNumber;
  final String address;
  final String gender;

  const BookerModel({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.phoneNumber,
    required this.address,
    required this.gender,
  });

  BookerModel copyWith({
    String? firstName,
    String? lastName,
    String? email,
    String? password,
    String? phoneNumber,
    String? address,
    String? gender,
  }) {
    return BookerModel(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      password: password ?? this.password,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      address: address ?? this.address,
      gender: gender ?? this.gender,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'password': password,
      'phoneNumber': phoneNumber,
      'address': address,
      'gender': gender,
    };
  }

  factory BookerModel.fromMap(Map<String, dynamic> map) {
    return BookerModel(
      firstName: map['firstName'] as String,
      lastName: map['lastName'] as String,
      email: map['email'] as String,
      password: map['password'] as String,
      phoneNumber: map['phoneNumber'] as String,
      address: map['address'] as String,
      gender: map['gender'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory BookerModel.fromJson(String source) =>
      BookerModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  List<Object> get props {
    return [
      firstName,
      lastName,
      email,
      password,
      phoneNumber,
      address,
      gender,
    ];
  }

  @override
  bool? get stringify => true;
}
