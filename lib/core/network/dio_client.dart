import 'package:dio/dio.dart';
import 'package:fruits_app/core/network/api_constance.dart';

/// Dio client singleton for Fruits API
class DioClient {
  DioClient._();
  static final DioClient _instance = DioClient._();
  static DioClient get instance => _instance;

  Dio? _dio;

  Dio get dio {
    _dio ??= _createDio();
    return _dio!;
  }

  Dio _createDio() {
    final dio = Dio(
      BaseOptions(
        baseUrl: ApiConstance.fruitsBaseUrl,
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
          'lang': 'en',
        },
      ),
    );

    // Add logging interceptor for debugging
    // dio.interceptors.add(
    //   LogInterceptor(requestBody: true, responseBody: true, error: true),
    // );

    return dio;
  }
}
