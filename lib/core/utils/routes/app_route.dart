import 'package:flutter/material.dart';
import 'package:fruits_app/features/auth/modules/otp_verification/presentation/screen/otp_verification_screen.dart';
import 'package:fruits_app/features/auth/modules/sign_in/presentation/screen/sign_in_screen.dart';
import 'package:fruits_app/features/auth/modules/sign_up/presentation/screen/sign_up_screen.dart';
import 'package:fruits_app/features/auth/modules/verify_number/presentation/screen/verify_number_screen.dart';
import 'package:fruits_app/features/auth/modules/welcome/presentation/screen/welcome_screen.dart';
import 'package:fruits_app/features/basket/presentation/screen/basket_screen.dart';
import 'package:fruits_app/features/home/presentation/screens/home_screen.dart';
import 'package:fruits_app/features/home/presentation/screens/main_navigation_screen.dart';
import 'package:fruits_app/features/onboarding/presentation/screen/onboarding_screen.dart';
import 'package:fruits_app/features/product/presentation/screen/product_screen.dart';
import 'package:fruits_app/features/seller/presentation/screen/seller_screen.dart';
import 'package:fruits_app/features/splash/presentation/screen/spalsh_screen.dart';

class AppRouteManager {
  static Route? onGenerateRoute(RouteSettings settings) {
    Widget widget;
    switch (settings.name) {
      case AppRoutesName.splash:
        widget = const SpalshScreen();
      case AppRoutesName.onBoarding:
        widget = const OnboardingScreen();
      case AppRoutesName.welcome:
        widget = const WelcomeScreen();
      case AppRoutesName.signUP:
        widget = const SignUpScreen();
      case AppRoutesName.signIN:
        widget = const SignInScreen();
      case AppRoutesName.verifyNumber:
        widget = const VerifyNumberScreen();
      case AppRoutesName.otpVerification:
        widget = const OtpVerificationScreen();
      case AppRoutesName.navigationScreen:
        widget = const MainNavigationScreen();
      case AppRoutesName.home:
        widget = const HomeScreen();
      case AppRoutesName.seller:
        widget = const SellerScreen();
      case AppRoutesName.product:
        widget = const ProductScreen();
      case AppRoutesName.basket:
        widget = const BasketScreen();
      default:
        widget = const Placeholder();
    }
    return MaterialPageRoute(builder: (_) => widget, settings: settings);
  }
}

class AppRoutesName {
  static const String splash = '/';
  static const String onBoarding = '/onBoarding';
  static const String welcome = '/welcome';
  static const String signUP = '/sign-up';
  static const String signIN = '/sign-in';
  static const String verifyNumber = '/verify-number';
  static const String otpVerification = '/otp-verification';
  static const String seller = '/seller';
  static const String product = '/product';
  static const String basket = '/basket';
  // static const String forgetPassword = '/forgetPassword';
  // static const String otb = "/otp";
  // static const String createNewPassword = '/CreateNewPassword';
  // static const String mainPage = '/main';
  static const String navigationScreen = '/main-navigation';
  static const String home = '/home';
  // static const String category = '/category';
  // static const String animal = '/animal';
  // static const String search = '/search';
}
