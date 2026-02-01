import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:fruits_app/features/product/data/data_source/product_remote_data_source.dart';
import 'package:fruits_app/features/product/domain/entities/product_entity.dart';
import 'package:fruits_app/features/product/domain/repository/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  final BaseProductRemoteDataSource remoteDataSource;

  ProductRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<String, List<ProductEntity>>> getProducts() async {
    try {
      final result = await remoteDataSource.getProducts();
      return Right(result);
    } on DioException catch (e) {
      return Left(e.message ?? 'An error occurred');
    } catch (e) {
      return Left(e.toString());
    }
  }
}
