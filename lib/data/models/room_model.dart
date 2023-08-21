
part of 'stays_model.dart';

class RoomModel extends Equatable {
  final List<String> photos;
  final double price;
  final int peopleCapacity;
  // enum
  final RoomType roomType;
  final List<String> mainFacilities;
  final List<String> extraFacilities;
  // enum
  final Availability status;
  const RoomModel({
    required this.photos,
    required this.price,
    required this.peopleCapacity,
    required this.roomType,
    required this.mainFacilities,
    required this.extraFacilities,
    required this.status,
  });

  RoomModel copyWith({
    List<String>? photos,
    double? price,
    int? peopleCapacity,
    RoomType? roomType,
    List<String>? mainFacilities,
    List<String>? extraFacilities,
    Availability? status,
  }) {
    return RoomModel(
      photos: photos ?? this.photos,
      price: price ?? this.price,
      peopleCapacity: peopleCapacity ?? this.peopleCapacity,
      roomType: roomType ?? this.roomType,
      mainFacilities: mainFacilities ?? this.mainFacilities,
      extraFacilities: extraFacilities ?? this.extraFacilities,
      status: status ?? this.status,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'photos': photos,
      'price': price,
      'peopleCapacity': peopleCapacity,
      'roomType': roomType.index,
      'mainFacilities': mainFacilities,
      'extraFacilities': extraFacilities,
    };
  }

  factory RoomModel.fromMap(Map<String, dynamic> map) {
    return RoomModel(
      // if it makes you error try instead
      // (map['photos'] as List<String>).cast<String>()
      photos: map['photos'] as List<String>,
      price: map['price'] as double,
      peopleCapacity: map['peopleCapacity'] as int,
      roomType: RoomType.values[map['roomType'] as int],
      status: Availability.values[map['status'] as int],
      mainFacilities: map['mainFacilities'] as List<String>,
      extraFacilities: map['extraFacilities'] as List<String>,
    );
  }

  String toJson() => json.encode(toMap());

  factory RoomModel.fromJson(String source) =>
      RoomModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      photos,
      price,
      peopleCapacity,
      roomType,
      mainFacilities,
      extraFacilities,
      status,
    ];
  }
}
