import 'package:flutter/material.dart';
import 'package:fruits_app/features/auth/modules/welcome/presentation/screen/welcome_screen.dart';
import 'package:fruits_app/features/onboarding/presentation/screen/onboarding_screen.dart';
import 'package:fruits_app/features/splash/presentation/screen/spalsh_screen.dart';

class AppRouteManager {
  static Route? onGenerateRoute(RouteSettings settings) {
    Widget widget;
    switch (settings.name) {
      case AppRoutesName.splash:
        widget = const SpalshScreen();
        break;

      case AppRoutesName.onBoarding:
        widget = const OnboardingScreen();
        break;
      case AppRoutesName.welcome:
        widget = const WelcomeScreen();
        break;
      default:
        widget = const Placeholder();
        break;
    }
    return MaterialPageRoute(builder: (_) => widget, settings: settings);
  }
}

class AppRoutesName {
  static const String splash = '/splash';
  static const String onBoarding = '/onBoarding';
  static const String welcome = '/welcome';

  // static const String signUP = '/signUP';
  // static const String forgetPassword = '/forgetPassword';
  // static const String otb = "/otp";
  // static const String createNewPassword = '/CreateNewPassword';
  // static const String mainPage = '/main';
  static const String home = '/home';
  // static const String category = '/category';
  // static const String animal = '/animal';
  // static const String search = '/search';
}
