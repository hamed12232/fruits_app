import 'package:flutter/material.dart';
import 'package:fruits_app/core/utils/constant/app_text_strings.dart';
import 'package:fruits_app/core/widget/common/custom_app_bar.dart';
import 'package:fruits_app/features/orders/presentation/widget/orders_view_body.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});
  static const String routeName = '/orders-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: AppTextStrings.myOrders),
      body: const OrdersViewBody(),
    );
  }
}
