import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fruits_app/core/widget/adaptive_layout/adaptive_layout.dart';
import 'sign_up_screen_desktop.dart';
import 'sign_up_screen_mobile.dart';
import 'sign_up_screen_tablet.dart';
import 'sign_up_screen_web.dart';

class SignUpScreenAdaptive extends StatelessWidget {
  const SignUpScreenAdaptive({super.key});
  static const routeName = '/sign-up';

  @override
  Widget build(BuildContext context) {
    return AdaptiveLayout(
      mobileLayout: const SignUpScreenMobile(),
      tabletLayout: const SignUpScreenTablet(),
      desktopLayout: kIsWeb
          ? const SignUpScreenWeb()
          : const SignUpScreenDesktop(),
    );
  }
}
