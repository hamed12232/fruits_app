import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:fruits_app/features/auth/data/data_source/auth_remote_data_source.dart';
import 'package:fruits_app/features/auth/data/models/forget_password_response_model.dart';
import 'package:fruits_app/features/auth/data/models/login_request_model.dart';
import 'package:fruits_app/features/auth/data/models/login_response_model.dart';
import 'package:fruits_app/features/auth/data/models/register_request_model.dart';
import 'package:fruits_app/features/auth/data/models/register_response_model.dart';
import 'package:fruits_app/features/auth/domain/repository/auth_repository.dart';

/// Implementation of auth repository
class AuthRepositoryImpl implements AuthRepository {
  final BaseAuthRemoteDataSource dataSource;

  AuthRepositoryImpl({required this.dataSource});

  @override
  Future<Either<String, LoginResponseModel>> login({
    required String phoneEmail,
    required String password,
  }) async {
    try {
      final request = LoginRequestModel(
        phoneEmail: phoneEmail,
        password: password,
      );
      final response = await dataSource.login(request);
      return Right(response);
    } on DioException catch (e) {
      final message = _handleDioError(e);
      return Left(message);
    } catch (e) {
      return Left('An unexpected error occurred: $e');
    }
  }

  @override
  Future<Either<String, RegisterResponseModel>> register({
    required String name,
    required String mobile,
    required String email,
    required String password,
    required String cPassword,
    String? onesignalId,
  }) async {
    try {
      final request = RegisterRequestModel(
        name: name,
        mobile: mobile,
        email: email,
        password: password,
        cPassword: cPassword,
        onesignalId: onesignalId,
      );
      final response = await dataSource.register(request);
      return Right(response);
    } on DioException catch (e) {
      final message = _handleDioError(e);
      return Left(message);
    } catch (e) {
      return Left('An unexpected error occurred: $e');
    }
  }

  @override
  Future<Either<String, ForgetPasswordResponseModel>> forgetPassword({
    required String email,
  }) async {
    try {
      final response = await dataSource.forgetPassword(email);
      return Right(response);
    } on DioException catch (e) {
      final message = _handleDioError(e);
      return Left(message);
    } catch (e) {
      return Left('An unexpected error occurred: $e');
    }
  }

  String _handleDioError(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return 'Connection timeout. Please check your internet connection.';
      case DioExceptionType.receiveTimeout:
        return 'Server is taking too long to respond.';
      case DioExceptionType.badResponse:
        final statusCode = e.response?.statusCode;
        final data = e.response?.data;
        if (data is Map<String, dynamic> && data.containsKey('message')) {
          return data['message'] as String;
        }
        return 'Server error: $statusCode';
      case DioExceptionType.connectionError:
        return 'Unable to connect to server. Please check your internet.';
      default:
        return 'Something went wrong. Please try again.';
    }
  }
}
