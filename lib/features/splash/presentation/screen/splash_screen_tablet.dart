import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_app/core/utils/constant/app_height.dart';
import 'package:fruits_app/core/utils/constant/app_images_strings.dart';

class SplashScreenTablet extends StatelessWidget {
  const SplashScreenTablet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: SvgPicture.asset(
              AppImagesStrings.backgroundSplashImage,
              fit: BoxFit.cover,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: AppHeight.h221), // Can be adjusted for tablet
              Center(
                child: Image.asset(
                  AppImagesStrings.fruitMarketImage,
                  scale: 0.8, // Slightly larger or smaller depending on design
                ),
              ),
              const Spacer(),
              Image.asset(AppImagesStrings.fruitsImage, fit: BoxFit.fill),
            ],
          ),
        ],
      ),
    );
  }
}
