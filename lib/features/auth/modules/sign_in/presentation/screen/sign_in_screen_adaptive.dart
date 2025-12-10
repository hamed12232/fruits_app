import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fruits_app/core/widget/adaptive_layout/adaptive_layout.dart';
import 'package:fruits_app/features/auth/modules/sign_in/presentation/screen/sign_in_screen_desktop.dart';
import 'package:fruits_app/features/auth/modules/sign_in/presentation/screen/sign_in_screen_landscape.dart';
import 'package:fruits_app/features/auth/modules/sign_in/presentation/screen/sign_in_screen_mobile.dart';
import 'package:fruits_app/features/auth/modules/sign_in/presentation/screen/sign_in_screen_tablet.dart';
import 'package:fruits_app/features/auth/modules/sign_in/presentation/screen/sign_in_screen_web.dart';

class SignInScreenAdaptive extends StatelessWidget {
  const SignInScreenAdaptive({super.key});
  static const routeName = '/sign-in';

  @override
  Widget build(BuildContext context) {
    return AdaptiveLayout(
      mobileLayout: OrientationBuilder(
        builder: (context, orientation) => orientation == Orientation.landscape
            ? const SignInScreenLandscape()
            : const SignInScreenMobile(),
      ),
      tabletLayout: OrientationBuilder(
        builder: (context, orientation) => orientation == Orientation.landscape
            ? const SignInScreenLandscape()
            : const SignInScreenTablet(),
      ),
      desktopLayout: kIsWeb
          ? const SignInScreenWeb()
          : const SignInScreenDesktop(),
    );
  }
}
