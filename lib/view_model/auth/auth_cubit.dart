import 'dart:developer';

import 'package:bookazon/data/data_source/local/app_prefs.dart';
import 'package:bookazon/data/repository/auth_repository.dart';
import 'package:bookazon/resources/localization/generated/l10n.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter/material.dart';

import '../../data/error_handler/error_handler.dart';
import '../../data/models/requests/auth_requests_model.dart';
import '../../resources/service_locator/service_locator.dart';

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

  /// checkboxes
  bool rememberMe = false;
  bool acceptTerms = false;

  void changeRememberMe() {
    rememberMe = !rememberMe;
    emit(ChangeRememberMeState(rememberMe));
  }

  void changeAcceptTerms() {
    acceptTerms = !acceptTerms;
    emit(ChangeAcceptTermsState(acceptTerms));
  }

  /// Auth
  final appPrefs = getIt<AppPrefs>();
  Future<void> login(LoginRequest request) async {
    emit(LoginLoadingState());
    try {
      final response = await _repo.login(request);
      log("here");
      if (response.status == 1) {
        appPrefs.setToken(response.data!.token);
        final user = response.data!.user;
        appPrefs.setUserInfo(
          firstName: user.firstName,
          lastName: user.lastName,
          email: user.email,
          phone: user.phoneNumber,
        );
        if (rememberMe) {
          appPrefs.setUserLoggedIn();
        }
        emit(LoginSuccessState());
      } else {
        emit(AuthnErrorState("Email or Passowrd is worng"));
      }
    } catch (e) {
      if (e is CustomException) {
        emit(AuthnErrorState("cubit Error ${e.message}"));
      }
    }
  }

  Future<void> register(RegisterRequest request) async {
    if (acceptTerms) {
      emit(RegisterLoadingState());
      try {
        final response = await _repo.register(request);
        if (response.status == 1) {
          appPrefs.setUserLoggedIn();
          appPrefs.setToken(response.data!.token);
          final user = response.data!.user;
          appPrefs.setUserInfo(
            firstName: user.firstName,
            lastName: user.lastName,
            email: user.email,
            phone: user.phoneNumber,
          );
          emit(RegisterSuccessState());
        } else {
          emit(AuthnErrorState(response.message));
        }
      } catch (e) {
        if (e is CustomException) {
          emit(AuthnErrorState(e.message));
        }
      }
    } else {
      emit(AuthnErrorState(S.current.acceptTermsErrorMessage));
    }
  }

  Future<void> forgotPassword(String email) async {
    emit(ForgotPasswordLoadingState());
    try {
      final response = await _repo.forgotPassword(email);
      if (response.status == 1) {
        emit(ForgotPasswordSuccessState());
      }
    } catch (e) {
      if (e is CustomException) {
        emit(AuthnErrorState(e.message));
      }
    }
  }

  String otp = '';
  Future<void> verifyEmail() async {
    if (otp.length == 6) {
      emit(VerifyEmailLoadingState());
      try {
        final response = await _repo.verifyEmail(otp);
        if (response.status == 1) {
          emit(VerifyEmailSuccessState());
        }
      } catch (e) {
        if (e is CustomException) {
          emit(AuthnErrorState("Wrong Code, Send Again"));
        }
      }
    } else {
      emit(AuthnErrorState("Enter 6-digits Code"));
    }
  }

  Future<void> resetPassword(ResetPasswordRequest request) async {
    emit(ResetPasswordLoadingState());
    try {
      final respones = await _repo.resetPassword(request);
      if (respones.status == 1) {
        emit(ResetPasswordSuccessState());
      }
    } catch (e) {
      if (e is CustomException) {
        emit(AuthnErrorState(e.message));
      }
    }
  }

  Future<void> logout() async {
    await _repo.logout(appPrefs.getToken()!);
    appPrefs.logout();
    appPrefs.removeToken();
  }
}
