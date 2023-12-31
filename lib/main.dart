import 'package:bookazon/data/repository/auth_repository.dart';
import 'package:bookazon/resources/localization/generated/l10n.dart';
import 'package:bookazon/resources/router/app_router.dart';
import 'package:bookazon/view/screens/delete_account/delete_account_page.dart';
import 'package:bookazon/view/screens/delete_account/confirm_delete_account_page.dart';
import 'package:bookazon/resources/style/app_theme.dart';
import 'package:bookazon/view/screens/email_verification/email_verification_page.dart';
import 'package:bookazon/view/screens/favourite/favourite_page.dart';
import 'package:bookazon/view/screens/reset_password/reset_password_page.dart';
import 'package:bookazon/view/screens/search/search_page.dart';
import 'package:bookazon/view/screens/splash/splash_page.dart';
import 'package:bookazon/view_model/auth/auth_cubit.dart';
import 'package:bookazon/view_model/booking/booking_cubit.dart';
import 'package:bookazon/view_model/delete_account/delete_account_cubit.dart';
import 'package:bookazon/view_model/filter/filter_cubit.dart';
import 'package:bookazon/view_model/home/home_cubit.dart';
import 'package:bookazon/view_model/onboarding/onboarding_cubit.dart';
import 'package:bookazon/view_model/profile/profile_cubit.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'data/data_source/local/app_prefs.dart';
import 'firebase_options.dart';
import 'resources/service_locator/service_locator.dart';
import 'view/screens/home/home_page.dart';
import 'view/screens/layouts/layouts_page.dart';
import 'view_model/hotel_details/hotel_details_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // fro testing splash
  // WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await initModule();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => OnboardingCubit(),
            ),
            BlocProvider(
              create: (context) => AuthCubit(repo: getIt()),
            ),
            BlocProvider(
              create: (context) => DeleteAccountCubit(),
            ),
            BlocProvider(
              create: (context) => HomeCubit(getIt()),
            ),
            BlocProvider(
              create: (context) => ProfileCubit(),
            ),
            BlocProvider(
              create: (context) => BookingCubit(),
            ),
            BlocProvider(
              create: (context) => FilterCubit(),
            ),
            BlocProvider(
              create: (context) => HotelDetailsCubit(),
            ),
          ],
          child: MaterialApp(
              debugShowCheckedModeBanner: false,
              locale: const Locale("en"),
              localizationsDelegates: const [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: S.delegate.supportedLocales,
              scrollBehavior: ScrollConfiguration.of(context).copyWith(
                physics: const BouncingScrollPhysics(),
              ),
              title: 'Bookazon',
              theme: AppTheme.getLight(),
              onGenerateRoute: RouteGenerate.getRoute,
              home: const SplashPage()
              // home: const LayoutsPage(),
              ),
        );
      },
    );
  }
}
