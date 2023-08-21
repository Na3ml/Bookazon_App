import 'package:shared_preferences/shared_preferences.dart';

class PrefsKeys {
  PrefsKeys._();

  static const String onboarding = "Onboarding";
  static const String login = "Login";
  static const String userInfo = "userInfo";
}

class AppPrefs {
  final SharedPreferences _sharedPrefs;
  AppPrefs(this._sharedPrefs);

  /// OnBoarding
  Future<void> setOnBoardingViewed() async {
    await _sharedPrefs.setBool(PrefsKeys.onboarding, true);
  }

  bool isOnBoardingViewed() {
    return _sharedPrefs.getBool(PrefsKeys.onboarding) ?? false;
  }

  /// Auth
  Future<void> setUserLoggedIn() async {
    await _sharedPrefs.setBool(PrefsKeys.login, true);
  }

  bool isUserLoggedIn() {
    return _sharedPrefs.getBool(PrefsKeys.login) ?? false;
  }

  Future<void> logout() async {
    await _sharedPrefs.remove(PrefsKeys.login);
  }

  /// user info
  Future<void> setUserInfo({
    required String firstName,
    required String lastName,
    required String email,
    required String phone,
    String? gender,
    String? address,
    String? paymentCvv,
  }) async {
    await _sharedPrefs.setStringList(
      PrefsKeys.userInfo,
      [
        firstName,
        lastName,
        email,
        phone,
        gender ?? "--",
        address ?? "--",
        paymentCvv ?? "--",
      ],
    );
  }

  List<String> getUserInfo() {
    return _sharedPrefs.getStringList(PrefsKeys.userInfo) ??
        [
          "First Name",
          "Last Name",
          "Email Address",
          "Phone Number",
          "Gender",
          "Address",
          "Payment CVV",
        ];
  }
}