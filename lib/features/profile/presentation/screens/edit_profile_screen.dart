import 'package:flutter/material.dart';
import 'package:fruits_app/core/widget/adaptive_layout/adaptive_layout.dart';
import 'package:fruits_app/features/profile/presentation/screens/edit_profile_screen_desktop.dart';
import 'package:fruits_app/features/profile/presentation/screens/edit_profile_screen_mobile.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});
  static const String routeName = '/edit-profile';

  @override
  Widget build(BuildContext context) {
    return AdaptiveLayout(
      mobileLayout: EditProfileScreenMobile(),
      desktopLayout: EditProfileScreenDesktop(),
    );
  }
}
