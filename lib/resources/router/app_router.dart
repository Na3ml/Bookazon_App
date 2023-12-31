import 'package:bookazon/view/screens/cancel_booking/cancel_booking_page.dart';
import 'package:bookazon/view/screens/change_password/change_password_page.dart';
import 'package:bookazon/view/screens/delete_account/confirm_delete_account_page.dart';
import 'package:bookazon/view/screens/email_verification/email_verification_page.dart';
import 'package:bookazon/view/screens/filter/filter_page.dart';
import 'package:bookazon/view/screens/forget%20password/forgetpassword_page.dart';
import 'package:bookazon/view/screens/onboarding/onboarding_page.dart';
import 'package:bookazon/view/screens/privacy_policy/privacy_policy_page.dart';
import 'package:bookazon/view/screens/reviews/reviews_page.dart';
import 'package:bookazon/view/screens/room_info/room_info_page.dart';
import 'package:bookazon/view/screens/security_settings/security_settings_page.dart';
import 'package:bookazon/view/screens/signup/signup_page.dart';
import 'package:bookazon/view/screens/sort/sort_page.dart';
import 'package:bookazon/view/screens/splash/splash_page.dart';
import 'package:bookazon/view/screens/ticket/ticket_page.dart';
import 'package:flutter/material.dart';

import '../../view/screens/delete_account/delete_account_page.dart';
import '../../view/screens/edit_profile/edit_profile.dart';
import '../../view/screens/home/home_page.dart';
import '../../view/screens/hotel_details/hotel_details_page.dart';
import '../../view/screens/hotel_photos/hotel_photos_page.dart';
import '../../view/screens/layouts/layouts_page.dart';
import '../../view/screens/login/login_page.dart';
import '../../view/screens/reset_password/reset_password_page.dart';
import '../../view/screens/search/search_page.dart';
import '../../view/screens/welcome/welcome_screen.dart';

class AppRoutes {
  AppRoutes._private();

  /// Intro
  static const String splash = "splash";
  static const String onBoarding = "onBoarding";

  /// Auth
  static const String welcome = "welcome";
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
  static const String search = "search";
  static const String hotelDetails = "hotel details";
  static const String editProfile = "edit profile";
  static const String deleteAccount = "delete account";
  static const String confirmDeleteAccount = "confirm delete account";
  static const String securitySettings = "security settings";
  static const String changePassword = "change password";
  static const String cancelBooking = "cancel booking";
  static const String ticket = "ticket";
  static const String sort = "sort";
  static const String filter = "filter";
  static const String offer = "offer";
  static const String hotelPhotos = "Hotel Photos";
  static const String reviews = "reviews";
  static const String roomInfo = "romm info";
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
      case AppRoutes.welcome:
        return MaterialPageRoute(
          builder: (_) => const WelcomePage(),
        );
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
            email: (routeSettings.arguments as List<String>)[0],
            otp: (routeSettings.arguments as List<String>)[1],
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
      case AppRoutes.search:
        return MaterialPageRoute(
          builder: (_) => const SearchPage(),
        );
      case AppRoutes.hotelDetails:
        return MaterialPageRoute(
          builder: (_) => const HotelDetailsPage(),
        );
      case AppRoutes.editProfile:
        return MaterialPageRoute(
          builder: (_) => const EditProfilePage(),
        );
      case AppRoutes.deleteAccount:
        return MaterialPageRoute(
          builder: (_) => const DeleteAccountPage(),
        );
      case AppRoutes.confirmDeleteAccount:
        return MaterialPageRoute(
          builder: (_) => const ConfirmDeleteAccount(),
        );
      case AppRoutes.securitySettings:
        return MaterialPageRoute(
          builder: (_) => const SecuritySettingsPage(),
        );
      case AppRoutes.changePassword:
        return MaterialPageRoute(
          builder: (_) => const ChangePasswordPage(),
        );
      case AppRoutes.cancelBooking:
        return MaterialPageRoute(
          builder: (_) => const CancelBookingPage(),
        );
      case AppRoutes.ticket:
        return MaterialPageRoute(
          builder: (_) => const TicketPage(),
        );
      case AppRoutes.sort:
        return MaterialPageRoute(
          builder: (_) => const SortPage(),
        );
      case AppRoutes.filter:
        return MaterialPageRoute(
          builder: (_) => const FilterPage(),
        );
      case AppRoutes.offer:
        return MaterialPageRoute(
          builder: (_) => const FilterPage(),
        );
      case AppRoutes.hotelPhotos:
        return MaterialPageRoute(
          builder: (_) => const HotelPhotosPage(),
        );
      case AppRoutes.reviews:
        return MaterialPageRoute(
          builder: (_) => const ReviewsPage(),
        );
      case AppRoutes.roomInfo:
        return MaterialPageRoute(
          builder: (_) => const RoomInfoPage(),
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
