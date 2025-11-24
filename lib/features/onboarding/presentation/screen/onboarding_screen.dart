import 'package:flutter/material.dart';
import 'package:fruits_app/core/widget/adaptive_layout/adaptive_layout.dart';
import 'package:fruits_app/features/onboarding/presentation/screen/onboarding_screen_desktop.dart';
import 'package:fruits_app/features/onboarding/presentation/screen/onboarding_screen_mobile.dart';
import 'package:fruits_app/features/onboarding/presentation/screen/onboarding_screen_tablet.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});
  static final String routeName = '/onBoarding';

  @override
  Widget build(BuildContext context) {
    return const AdaptiveLayout(
      mobileLayout: OnboardingScreenMobile(),
      tabletLayout: OnboardingScreenTablet(),
      desktopLayout: OnboardingScreenDesktop(),
    );
  }
}
