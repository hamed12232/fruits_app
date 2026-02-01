import 'package:dartz/dartz.dart';
import 'package:fruits_app/features/orders/domain/entities/order_entity.dart';

abstract class OrderRepository {
  Future<Either<String, void>> addOrder(OrderEntity order);
  Future<Either<String, List<OrderEntity>>> getOrders();
  Future<Either<String, void>> updateOrderStatus(String orderId, String status);
}
