import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_app/features/basket/domain/entities/cart_item_entity.dart';
import 'package:fruits_app/features/basket/presentation/cubit/cart_state.dart';
import 'package:fruits_app/features/product/domain/entities/product_entity.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial()) {
    // Initialize with empty cart
    emit(const CartLoaded(items: []));
  }

  void addToCart(ProductEntity product) {
    if (state is CartLoaded) {
      final currentState = state as CartLoaded;
      final List<CartItemEntity> currentItems = List.from(currentState.items);

      // Check if product already exists
      final int index = currentItems.indexWhere(
        (item) => item.product.id == product.id,
      );

      if (index != -1) {
        // Increment quantity
        final currentItem = currentItems[index];
        currentItems[index] = currentItem.copyWith(
          quantity: currentItem.quantity + 1,
        );
      } else {
        // Add new item
        currentItems.add(CartItemEntity(product: product));
      }

      _emitUpdatedState(currentItems);
    }
  }

  void removeFromCart(CartItemEntity item) {
    if (state is CartLoaded) {
      final currentState = state as CartLoaded;
      final List<CartItemEntity> currentItems = List.from(currentState.items);

      currentItems.removeWhere((i) => i.product.id == item.product.id);

      _emitUpdatedState(currentItems);
    }
  }

  void incrementQuantity(CartItemEntity item) {
    if (state is CartLoaded) {
      final currentState = state as CartLoaded;
      final List<CartItemEntity> currentItems = List.from(currentState.items);
      final int index = currentItems.indexWhere(
        (i) => i.product.id == item.product.id,
      );

      if (index != -1) {
        currentItems[index] = item.copyWith(quantity: item.quantity + 1);
        _emitUpdatedState(currentItems);
      }
    }
  }

  void decrementQuantity(CartItemEntity item) {
    if (state is CartLoaded) {
      final currentState = state as CartLoaded;
      final List<CartItemEntity> currentItems = List.from(currentState.items);
      final int index = currentItems.indexWhere(
        (i) => i.product.id == item.product.id,
      );

      if (index != -1) {
        if (item.quantity > 1) {
          currentItems[index] = item.copyWith(quantity: item.quantity - 1);
          _emitUpdatedState(currentItems);
        } 
      }
    }
  }

  void _emitUpdatedState(List<CartItemEntity> items) {
    num subtotal = 0;
    for (var item in items) {
      subtotal += item.totalPrice;
    }

    // Example fixed shipping, or logic based on subtotal
    num shipping = items.isEmpty ? 0 : 1.5;
    num total = subtotal + shipping;

    emit(
      CartLoaded(
        items: items,
        subtotal: subtotal,
        shipping: shipping,
        total: total,
      ),
    );
  }
}
