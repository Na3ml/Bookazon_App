part of 'auth_cubit.dart';

@immutable
abstract class AuthState extends Equatable {
  @override
  List<Object?> get props => [];
}

class AuthInitial extends AuthState {}

class AuthnErrorState extends AuthState {
  final String error;
  AuthnErrorState(this.error);

  @override
  List<Object?> get props => [error];
}

/// login
abstract class LoginState extends AuthState {}

class LoginLoadingState extends LoginState {}

class LoginSuccessState extends LoginState {}

/// register
abstract class RegisterState extends AuthState {}

class RegisterLoadingState extends RegisterState {}

class RegisterSuccessState extends RegisterState {}

/// Forgot password
abstract class ForgotPasswordState extends AuthState {}

class ForgotPasswordLoadingState extends ForgotPasswordState {}

class ForgotPasswordSuccessState extends ForgotPasswordState {}

/// Verfiy Email
abstract class VerifyEmailState extends AuthState {}

class VerifyEmailLoadingState extends VerifyEmailState {}

class VerifyEmailSuccessState extends VerifyEmailState {}

/// reset Email
abstract class ResetPasswordState extends AuthState {}

class ResetPasswordLoadingState extends ResetPasswordState {}

class ResetPasswordSuccessState extends ResetPasswordState {}
