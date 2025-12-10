import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fruits_app/core/widget/adaptive_layout/adaptive_layout.dart';
import 'package:fruits_app/features/auth/modules/sign_up/presentation/screen/sign_up_screen_desktop.dart';
import 'package:fruits_app/features/auth/modules/sign_up/presentation/screen/sign_up_screen_landscape.dart';
import 'package:fruits_app/features/auth/modules/sign_up/presentation/screen/sign_up_screen_mobile.dart';
import 'package:fruits_app/features/auth/modules/sign_up/presentation/screen/sign_up_screen_tablet.dart';
import 'package:fruits_app/features/auth/modules/sign_up/presentation/screen/sign_up_screen_web.dart';

class SignUpScreenAdaptive extends StatelessWidget {
  const SignUpScreenAdaptive({super.key});
  static const routeName = '/sign-up';

  @override
  Widget build(BuildContext context) {
    return AdaptiveLayout(
      mobileLayout: OrientationBuilder(
        builder: (context, orientation) => orientation == Orientation.landscape
            ? const SignUpScreenLandscape()
            : const SignUpScreenMobile(),
      ),
      tabletLayout: OrientationBuilder(
        builder: (context, orientation) => orientation == Orientation.landscape
            ? const SignUpScreenLandscape()
            : const SignUpScreenTablet(),
      ),
      desktopLayout: kIsWeb
          ? const SignUpScreenWeb()
          : const SignUpScreenDesktop(),
    );
  }
}
