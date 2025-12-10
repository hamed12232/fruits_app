import 'package:flutter/material.dart';
import 'package:fruits_app/core/widget/adaptive_layout/adaptive_layout.dart';
import 'package:fruits_app/features/home/presentation/screens/home_screen_desktop.dart';
import 'package:fruits_app/features/home/presentation/screens/home_screen_landscape.dart';
import 'package:fruits_app/features/home/presentation/screens/home_screen_mobile.dart';
import 'package:fruits_app/features/home/presentation/screens/home_screen_tablet.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const routeName = '/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return AdaptiveLayout(
      mobileLayout: OrientationBuilder(
        builder: (context, orientation) => orientation == Orientation.landscape
            ? const HomeScreenLandscape()
            : const HomeScreenMobile(),
      ),
      tabletLayout: OrientationBuilder(
        builder: (context, orientation) => orientation == Orientation.landscape
            ? const HomeScreenLandscape() // Or TabletLandscape if needed, but reusing for now per pattern
            : const HomeScreenTablet(),
      ),
      desktopLayout: HomeScreenDesktop(),
    );
  }
}
