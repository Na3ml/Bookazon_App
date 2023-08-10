import 'package:bookazon/data/repository/auth_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter/material.dart';

import '../../data/error_handler/error_handler.dart';
import '../../data/models/auth_requests_model.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository _repo;
  AuthCubit({
    required AuthRepository repo,
  })  : _repo = repo,
        super(AuthInitial());

  static AuthCubit get(BuildContext context) => BlocProvider.of(context);

  /// Sinpper
  bool _spinner = false;
  bool get spinner {
    return _spinner;
  }

  void changeSnipper() {
    _spinner = !_spinner;
  }

  /// Auth
  Future<void> login(LoginRequest request) async {
    emit(LoginLoadingState());
    try {
      if (await _repo.login(request)) {
        emit(LoginSuccessState());
      }
    } catch (e) {
      if (e is CustomException) {
        emit(AuthnErrorState(e.message));
      }
    }
  }

  Future<void> register(RegisterRequest request) async {
    emit(RegisterLoadingState());
    try {
      if (await _repo.register(request)) {
        emit(RegisterSuccessState());
      }
    } catch (e) {
      if (e is CustomException) {
        emit(AuthnErrorState(e.message));
      }
    }
  }

  Future<void> forgotPassword(String email) async {
    emit(ForgotPasswordLoadingState());
    try {
      if (await _repo.forgotPassword(email)) {
        emit(ForgotPasswordSuccessState());
      }
    } catch (e) {
      if (e is CustomException) {
        emit(AuthnErrorState(e.message));
      }
    }
  }

  String otp = '';
  Future<void> verifyEmail(VerifyEmailRequest request) async {
    if (request.otp.length == 4) {
      emit(VerifyEmailLoadingState());
      try {
        if (await _repo.verifyEmail(request)) {
          emit(VerifyEmailSuccessState());
        }
      } catch (e) {
        if (e is CustomException) {
          emit(AuthnErrorState("Wrong Code, Send Again"));
        }
      }
    } else {
      emit(AuthnErrorState("Enter 4-digits Code"));
    }
  }

  Future<void> resetPassword(ResetPasswordRequest request) async {
    emit(VerifyEmailLoadingState());
    try {
      if (await _repo.resetPassword(request)) {
        emit(VerifyEmailSuccessState());
      }
    } catch (e) {
      if (e is CustomException) {
        emit(AuthnErrorState(e.message));
      }
    }
  }
}
