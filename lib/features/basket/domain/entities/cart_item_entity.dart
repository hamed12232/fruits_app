import 'package:equatable/equatable.dart';
import 'package:fruits_app/features/product/domain/entities/product_entity.dart';

class CartItemEntity extends Equatable {
  final ProductEntity product;
  final int quantity;

  const CartItemEntity({required this.product, this.quantity = 1});

  CartItemEntity copyWith({ProductEntity? product, int? quantity}) {
    return CartItemEntity(
      product: product ?? this.product,
      quantity: quantity ?? this.quantity,
    );
  }

  // Helper to calculate total price for this item
  num get totalPrice => product.price * quantity;

  @override
  List<Object?> get props => [product, quantity];
}
