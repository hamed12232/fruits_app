import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fruits_app/core/widget/adaptive_layout/adaptive_layout.dart';
import 'package:fruits_app/features/onboarding/presentation/screen/onboarding_screen.dart';
import 'package:fruits_app/features/splash/presentation/screen/splash_screen_desktop.dart';
import 'package:fruits_app/features/splash/presentation/screen/splash_screen_mobile.dart';
import 'package:fruits_app/features/splash/presentation/screen/splash_screen_tablet.dart';

class SplashScreenAdaptive extends StatefulWidget {
  const SplashScreenAdaptive({super.key});
  static const String routeName = '/splash';
  @override
  State<SplashScreenAdaptive> createState() => _SplashScreenAdaptiveState();
}

class _SplashScreenAdaptiveState extends State<SplashScreenAdaptive> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer(const Duration(seconds: 4), () {
      Navigator.of(context).pushReplacementNamed(OnboardingScreen.routeName);
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AdaptiveLayout(
      mobileLayout: const SplashScreenMobile(),
      tabletLayout: const SplashScreenTablet(),
      desktopLayout: const SplashScreenDesktop(),
    );
  }
}
