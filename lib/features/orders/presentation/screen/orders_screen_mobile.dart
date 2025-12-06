import 'package:flutter/material.dart';
import 'package:fruits_app/core/utils/constant/app_text_strings.dart';
import 'package:fruits_app/core/widget/common/custom_app_bar.dart';
import 'package:fruits_app/features/orders/presentation/widget/orders_view_body.dart';

class OrdersScreenMobile extends StatelessWidget {
  const OrdersScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: AppTextStrings.myOrders,
      showBackButton: false,
      ),
      body: const OrdersViewBody(),
    );
  }
}
