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
    int status = json['status'];
    Data? data;
    if (status == 1) {
      if (json['data'] is Map<String, dynamic>) {
        data = Data.fromMap(json['data']);
      }
    }
    return AuthResponse(status: status, message: json['message'], data: data);
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
      firstName: map['first_name'] as String,
      lastName: map['last_name'] as String,
      email: map['email'] as String,
      phoneNumber: map['phone_number'] as String,
    );
  }
}
