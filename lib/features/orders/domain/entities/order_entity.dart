import 'package:equatable/equatable.dart';
import 'package:fruits_app/features/basket/domain/entities/cart_item_entity.dart';

enum OrderStatus { newOrder, beingDelivered, delivered, canceled }

class OrderEntity extends Equatable {
  final String id;
  final List<CartItemEntity> items;
  final double totalPrice;
  final DateTime date;
  final OrderStatus status;
  final String shippingAddress;
  final String paymentMethod;

  const OrderEntity({
    required this.id,
    required this.items,
    required this.totalPrice,
    required this.date,
    required this.status,
    required this.shippingAddress,
    required this.paymentMethod,
  });

  @override
  List<Object?> get props => [
    id,
    items,
    totalPrice,
    date,
    status,
    shippingAddress,
    paymentMethod,
  ];
}
