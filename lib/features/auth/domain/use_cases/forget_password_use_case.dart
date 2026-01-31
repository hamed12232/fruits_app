import 'package:dartz/dartz.dart';
import 'package:fruits_app/features/auth/data/models/forget_password_response_model.dart';
import 'package:fruits_app/features/auth/domain/repository/auth_repository.dart';

/// Use case for forget password operation
class ForgetPasswordUseCase {
  final AuthRepository repository;

  ForgetPasswordUseCase({required this.repository});

  Future<Either<String, ForgetPasswordResponseModel>> call({
    required String email,
  }) async {
    return await repository.forgetPassword(email: email);
  }
}
