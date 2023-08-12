import 'dart:async';

import 'package:bookazon/resources/constants/app_assets.dart';
import 'package:bookazon/resources/extensions/extensions.dart';
import 'package:bookazon/resources/router/app_router.dart';
import 'package:bookazon/resources/style/app_colors.dart';
import 'package:bookazon/view/screens/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../../../data/data_source/local/app_prefs.dart';
import '../../../resources/service_locator/service_locator.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  late Timer _timer;

  void _startTimer() {
    _timer = Timer(const Duration(seconds: 2), _goNext);
  }

  void _goNext() {
    AppPrefs appPrefs = getIt<AppPrefs>();
    if (appPrefs.isOnBoardingViewed()) {
      if (appPrefs.isUserLoggedIn()) {
        Navigator.pushReplacementNamed(
          context,
          AppRoutes.homePage,
        );
      } else {
        Navigator.pushReplacementNamed(
          context,
          AppRoutes.login,
        );
      }
    } else {
      Navigator.pushReplacementNamed(
        context,
        AppRoutes.onBoarding,
      );
    }
  }

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Center(
        child: Column(
          children: [
            303.ph,
            Image.asset(
              Assets.imageLogo,
              width: 297.w,
              height: 88.h,
            ),
            360.ph,
            Lottie.asset(
              Assets.jsonLoading,
              width: 120.w,
              height: 120.w,
            ),
          ],
        ),
      ),
    );
  }
}
