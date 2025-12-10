import 'package:flutter/material.dart';
import 'package:fruits_app/core/widget/adaptive_layout/adaptive_layout.dart';
import 'package:fruits_app/features/onboarding/presentation/screen/onboarding_screen_desktop.dart';
import 'package:fruits_app/features/onboarding/presentation/screen/onboarding_screen_landscape.dart';
import 'package:fruits_app/features/onboarding/presentation/screen/onboarding_screen_mobile.dart';
import 'package:fruits_app/features/onboarding/presentation/screen/onboarding_screen_tablet.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});
  static final String routeName = '/onBoarding';

  @override
  Widget build(BuildContext context) {
    return AdaptiveLayout(
      mobileLayout: OrientationBuilder(
        builder: (context, orientation) {
          if (orientation == Orientation.landscape) {
            return const OnboardingScreenLandscape();
          }
          return const OnboardingScreenMobile();
        },
      ),
      tabletLayout: OrientationBuilder(
        builder: (context, orientation) {
          if (orientation == Orientation.landscape) {
            return const OnboardingScreenLandscape();
          }
          return const OnboardingScreenTablet();
        },
      ),
      desktopLayout: const OnboardingScreenDesktop(),
    );
  }
}
