import 'package:dartz/dartz.dart';
import 'package:fruits_app/features/product/domain/entities/product_entity.dart';

abstract class ProductRepository {
  Future<Either<String, List<ProductEntity>>> getProducts();
}
