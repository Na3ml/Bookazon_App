import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'app_colors.dart';

class AppTheme {
  static ThemeData getLight() {
    return ThemeData(
      scaffoldBackgroundColor: AppColors.white,

      /// color theme
      colorScheme: ColorScheme.fromSwatch().copyWith(
        secondary: AppColors.purple.withOpacity(0.2),
      ),

      /// AppBar theme
      appBarTheme: const AppBarTheme(
        elevation: 0,
        centerTitle: true,
        backgroundColor: AppColors.white,
        foregroundColor: AppColors.black,
        iconTheme: IconThemeData(color: Colors.black),
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.dark,
          statusBarColor: Colors.white,
        ),
      ),
    );
  }
}
