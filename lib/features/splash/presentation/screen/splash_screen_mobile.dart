import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_app/core/utils/constant/app_height.dart';
import 'package:fruits_app/core/utils/constant/app_images_strings.dart';

class SplashScreenMobile extends StatelessWidget {
  const SplashScreenMobile({super.key});

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
              SizedBox(height: AppHeight.h221),
              Center(child: Image.asset(AppImagesStrings.fruitMarketImage)),
              const Spacer(),
              Image.asset(AppImagesStrings.fruitsImage, fit: BoxFit.fill),
            ],
          ),
        ],
      ),
    );
  }
}
