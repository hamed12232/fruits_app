import 'package:dartz/dartz.dart';
import 'package:fruits_app/features/orders/data/data_source/order_local_data_source.dart';
import 'package:fruits_app/features/orders/data/models/order_model.dart';
import 'package:fruits_app/features/orders/domain/entities/order_entity.dart';
import 'package:fruits_app/features/orders/domain/repository/order_repository.dart';

class OrderRepositoryImpl implements OrderRepository {
  final OrderLocalDataSource orderLocalDataSource;

  OrderRepositoryImpl({required this.orderLocalDataSource});

  @override
  Future<Either<String, void>> addOrder(OrderEntity order) async {
    try {
      final orderModel = OrderModel.fromEntity(order);
      await orderLocalDataSource.addOrder(orderModel);
      return const Right(null);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, List<OrderEntity>>> getOrders() async {
    try {
      final orders = await orderLocalDataSource.getOrders();
      return Right(orders);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, void>> updateOrderStatus(
    String orderId,
    String status,
  ) async {
    try {
      await orderLocalDataSource.updateOrderStatus(orderId, status);
      return const Right(null);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
