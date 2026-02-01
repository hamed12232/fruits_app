import 'package:dartz/dartz.dart';
import 'package:fruits_app/features/product/domain/entities/product_entity.dart';
import 'package:fruits_app/features/product/domain/repository/product_repository.dart';

class GetProductsUseCase {
  final ProductRepository repository;

  GetProductsUseCase({required this.repository});

  Future<Either<String, List<ProductEntity>>> call() async {
    return await repository.getProducts();
  }
}
