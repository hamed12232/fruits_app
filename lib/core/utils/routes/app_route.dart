import 'package:flutter/material.dart';
import 'package:fruits_app/core/widget/failure/failure.dart';
import 'package:fruits_app/core/widget/success/success_operation.dart';
import 'package:fruits_app/features/auth/modules/otp_verification/presentation/screen/otp_verification_screen_adaptive.dart';
import 'package:fruits_app/features/auth/modules/sign_in/presentation/screen/sign_in_screen_adaptive.dart';
import 'package:fruits_app/features/auth/modules/sign_up/presentation/screen/sign_up_screen_adaptive.dart';
import 'package:fruits_app/features/auth/modules/verify_number/presentation/screen/verify_number_screen_adaptive.dart';
import 'package:fruits_app/features/auth/modules/welcome/presentation/screen/welcome_screen_adaptive.dart';
import 'package:fruits_app/features/basket/presentation/screen/basket_screen.dart';
import 'package:fruits_app/features/checkout/presentation/screen/checkout_main_screen.dart';
import 'package:fruits_app/features/checkout/presentation/screen/checkout_screen.dart';
import 'package:fruits_app/features/checkout/presentation/widget/successfully_view.dart';
import 'package:fruits_app/features/favourite/presentation/screen/favorite_screen.dart';
import 'package:fruits_app/features/home/presentation/screens/home_screen.dart';
import 'package:fruits_app/features/home/presentation/screens/main_navigation_screen.dart';
import 'package:fruits_app/features/onboarding/presentation/screen/onboarding_screen.dart';
import 'package:fruits_app/features/orders/presentation/screen/order_tracking_screen.dart';
import 'package:fruits_app/features/orders/presentation/screen/orders_screen.dart';
import 'package:fruits_app/features/product/presentation/screen/product_screen.dart';
import 'package:fruits_app/features/profile/presentation/screens/contact_us_screen.dart';
import 'package:fruits_app/features/profile/presentation/screens/edit_profile_screen.dart';
import 'package:fruits_app/features/profile/presentation/screens/notification_test_screen.dart';
import 'package:fruits_app/features/profile/presentation/screens/profile_screen.dart';
import 'package:fruits_app/features/profile/presentation/screens/terms_and_conditions_screen.dart';
import 'package:fruits_app/features/seller/presentation/screen/seller_screen.dart';
import 'package:fruits_app/features/splash/presentation/screen/splash_screen_adaptive.dart';

class AppRouteManager {
  static Route? onGenerateRoute(RouteSettings settings) {
    Widget widget;
    switch (settings.name) {
      case AppRoutesName.splash:
        widget = const SplashScreenAdaptive();
        break;
      case AppRoutesName.onBoarding:
        widget = const OnboardingScreen();
        break;
      case AppRoutesName.welcome:
        widget = const WelcomeScreenAdaptive();
        break;
      case AppRoutesName.signUP:
        widget = const SignUpScreenAdaptive();
        break;
      case AppRoutesName.signIN:
        widget = const SignInScreenAdaptive();
        break;
      case AppRoutesName.verifyNumber:
        widget = const VerifyNumberScreenAdaptive();
        break;
      case AppRoutesName.otpVerification:
        widget = const OtpVerificationScreenAdaptive();
        break;
      case AppRoutesName.navigationScreen:
        final initialIndex = settings.arguments as int? ?? 0;
        widget = MainNavigationScreen(initialIndex: initialIndex);
        break;
      case AppRoutesName.home:
        widget = const HomeScreen();
        break;
      case AppRoutesName.seller:
        widget = const SellerScreen();
        break;
      case AppRoutesName.product:
        widget = const ProductScreen();
        break;
    
      case AppRoutesName.basket:
        widget = const BasketScreen();
        break;
      case AppRoutesName.checkout:
        widget = const CheckoutScreen();
        break;
      case AppRoutesName.checkoutMain:
        widget = const CheckoutMainScreen();
        break;
      case AppRoutesName.success:
        widget = const SuccessOperation();
        break;
      case AppRoutesName.successview:
        widget = const SuccessfullyView();
        break;
      case AppRoutesName.failure:
        widget = const FailureOperation();
        break;
      case AppRoutesName.orders:
        widget = const OrdersScreen();
        break;
      case AppRoutesName.orderTracking:
        widget = const OrderTrackingScreen();
        break;
      case AppRoutesName.profile:
        widget = const ProfileScreen();
        break;
      case AppRoutesName.editProfile:
        widget = const EditProfileScreen();
        break;
      case AppRoutesName.contactUs:
        widget = const ContactUsScreen();
        break;
      case AppRoutesName.termsAndConditions:
        widget = const TermsAndConditionsScreen();
        break;
      case AppRoutesName.favorite:
        widget = const FavoriteScreen();
        break;
      case AppRoutesName.notificationTest:
        widget = const NotificationTestScreen();
        break;
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
  static const String products = '/products';
  static const String basket = '/basket';
  static const String checkout = '/checkout';
  static const String checkoutMain = '/checkout_main';
  static const String success = '/success_operation';
  static const String successview = '/success_view';
  static const String failure = '/failure_operation';
  static const String orders = '/orders-screen';
  static const String orderTracking = '/order-tracking';
  static const String navigationScreen = '/main-navigation';
  static const String home = '/home';
  static const String profile = '/profile';
  static const String editProfile = '/edit-profile';
  static const String contactUs = '/contact-us';
  static const String termsAndConditions = '/terms-and-conditions';
  static const String favorite = '/favorite';
  static const String notificationTest = '/notification-test';
  static const String navigationTest = '/navigation-test';
}
