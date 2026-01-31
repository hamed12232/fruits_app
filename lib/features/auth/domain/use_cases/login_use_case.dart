import 'package:dartz/dartz.dart';
import 'package:fruits_app/features/auth/data/models/login_response_model.dart';
import 'package:fruits_app/features/auth/domain/repository/auth_repository.dart';

/// Use case for login operation
class LoginUseCase {
  final AuthRepository repository;

  LoginUseCase({required this.repository});

  Future<Either<String, LoginResponseModel>> call({
    required String phoneEmail,
    required String password,
  }) async {
    return await repository.login(phoneEmail: phoneEmail, password: password);
  }
}
