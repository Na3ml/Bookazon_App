import 'package:bookazon/data/data_source/local/app_prefs.dart';
import 'package:bookazon/data/repository/auth_repository.dart';
import 'package:bookazon/resources/localization/generated/l10n.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter/material.dart';

import '../../data/error_handler/error_handler.dart';
import '../../data/models/auth_requests_model.dart';
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
      if (await _repo.login(request)) {
        if (rememberMe) {
          appPrefs.setUserLoggedIn();
        }
        emit(LoginSuccessState());
      }
    } catch (e) {
      if (e is CustomException) {
        emit(AuthnErrorState(e.message));
      }
    }
  }

  Future<void> register(RegisterRequest request) async {
    if (acceptTerms) {
      emit(RegisterLoadingState());
      try {
        if (await _repo.register(request)) {
          appPrefs.setUserLoggedIn();
          emit(RegisterSuccessState());
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
