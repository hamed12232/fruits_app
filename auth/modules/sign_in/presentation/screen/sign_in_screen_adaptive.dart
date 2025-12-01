import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fruits_app/core/widget/adaptive_layout/adaptive_layout.dart';
import 'sign_in_screen_desktop.dart';
import 'sign_in_screen_mobile.dart';
import 'sign_in_screen_tablet.dart';
import 'sign_in_screen_web.dart';

class SignInScreenAdaptive extends StatelessWidget {
  const SignInScreenAdaptive({super.key});
  static const routeName = '/sign-in';

  @override
  Widget build(BuildContext context) {
    return AdaptiveLayout(
      mobileLayout: const SignInScreenMobile(),
      tabletLayout: const SignInScreenTablet(),
      desktopLayout: kIsWeb
          ? const SignInScreenWeb()
          : const SignInScreenDesktop(),
    );
  }
}
