import 'package:dio/dio.dart';
import 'package:fruits_app/core/network/api_constance.dart';
import 'package:fruits_app/features/auth/data/models/forget_password_response_model.dart';
import 'package:fruits_app/features/auth/data/models/login_request_model.dart';
import 'package:fruits_app/features/auth/data/models/login_response_model.dart';
import 'package:fruits_app/features/auth/data/models/register_request_model.dart';
import 'package:fruits_app/features/auth/data/models/register_response_model.dart';

/// Abstract class for auth remote data source
abstract class BaseAuthRemoteDataSource {
  Future<LoginResponseModel> login(LoginRequestModel request);
  Future<RegisterResponseModel> register(RegisterRequestModel request);
  Future<ForgetPasswordResponseModel> forgetPassword(String email);
}

/// Implementation of auth remote data source using Dio
class AuthRemoteDataSource implements BaseAuthRemoteDataSource {
  final Dio dio;

  AuthRemoteDataSource({required this.dio});

  @override
  Future<LoginResponseModel> login(LoginRequestModel request) async {
    final response = await dio.post(
      ApiConstance.fruitsLogin,
      data: request.toJson(),
    );

    return LoginResponseModel.fromJson(response.data as Map<String, dynamic>);
  }

  @override
  Future<RegisterResponseModel> register(RegisterRequestModel request) async {
    final response = await dio.post(
      ApiConstance.fruitsRegister,
      data: request.toFormData(),
      options: Options(contentType: 'multipart/form-data'),
    );

    return RegisterResponseModel.fromJson(
      response.data as Map<String, dynamic>,
    );
  }

  @override
  Future<ForgetPasswordResponseModel> forgetPassword(String email) async {
    final response = await dio.post(
      ApiConstance.fruitsForgetPassword,
      data: {'email': email},
    );

    return ForgetPasswordResponseModel.fromJson(
      response.data as Map<String, dynamic>,
    );
  }
}
