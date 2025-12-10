import 'package:flutter/material.dart';
import 'package:fruits_app/features/auth/modules/verify_number/presentation/screen/verify_number_screen.dart';
import 'package:fruits_app/features/auth/modules/verify_number/presentation/screen/verify_number_screen_landscape.dart';

class VerifyNumberScreenAdaptive extends StatelessWidget {
  const VerifyNumberScreenAdaptive({super.key});

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        return orientation == Orientation.landscape
            ? const VerifyNumberScreenLandscape()
            : const VerifyNumberScreen();
      },
    );
  }
}
