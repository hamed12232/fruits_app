import 'package:flutter/material.dart';
import 'package:fruits_app/core/widget/adaptive_layout/adaptive_layout.dart';
import 'package:fruits_app/features/orders/presentation/screen/orders_screen_desktop.dart';
import 'package:fruits_app/features/orders/presentation/screen/orders_screen_mobile.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});
  static const String routeName = '/orders-screen';

  @override
  Widget build(BuildContext context) {
    return AdaptiveLayout(
      mobileLayout: OrdersScreenMobile(),
      desktopLayout: OrdersScreenDesktop(),
    );
  }
}
