import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_app/features/orders/domain/repository/order_repository.dart';
import 'package:fruits_app/features/orders/presentation/cubit/order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  final OrderRepository orderRepository;

  OrderCubit({required this.orderRepository}) : super(OrderInitial());

  Future<void> fetchOrders() async {
    emit(OrderLoading());
    final result = await orderRepository.getOrders();
    result.fold(
      (failure) => emit(OrderError(message: failure)),
      (orders) => emit(OrderLoaded(orders: orders)),
    );
  }

  Future<void> cancelOrder(String orderId) async {
    // Optimistic update or refresh?
    // For now, let's refresh after update.
    final result = await orderRepository.updateOrderStatus(orderId, 'canceled');
    result.fold(
      (failure) => emit(OrderError(message: failure)),
      (_) => fetchOrders(),
    );
  }
}
