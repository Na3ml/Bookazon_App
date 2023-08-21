// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class BookerModel extends Equatable {
  final String firstName;
  final String lastName;
  final String email;
  final String? phoneNumber;
  final String? address;
  final String? gender;
  final String? paymentCvv;

  const BookerModel(
      {required this.firstName,
      required this.lastName,
      required this.email,
      this.phoneNumber,
      this.address,
      this.gender,
      this.paymentCvv});

  BookerModel copyWith({
    String? firstName,
    String? lastName,
    String? email,
    String? phoneNumber,
    String? address,
    String? gender,
    String? paymentCvv,
  }) {
    return BookerModel(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      address: address ?? this.address,
      gender: gender ?? this.gender,
      paymentCvv: paymentCvv ?? this.paymentCvv,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'phoneNumber': phoneNumber,
      'address': address,
      'gender': gender,
      'paymentCvv': paymentCvv,
    };
  }

  factory BookerModel.fromMap(Map<String, dynamic> map) {
    return BookerModel(
      firstName: map['firstName'] as String,
      lastName: map['lastName'] as String,
      email: map['email'] as String,
      phoneNumber:
          map['phoneNumber'] != null ? map['phoneNumber'] as String : null,
      address: map['address'] != null ? map['address'] as String : null,
      gender: map['gender'] != null ? map['gender'] as String : null,
      paymentCvv:
          map['paymentCvv'] != null ? map['paymentCvv'] as String : null,
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
    ];
  }

  @override
  bool? get stringify => true;
}
