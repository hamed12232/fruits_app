import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_app/core/utils/constant/app_images_strings.dart';

class SplashScreenDesktop extends StatelessWidget {
  const SplashScreenDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: SvgPicture.asset(
              AppImagesStrings.backgroundSplashImage,
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                Image.asset(
                  AppImagesStrings.fruitMarketImage,
                  scale: 0.7,
                ),
                const Spacer(),
                Image.asset(
                  AppImagesStrings.fruitsImage,
                  fit: BoxFit.contain,
                  height:
                      MediaQuery.of(context).size.height *
                      0.4,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
