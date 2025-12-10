import 'package:flutter/material.dart';
import 'package:fruits_app/core/utils/constant/app_colors.dart';
import 'package:fruits_app/core/utils/constant/app_text_strings.dart';
import 'package:fruits_app/core/utils/constant/dummy_data.dart';
import 'package:fruits_app/core/widget/common/custom_app_bar.dart';
import 'package:fruits_app/features/orders/presentation/widget/order_card_landscape.dart';

class OrdersScreenLandscape extends StatelessWidget {
  const OrdersScreenLandscape({
    super.key,
    this.status = const [
      "Delivering",
      "Finished",
      "Canceled",
      "Working",
      "Delivered",
    ],
  });
  final List<String> status;

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.homebackground,
      appBar: const CustomAppBar(
        title: AppTextStrings.myOrders,
        showBackButton: false,
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: orders.length,
          itemBuilder: (context, index) {
            final order = orders[index];
            return OrderCardLandscape(
              orderId: order['orderId'],
              price: order['price'],
              date: order['date'],
              itemsCount: order['itemsCount'],
              status: order['status'],
              statusColor: order['statusColor'],
              statusIcon: order['statusIcon'],
              statusIconBackground: order['statusIconBackground'],
            );
          },
        ),
      ),
    );
  }
}
