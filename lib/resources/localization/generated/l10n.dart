// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `test`
  String get test {
    return Intl.message(
      'test',
      name: 'test',
      desc: '',
      args: [],
    );
  }

  /// `Login to your account`
  String get title_login {
    return Intl.message(
      'Login to your account',
      name: 'title_login',
      desc: '',
      args: [],
    );
  }

  /// `Create a new account`
  String get title_signup {
    return Intl.message(
      'Create a new account',
      name: 'title_signup',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Remember me`
  String get remember_me {
    return Intl.message(
      'Remember me',
      name: 'remember_me',
      desc: '',
      args: [],
    );
  }

  /// `I have read and accepted the terms of use\nand privacy policy `
  String get privacy_policy {
    return Intl.message(
      'I have read and accepted the terms of use\nand privacy policy ',
      name: 'privacy_policy',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `enter your email`
  String get hint_email {
    return Intl.message(
      'enter your email',
      name: 'hint_email',
      desc: '',
      args: [],
    );
  }

  /// `enter your password`
  String get hint_password {
    return Intl.message(
      'enter your password',
      name: 'hint_password',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Forget Password?`
  String get forget_password {
    return Intl.message(
      'Forget Password?',
      name: 'forget_password',
      desc: '',
      args: [],
    );
  }

  /// `or sign in with`
  String get or {
    return Intl.message(
      'or sign in with',
      name: 'or',
      desc: '',
      args: [],
    );
  }

  /// `Don’t have an account yet?`
  String get dont_have_account {
    return Intl.message(
      'Don’t have an account yet?',
      name: 'dont_have_account',
      desc: '',
      args: [],
    );
  }

  /// `Signup`
  String get signup {
    return Intl.message(
      'Signup',
      name: 'signup',
      desc: '',
      args: [],
    );
  }

  /// `UserName`
  String get username {
    return Intl.message(
      'UserName',
      name: 'username',
      desc: '',
      args: [],
    );
  }

  /// `enter your name`
  String get hint_username {
    return Intl.message(
      'enter your name',
      name: 'hint_username',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password`
  String get confirm_password {
    return Intl.message(
      'Confirm Password',
      name: 'confirm_password',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account?`
  String get already_have_account {
    return Intl.message(
      'Already have an account?',
      name: 'already_have_account',
      desc: '',
      args: [],
    );
  }

  /// `Don't worry it happens,please enter \n your email address`
  String get describe_forget_password {
    return Intl.message(
      'Don\'t worry it happens,please enter \n your email address',
      name: 'describe_forget_password',
      desc: '',
      args: [],
    );
  }

  /// `Send`
  String get send {
    return Intl.message(
      'Send',
      name: 'send',
      desc: '',
      args: [],
    );
  }

  /// `Email Verification`
  String get email_verification {
    return Intl.message(
      'Email Verification',
      name: 'email_verification',
      desc: '',
      args: [],
    );
  }

  /// `Please type OTP code that we given you`
  String get describe_email_verification {
    return Intl.message(
      'Please type OTP code that we given you',
      name: 'describe_email_verification',
      desc: '',
      args: [],
    );
  }

  /// `Verify`
  String get verify {
    return Intl.message(
      'Verify',
      name: 'verify',
      desc: '',
      args: [],
    );
  }

  /// `Reset Password`
  String get reset_password {
    return Intl.message(
      'Reset Password',
      name: 'reset_password',
      desc: '',
      args: [],
    );
  }

  /// `Enter your new password and confirm it`
  String get describe_reset_password {
    return Intl.message(
      'Enter your new password and confirm it',
      name: 'describe_reset_password',
      desc: '',
      args: [],
    );
  }

  /// `New Password`
  String get new_password {
    return Intl.message(
      'New Password',
      name: 'new_password',
      desc: '',
      args: [],
    );
  }

  /// `enter new password`
  String get hint_new_password {
    return Intl.message(
      'enter new password',
      name: 'hint_new_password',
      desc: '',
      args: [],
    );
  }

  /// `Submit`
  String get submit {
    return Intl.message(
      'Submit',
      name: 'submit',
      desc: '',
      args: [],
    );
  }

  /// `Welcome to Bookazon!`
  String get onboardingTitle1 {
    return Intl.message(
      'Welcome to Bookazon!',
      name: 'onboardingTitle1',
      desc: '',
      args: [],
    );
  }

  /// `Discover and Book Your Perfect Getaway`
  String get onboardingSubtitle1 {
    return Intl.message(
      'Discover and Book Your Perfect Getaway',
      name: 'onboardingSubtitle1',
      desc: '',
      args: [],
    );
  }

  /// `Create Your Account`
  String get onboardingTitle2 {
    return Intl.message(
      'Create Your Account',
      name: 'onboardingTitle2',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up to Access Exclusive Deals and Manage Bookings`
  String get onboardingSubtitle2 {
    return Intl.message(
      'Sign Up to Access Exclusive Deals and Manage Bookings',
      name: 'onboardingSubtitle2',
      desc: '',
      args: [],
    );
  }

  /// `Explore Amazing Properties`
  String get onboardingTitle3 {
    return Intl.message(
      'Explore Amazing Properties',
      name: 'onboardingTitle3',
      desc: '',
      args: [],
    );
  }

  /// `Find Your Ideal Accommodation and Start Your Adventure`
  String get onboardingSubtitle3 {
    return Intl.message(
      'Find Your Ideal Accommodation and Start Your Adventure',
      name: 'onboardingSubtitle3',
      desc: '',
      args: [],
    );
  }

  /// `Skip`
  String get skip {
    return Intl.message(
      'Skip',
      name: 'skip',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get next {
    return Intl.message(
      'Next',
      name: 'next',
      desc: '',
      args: [],
    );
  }

  /// `Get Started`
  String get getStarted {
    return Intl.message(
      'Get Started',
      name: 'getStarted',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
