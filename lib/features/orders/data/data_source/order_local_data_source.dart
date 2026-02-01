import 'dart:convert';

import 'package:fruits_app/features/orders/data/models/order_model.dart';
import 'package:fruits_app/features/orders/domain/entities/order_entity.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class OrderLocalDataSource {
  Future<void> addOrder(OrderModel order);
  Future<List<OrderModel>> getOrders();
  Future<void> updateOrderStatus(String orderId, String status);
}

class OrderLocalDataSourceImpl implements OrderLocalDataSource {
  final SharedPreferences sharedPreferences;
  static const String _ordersKey = 'user_orders';

  OrderLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<void> addOrder(OrderModel order) async {
    final orders = await getOrders();
    orders.add(order);
    await _saveOrders(orders);
  }

  @override
  Future<List<OrderModel>> getOrders() async {
    final jsonString = sharedPreferences.getString(_ordersKey);
    if (jsonString != null) {
      final List<dynamic> jsonList = json.decode(jsonString);
      return jsonList.map((e) => OrderModel.fromMap(e)).toList();
    }
    return [];
  }

  @override
  Future<void> updateOrderStatus(String orderId, String status) async {
    final orders = await getOrders();
    final index = orders.indexWhere((element) => element.id == orderId);
    if (index != -1) {
      final updatedOrder = OrderModel(
        id: orders[index].id,
        items: orders[index].items,
        totalPrice: orders[index].totalPrice,
        date: orders[index].date,
        status: OrderStatus.values.firstWhere((e) => e.name == status),
        shippingAddress: orders[index].shippingAddress,
        paymentMethod: orders[index].paymentMethod,
      );
      orders[index] = updatedOrder;
      await _saveOrders(orders);
    }
  }

  Future<void> _saveOrders(List<OrderModel> orders) async {
    final List<Map<String, dynamic>> jsonList = orders
        .map((e) => e.toMap())
        .toList();
    await sharedPreferences.setString(_ordersKey, json.encode(jsonList));
  }
}
