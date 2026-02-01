import 'package:bloc/bloc.dart';
import 'package:fruits_app/features/basket/domain/entities/cart_item_entity.dart';
import 'package:fruits_app/features/checkout/presentation/cubit/checkout_state.dart';
import 'package:fruits_app/features/orders/domain/entities/order_entity.dart';
import 'package:fruits_app/features/orders/domain/repository/order_repository.dart';

class CheckoutCubit extends Cubit<CheckoutState> {
  final OrderRepository orderRepository;
  int currentStep = 0;

  // Temporary storage for checkout data
  String deliveryTime = 'Now';
  String address = 'Default Address'; // Should be selected from address list
  String paymentMethod = 'Cash on Delivery';

  CheckoutCubit({required this.orderRepository}) : super(CheckoutInitial());

  void changeStep(int step) {
    currentStep = step;
    emit(CheckoutStepChanged(stepIndex: currentStep));
  }

  Future<void> placeOrder({
    required List<CartItemEntity> items,
    required double totalPrice,
  }) async {
    emit(CheckoutLoading());
    final order = OrderEntity(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      items: items,
      totalPrice: totalPrice,
      date: DateTime.now(),
      status: OrderStatus.newOrder,
      shippingAddress: address,
      paymentMethod: paymentMethod,
    );

    final result = await orderRepository.addOrder(order);
    result.fold(
      (failure) => emit(CheckoutError(message: failure)),
      (success) => emit(CheckoutSuccess()),
    );
  }
}
