import 'package:dartz/dartz.dart';
import 'package:fruits_app/features/auth/data/models/register_response_model.dart';
import 'package:fruits_app/features/auth/domain/repository/auth_repository.dart';

/// Use case for register operation
class RegisterUseCase {
  final AuthRepository repository;

  RegisterUseCase({required this.repository});

  Future<Either<String, RegisterResponseModel>> call({
    required String name,
    required String mobile,
    required String email,
    required String password,
    required String cPassword,
    String? onesignalId,
  }) async {
    return await repository.register(
      name: name,
      mobile: mobile,
      email: email,
      password: password,
      cPassword: cPassword,
      onesignalId: onesignalId,
    );
  }
}
