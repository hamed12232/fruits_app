import 'package:flutter/material.dart';
import 'package:fruits_app/core/widget/adaptive_layout/adaptive_layout.dart';
import 'package:fruits_app/features/orders/presentation/screen/order_tracking_screen_desktop.dart';
import 'package:fruits_app/features/orders/presentation/screen/order_tracking_screen_landscape.dart';
import 'package:fruits_app/features/orders/presentation/screen/order_tracking_screen_mobile.dart';

class OrderTrackingScreen extends StatelessWidget {
  const OrderTrackingScreen({super.key});
  static const String routeName = '/order-tracking';

  @override
  Widget build(BuildContext context) {
    return AdaptiveLayout(
      mobileLayout: OrientationBuilder(
        builder: (context, orientation) => orientation == Orientation.landscape
            ? const OrderTrackingScreenLandscape()
            : const OrderTrackingScreenMobile(),
      ),
      desktopLayout: OrderTrackingScreenDesktop(),
    );
  }
}
