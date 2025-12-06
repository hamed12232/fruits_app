import 'package:flutter/material.dart';
import 'package:fruits_app/core/utils/constant/app_text_strings.dart';
import 'package:fruits_app/core/widget/common/custom_app_bar.dart';
import 'package:fruits_app/features/orders/presentation/widget/orders_view_body.dart';

class OrdersScreenDesktop extends StatelessWidget {
  const OrdersScreenDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: AppTextStrings.myOrders,
        showBackButton: false,
      ),
      body: Center(
        child: Container(
          constraints: BoxConstraints(maxWidth: 1200),
          padding: EdgeInsets.all(24),
          child: const OrdersViewBody(),
        ),
      ),
    );
  }
}
