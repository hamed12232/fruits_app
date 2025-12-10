import 'package:flutter/material.dart';
import 'package:fruits_app/core/widget/adaptive_layout/adaptive_layout.dart';
import 'package:fruits_app/features/profile/presentation/screens/profile_screen_desktop.dart';
import 'package:fruits_app/features/profile/presentation/screens/profile_screen_landscape.dart';
import 'package:fruits_app/features/profile/presentation/screens/profile_screen_mobile.dart';
import 'package:fruits_app/features/profile/presentation/screens/profile_screen_tablet.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AdaptiveLayout(
      mobileLayout: OrientationBuilder(
        builder: (context, orientation) => orientation == Orientation.landscape
            ? const ProfileScreenLandscape()
            : const ProfileScreenMobile(),
      ),
      tabletLayout: OrientationBuilder(
        builder: (context, orientation) => orientation == Orientation.landscape
            ? const ProfileScreenLandscape()
            : const ProfileScreenTablet(),
      ),
      desktopLayout: const ProfileScreenDesktop(),
    );
  }
}
