import 'package:flutter/material.dart';
import 'package:fruits_app/core/widget/adaptive_layout/adaptive_layout.dart';
import 'package:fruits_app/features/profile/presentation/screens/profile_screen_desktop.dart';
import 'package:fruits_app/features/profile/presentation/screens/profile_screen_mobile.dart';
import 'package:fruits_app/features/profile/presentation/screens/profile_screen_tablet.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AdaptiveLayout(
      mobileLayout: const ProfileScreenMobile(),
      tabletLayout: const ProfileScreenTablet(),
      desktopLayout: const ProfileScreenDesktop(),
    );
  }
}
