import 'package:bookazon/resources/localization/generated/l10n.dart';
import 'package:bookazon/resources/router/app_router.dart';
import 'package:bookazon/view/screens/forget%20password/forgetpassword_page.dart';
import 'package:bookazon/view/screens/reset%20password/reset_password_page.dart';
import 'package:bookazon/view/screens/splash/splash_page.dart';
import 'package:bookazon/view_model/onboarding/onboarding_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'view/screens/email verification/email_verification_page.dart';
import 'view/screens/signup/signup_page.dart';

void main() {
  // fro testing splash
  // WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

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
          ],
          child: MaterialApp(
            locale: const Locale("en"),
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
            title: 'Bookazon',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            onGenerateRoute: RouteGenerate.getRoute,
            home:  SignupPage(),
          ),
        );
      },
    );
  }
}
