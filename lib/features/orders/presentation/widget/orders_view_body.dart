import 'package:flutter/material.dart';
import 'package:fruits_app/core/utils/constant/dummy_data.dart';
import 'package:fruits_app/features/orders/presentation/widget/order_card.dart';

class OrdersViewBody extends StatelessWidget {
  const OrdersViewBody({super.key});

  @override
  Widget build(BuildContext context) {

    return ListView.builder(
      itemCount: orders.length,
      itemBuilder: (context, index) {
        final order = orders[index];
        return OrderCard(
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
    );
  }
}
