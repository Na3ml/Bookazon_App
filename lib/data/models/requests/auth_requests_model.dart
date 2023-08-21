class LoginRequest {
  final String email;
  final String password;

  const LoginRequest({
    required this.email,
    required this.password,
  });
}

class RegisterRequest {
  final String firstName;
  final String lastName;
  final String email;
  final String password;
  final String phone;

  const RegisterRequest({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.phone,
  });
}

class VerifyEmailRequest {
  final String email;
  final String otp;

  const VerifyEmailRequest({
    required this.email,
    required this.otp,
  });
}

class ResetPasswordRequest {
  final String email;
  final String password;
  final String token;

  const ResetPasswordRequest({
    required this.email,
    required this.password,
    required this.token,
  });
}
