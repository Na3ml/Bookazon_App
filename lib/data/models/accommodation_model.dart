// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'package:bookazon/data/models/location_model.dart';

part 'room_model.dart';

enum Availability {
  available,
  booked,
}

enum RoomType {
  king,
  queen,
  singleBed,
}

class AccommodationModel extends Equatable {
  final String name;
  final String ownerName;
  final int numOfRooms;
  final int numOfBookings;
  // enum
  final Availability availability;
  final List<RoomModel> rooms;
  final String city;
  final LocationModel location;
  const AccommodationModel({
    required this.name,
    required this.ownerName,
    required this.numOfRooms,
    required this.numOfBookings,
    required this.availability,
    required this.rooms,
    required this.city,
    required this.location,
  });

  AccommodationModel copyWith({
    String? name,
    String? ownerName,
    int? numOfRooms,
    int? numOfBookings,
    Availability? availability,
    List<RoomModel>? rooms,
    String? city,
    LocationModel? location,
  }) {
    return AccommodationModel(
      name: name ?? this.name,
      ownerName: ownerName ?? this.ownerName,
      numOfRooms: numOfRooms ?? this.numOfRooms,
      numOfBookings: numOfBookings ?? this.numOfBookings,
      availability: availability ?? this.availability,
      rooms: rooms ?? this.rooms,
      city: city ?? this.city,
      location: location ?? this.location,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'ownerName': ownerName,
      'numOfRooms': numOfRooms,
      'numOfBookings': numOfBookings,
      'availability': availability.index,
      'rooms': rooms.map((x) => x.toMap()).toList(),
      'city': city,
      'location': location.toMap(),
    };
  }

  factory AccommodationModel.fromMap(Map<String, dynamic> map) {
    return AccommodationModel(
      name: map['name'] as String,
      ownerName: map['ownerName'] as String,
      numOfRooms: map['numOfRooms'] as int,
      numOfBookings: map['numOfBookings'] as int,
      availability: Availability.values[map['availability'] as int],
      rooms: (map['rooms'] as List<Map<String, dynamic>>)
          .map<RoomModel>(
            (x) => RoomModel.fromMap(x),
          )
          .toList(),
      city: map['city'] as String,
      location: LocationModel.fromMap(map['location'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory AccommodationModel.fromJson(String source) =>
      AccommodationModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      name,
      ownerName,
      numOfRooms,
      numOfBookings,
      availability,
      rooms,
      city,
      location,
    ];
  }
}
