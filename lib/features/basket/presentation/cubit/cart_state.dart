import 'package:equatable/equatable.dart';
import 'package:fruits_app/features/basket/domain/entities/cart_item_entity.dart';

abstract class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}

class CartInitial extends CartState {}

class CartLoading extends CartState {}

class CartLoaded extends CartState {
  final List<CartItemEntity> items;
  final num subtotal;
  final num shipping;
  final num total;

  const CartLoaded({
    required this.items,
    this.subtotal = 0,
    this.shipping = 0,
    this.total = 0,
  });

  @override
  List<Object> get props => [items, subtotal, shipping, total];
}

class CartError extends CartState {
  final String message;

  const CartError(this.message);

  @override
  List<Object> get props => [message];
}
