import 'dart:io';

import 'package:banksha/bloc/auth/auth_bloc.dart';
import 'package:banksha/shared/theme.dart';
import 'package:banksha/ui/page/data_package_page.dart';
import 'package:banksha/ui/page/data_provider_page.dart';
import 'package:banksha/ui/page/data_success_page.dart';
import 'package:banksha/ui/page/home_page.dart';
import 'package:banksha/ui/page/onboarding_page.dart';
import 'package:banksha/ui/page/pin_page.dart';
import 'package:banksha/ui/page/profile_edit_page.dart';
import 'package:banksha/ui/page/profile_edit_pin_page.dart';
import 'package:banksha/ui/page/profile_edit_success_page.dart';
import 'package:banksha/ui/page/profile_page.dart';
import 'package:banksha/ui/page/sign_in_page.dart';
import 'package:banksha/ui/page/sign_up_page.dart';
import 'package:banksha/ui/page/sign_up_set_ktp_page.dart';
import 'package:banksha/ui/page/sign_up_set_profile_page.dart';
import 'package:banksha/ui/page/sign_up_success_page.dart';
import 'package:banksha/ui/page/splash_page.dart';
import 'package:banksha/ui/page/topup_amount_page.dart';
import 'package:banksha/ui/page/topup_page.dart';
import 'package:banksha/ui/page/topup_success_page.dart';
import 'package:banksha/ui/page/transfer_amount_page.dart';
import 'package:banksha/ui/page/transfer_page.dart';
import 'package:banksha/ui/page/transfer_success_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() {
  HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          scaffoldBackgroundColor: lightBackgroundColor,
          appBarTheme: AppBarTheme(
            backgroundColor: lightBackgroundColor,
            elevation: 0,
            centerTitle: true,
            iconTheme: IconThemeData(
              color: blackColor,
            ),
            titleTextStyle: blackTextStyle.copyWith(
              fontSize: 20,
              fontWeight: semiBold,
            ),
          ),
        ),
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => const SplashPage(),
          '/onboarding': (context) => const OnboardingPage(),
          '/sign-in': (context) => const SignInPage(),
          '/sign-up': (context) => const SignUpPage(),
          '/sign-up-set-profile': (context) => const SignUpSetProfilePage(),
          '/sign-up-set-ktp': (context) => const SignUpSetKTPPage(),
          '/sign-up-success': (context) => const SignUpSuccessPage(),
          '/home': (context) => const HomePage(),
          '/profile': (context) => const ProfilePage(),
          '/pin': (context) => const PinPage(),
          '/profile-edit': (context) => const ProfileEditPage(),
          '/profile-edit-pin': (context) => const ProfileEditPinPage(),
          '/profile-edit-success': (context) => const ProfileEditSuccessPage(),
          '/topup': (context) => const TopupPage(),
          '/topup-amount': (context) => const TopupAmountPage(),
          '/topup-success': (context) => const TopupSuccessPage(),
          '/transfer': (context) => const TransferPage(),
          '/transfer-amount': (context) => const TransferAmountPage(),
          '/transfer-success': (context) => const TransferSuccessPage(),
          '/data-provider': (context) => const DataProviderPage(),
          '/data-package': (context) => const DataPackagePage(),
          '/data-success': (context) => const DataSuccessPage(),
        },
      ),
    );
  }
}
