import 'package:flutter/material.dart';
import 'package:fruits_app/core/widget/adaptive_layout/adaptive_layout.dart';
import 'package:fruits_app/features/basket/presentation/screen/basket_screen_desktop.dart';
import 'package:fruits_app/features/basket/presentation/screen/basket_screen_mobile.dart';
import 'package:fruits_app/features/basket/presentation/screen/basket_screen_tablet.dart';

class BasketScreen extends StatelessWidget {
  const BasketScreen({super.key});
  static const String routeName = '/basket';

  @override
  Widget build(BuildContext context) {
    return AdaptiveLayout(
      mobileLayout: const BasketScreenMobile(),
      tabletLayout: const BasketScreenTablet(),
      desktopLayout: const BasketScreenDesktop(),
    );
  }
}
