import 'package:bookazon/view/screens/email_verification/email_verification_page.dart';
import 'package:bookazon/view/screens/forget%20password/forgetpassword_page.dart';
import 'package:bookazon/view/screens/onboarding/onboarding_page.dart';
import 'package:bookazon/view/screens/privacy_policy/privacy_policy_page.dart';
import 'package:bookazon/view/screens/signup/signup_page.dart';
import 'package:bookazon/view/screens/splash/splash_page.dart';
import 'package:flutter/material.dart';

import '../../view/screens/home/home_page.dart';
import '../../view/screens/hotel_details/hotel_details_page.dart';
import '../../view/screens/layouts/layouts_page.dart';
import '../../view/screens/login/login_page.dart';
import '../../view/screens/reset_password/reset_password_page.dart';

class AppRoutes {
  AppRoutes._private();

  /// Intro
  static const String splash = "splash";
  static const String onBoarding = "onBoarding";

  /// Auth
  static const String login = "login";
  static const String signUp = "signUp";
  static const String forgotPassword = "forgot password";
  static const String emailVerify = "email verify";
  static const String resetPassword = "reset password";
  static const String confirmPassword = "confirm password";
  static const String privacyPolicy = "privacy password";

  /// main pages
  static const String layouts = "layouts";
  static const String homePage = "home page";
  static const String hotelDetails = "hotel details";
  static const String editProfile = "edit profile";
}

class RouteGenerate {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      ///Intro
      case AppRoutes.splash:
        return MaterialPageRoute(
          builder: (_) => const SplashPage(),
        );
      case AppRoutes.onBoarding:
        return MaterialPageRoute(
          builder: (_) => const OnboardingPage(),
        );

      /// Auth
      case AppRoutes.login:
        return MaterialPageRoute(
          builder: (_) => const LoginPage(),
        );
      case AppRoutes.signUp:
        return MaterialPageRoute(
          builder: (_) => const SignupPage(),
        );
      case AppRoutes.forgotPassword:
        return MaterialPageRoute(
          builder: (_) => const ForgetPasswordPage(),
        );
      case AppRoutes.emailVerify:
        return MaterialPageRoute(
          builder: (_) => EmailVerificationPage(
            email: routeSettings.arguments as String,
          ),
        );
      case AppRoutes.resetPassword:
        return MaterialPageRoute(
          builder: (_) => ResetPasswordPage(
            email: routeSettings.arguments as String,
          ),
        );
      case AppRoutes.privacyPolicy:
        return MaterialPageRoute(
          builder: (_) => const PrivacyPolicyPage(),
        );

      /// Main
      case AppRoutes.layouts:
        return MaterialPageRoute(
          builder: (_) => const LayoutsPage(),
        );
      case AppRoutes.homePage:
        return MaterialPageRoute(
          builder: (_) => const HomePage(),
        );
      case AppRoutes.hotelDetails:
        return MaterialPageRoute(
          builder: (_) => const HotelDetailsPage(),
        );
      case AppRoutes.editProfile:
        return MaterialPageRoute(
          builder: (_) => const EditProfilePage(),
        );
      default:
        return MaterialPageRoute(
            builder: (_) => _undfinedPage(route: routeSettings.name));
    }
  }

  static Scaffold _undfinedPage({String? route}) {
    return Scaffold(
      appBar: AppBar(title: const Text("Undfined Page")),
      body: Center(child: Text("${route ?? "Undifined"} Page")),
    );
  }
}
