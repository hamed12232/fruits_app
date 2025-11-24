import 'package:flutter/material.dart';
import 'package:fruits_app/core/widget/adaptive_layout/adaptive_layout.dart';
import 'package:fruits_app/features/favourite/presentation/screen/favorite_screen_desktop.dart';
import 'package:fruits_app/features/favourite/presentation/screen/favorite_screen_mobile.dart';
import 'package:fruits_app/features/favourite/presentation/screen/favorite_screen_tablet.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});
  static const String routeName = '/favorite';

  @override
  Widget build(BuildContext context) {
    return AdaptiveLayout(
      mobileLayout: const FavoriteScreenMobile(),
      tabletLayout: const FavoriteScreenTablet(),
      desktopLayout: const FavoriteScreenDesktop(),
    );
  }
}
