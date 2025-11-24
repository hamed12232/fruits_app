import 'package:flutter/material.dart';
import 'package:fruits_app/core/widget/adaptive_layout/adaptive_layout.dart';
import 'package:fruits_app/features/profile/presentation/screens/terms_and_conditions_screen_desktop.dart';
import 'package:fruits_app/features/profile/presentation/screens/terms_and_conditions_screen_mobile.dart';

class TermsAndConditionsScreen extends StatelessWidget {
  const TermsAndConditionsScreen({super.key});
  static const String routeName = '/terms-and-conditions';

  @override
  Widget build(BuildContext context) {
    return AdaptiveLayout(
      mobileLayout: TermsAndConditionsScreenMobile(),
      desktopLayout: TermsAndConditionsScreenDesktop(),
    );
  }
}
