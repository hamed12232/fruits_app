import 'package:flutter/material.dart';
import 'package:fruits_app/features/auth/modules/otp_verification/presentation/screen/otp_verification_screen.dart';
import 'package:fruits_app/features/auth/modules/otp_verification/presentation/screen/otp_verification_screen_landscape.dart';

class OtpVerificationScreenAdaptive extends StatelessWidget {
  const OtpVerificationScreenAdaptive({super.key});

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        return orientation == Orientation.landscape
            ? const OtpVerificationScreenLandscape()
            : const OtpVerificationScreen();
      },
    );
  }
}
