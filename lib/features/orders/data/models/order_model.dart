import 'dart:convert';

import 'package:fruits_app/features/basket/domain/entities/cart_item_entity.dart';
import 'package:fruits_app/features/orders/domain/entities/order_entity.dart';
import 'package:fruits_app/features/product/data/models/product_model.dart';

class OrderModel extends OrderEntity {
  const OrderModel({
    required super.id,
    required super.items,
    required super.totalPrice,
    required super.date,
    required super.status,
    required super.shippingAddress,
    required super.paymentMethod,
  });

  factory OrderModel.fromEntity(OrderEntity entity) {
    return OrderModel(
      id: entity.id,
      items: entity.items,
      totalPrice: entity.totalPrice,
      date: entity.date,
      status: entity.status,
      shippingAddress: entity.shippingAddress,
      paymentMethod: entity.paymentMethod,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'items': items.map((x) {
        // We need to serialize CartItemEntity.
        // Ideally CartItemEntity should have its own model or toJson.
        // For simplicity, we inline serialization here assuming ProductModel handles product serialization.
        return {
          'product': ProductModel.fromEntity(x.product).toMap(),
          'quantity': x.quantity,
        };
      }).toList(),
      'totalPrice': totalPrice,
      'date': date.toIso8601String(),
      'status': status.name,
      'shippingAddress': shippingAddress,
      'paymentMethod': paymentMethod,
    };
  }

  factory OrderModel.fromMap(Map<String, dynamic> map) {
    return OrderModel(
      id: map['id'] ?? '',
      items: List<CartItemEntity>.from(
        (map['items'] as List<dynamic>).map<CartItemEntity>(
          (x) => CartItemEntity(
            product: ProductModel.fromMap(x['product']),
            quantity: x['quantity'] ?? 1,
          ),
        ),
      ),
      totalPrice: (map['totalPrice'] as num).toDouble(),
      date: DateTime.parse(map['date']),
      status: OrderStatus.values.firstWhere(
        (e) => e.name == map['status'],
        orElse: () => OrderStatus.newOrder,
      ),
      shippingAddress: map['shippingAddress'] ?? '',
      paymentMethod: map['paymentMethod'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory OrderModel.fromJson(String source) =>
      OrderModel.fromMap(json.decode(source));
}
