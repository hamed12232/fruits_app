import 'package:dio/dio.dart';
import 'package:fruits_app/core/network/api_constance.dart';
import 'package:fruits_app/features/product/data/models/product_model.dart';

abstract class BaseProductRemoteDataSource {
  Future<List<ProductModel>> getProducts();
}

class ProductRemoteDataSource implements BaseProductRemoteDataSource {
  final Dio dio;

  ProductRemoteDataSource({required this.dio});

  @override
  Future<List<ProductModel>> getProducts() async {
    final response = await dio.get(ApiConstance.fruitsProducts);

    if (response.statusCode == 200) {
      final data = response.data['data']['data'] as List;
      return data.map((e) => ProductModel.fromJson(e)).toList();
    } else {
      throw DioException(
        requestOptions: response.requestOptions,
        response: response,
        type: DioExceptionType.badResponse,
        error: response.data['message'] ?? 'Unknown error',
      );
    }
  }
}
