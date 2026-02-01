import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_app/core/utils/constant/app_colors.dart';
import 'package:fruits_app/core/utils/constant/app_images_strings.dart';
import 'package:fruits_app/features/orders/domain/entities/order_entity.dart';
import 'package:fruits_app/features/orders/presentation/cubit/order_cubit.dart';
import 'package:fruits_app/features/orders/presentation/cubit/order_state.dart';
import 'package:fruits_app/features/orders/presentation/widget/order_card.dart';
import 'package:intl/intl.dart';

class OrdersViewBody extends StatelessWidget {
  const OrdersViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderCubit, OrderState>(
      builder: (context, state) {
        if (state is OrderLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is OrderError) {
          return Center(child: Text(state.message));
        } else if (state is OrderLoaded) {
          if (state.orders.isEmpty) {
            return const Center(child: Text('No orders yet'));
          }
          final orders = state.orders.reversed.toList(); // Newest first
          return ListView.builder(
            itemCount: orders.length,
            itemBuilder: (context, index) {
              final order = orders[index];
              final statusAttributes = _getStatusAttributes(order.status);

              return OrderCard(
                orderId:
                    '#${order.id.length > 6 ? order.id.substring(order.id.length - 6) : order.id}',
                price: '${order.totalPrice} KD',
                date: DateFormat('d MMM').format(order.date),
                itemsCount: '${order.items.length}',
                status: statusAttributes['text'] as String,
                statusColor: statusAttributes['color'] as Color,
                statusIcon: statusAttributes['icon'] as String,
                statusIconBackground: statusAttributes['bg'] as Color,
              );
            },
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }

  Map<String, dynamic> _getStatusAttributes(OrderStatus status) {
    switch (status) {
      case OrderStatus.newOrder:
        return {
          'text': 'New',
          'color': Colors.lightBlue,
          'icon': AppImagesStrings.newOrder,
          'bg': Colors.lightBlue.withOpacity(0.4),
        };
      case OrderStatus.beingDelivered:
        return {
          'text': 'Delivering',
          'color': AppColors.yellow,
          'icon': AppImagesStrings.deliveringOrder,
          'bg': AppColors.yellow.withOpacity(0.2),
        };
      case OrderStatus.delivered:
        return {
          'text': 'Delivered',
          'color': Colors.purple,
          'icon': AppImagesStrings.deliveredOrder,
          'bg': Colors.purple.withOpacity(0.4),
        };
      case OrderStatus.canceled:
        return {
          'text': 'Canceled',
          'color': AppColors.failureColor,
          'icon': AppImagesStrings.cancelOrder,
          'bg': AppColors.failureColor.withOpacity(0.4),
        };
    }
  }
}
