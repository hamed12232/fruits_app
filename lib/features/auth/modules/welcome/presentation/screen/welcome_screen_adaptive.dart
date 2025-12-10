import 'package:flutter/material.dart';
import 'package:fruits_app/features/auth/modules/welcome/presentation/screen/welcome_screen.dart';
import 'package:fruits_app/features/auth/modules/welcome/presentation/screen/welcome_screen_landscape.dart';

class WelcomeScreenAdaptive extends StatelessWidget {
  const WelcomeScreenAdaptive({super.key});

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        return orientation == Orientation.landscape
            ? const WelcomeScreenLandscape()
            : const WelcomeScreen();
      },
    );
  }
}
