import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_app/core/utils/constant/app_height.dart';
import 'package:fruits_app/core/utils/constant/app_images_strings.dart';
import 'package:fruits_app/features/onboarding/presentation/screen/onboarding_screen.dart';

class SpalshScreen extends StatefulWidget {
  const SpalshScreen({super.key});
  static final String routeName = '/splash';

  @override
  State<SpalshScreen> createState() => _SpalshScreenState();
}

class _SpalshScreenState extends State<SpalshScreen> {
  Timer? _timer;
  @override
  void initState() {
    super.initState();
    _timer = Timer(const Duration(seconds: 10), () {
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
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: SvgPicture.asset(AppImagesStrings.backgroundSplashImage),
          ),
          Positioned(
            top: AppHeight.h221,
            child: Center(
              child: Image.asset(AppImagesStrings.fruitMarketImage),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Image.asset(AppImagesStrings.fruitsImage, fit: BoxFit.fill),
          ),
        ],
      ),
    );
  }
}
