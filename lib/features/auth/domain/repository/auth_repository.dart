import 'package:dartz/dartz.dart';
import 'package:fruits_app/features/auth/data/models/forget_password_response_model.dart';
import 'package:fruits_app/features/auth/data/models/login_response_model.dart';
import 'package:fruits_app/features/auth/data/models/register_response_model.dart';

/// Abstract repository for auth operations
abstract class AuthRepository {
  Future<Either<String, LoginResponseModel>> login({
    required String phoneEmail,
    required String password,
  });

  Future<Either<String, RegisterResponseModel>> register({
    required String name,
    required String mobile,
    required String email,
    required String password,
    required String cPassword,
    String? onesignalId,
  });

  Future<Either<String, ForgetPasswordResponseModel>> forgetPassword({
    required String email,
  });
}
