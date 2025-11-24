import 'package:flutter/material.dart';
import 'package:fruits_app/core/widget/adaptive_layout/adaptive_layout.dart';
import 'package:fruits_app/features/profile/presentation/screens/contact_us_screen_desktop.dart';
import 'package:fruits_app/features/profile/presentation/screens/contact_us_screen_mobile.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({super.key});
  static const String routeName = '/contact-us';

  @override
  Widget build(BuildContext context) {
    return AdaptiveLayout(
      mobileLayout: ContactUsScreenMobile(),
      desktopLayout: ContactUsScreenDesktop(),
    );
  }
}
