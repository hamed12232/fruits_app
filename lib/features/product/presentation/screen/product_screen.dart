import 'package:flutter/material.dart';
import 'package:fruits_app/core/widget/adaptive_layout/adaptive_layout.dart';
import 'package:fruits_app/features/product/presentation/screen/product_screen_desktop.dart';
import 'package:fruits_app/features/product/presentation/screen/product_screen_landscape.dart';
import 'package:fruits_app/features/product/presentation/screen/product_screen_mobile.dart';
import 'package:fruits_app/features/product/presentation/screen/product_screen_tablet.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});
  static const String routeName = '/product';

  @override
  Widget build(BuildContext context) {
    return AdaptiveLayout(
      mobileLayout: OrientationBuilder(
        builder: (context, orientation) => orientation == Orientation.landscape
            ? const ProductScreenLandscape()
            : const ProductScreenMobile(),
      ),
      tabletLayout: OrientationBuilder(
        builder: (context, orientation) => orientation == Orientation.landscape
            ? const ProductScreenLandscape()
            : const ProductScreenTablet(),
      ),
      desktopLayout: const ProductScreenDesktop(),
    );
  }
}
