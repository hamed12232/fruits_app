import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_app/features/auth/domain/use_cases/register_use_case.dart';
import 'package:fruits_app/features/auth/modules/sign_up/presentation/cubit/register_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Cubit for managing register state
class RegisterCubit extends Cubit<RegisterState> {
  final RegisterUseCase registerUseCase;

  RegisterCubit({required this.registerUseCase})
    : super(const RegisterInitial());

  /// Perform registration
  Future<void> register({
    required String name,
    required String mobile,
    required String email,
    required String password,
    required String cPassword,
    String? onesignalId,
  }) async {
    emit(const RegisterLoading());

    final result = await registerUseCase(
      name: name,
      mobile: mobile,
      email: email,
      password: password,
      cPassword: cPassword,
      onesignalId: onesignalId,
    );

    result.fold((error) => emit(RegisterError(message: error)), (
      response,
    ) async {
      if (response.success) {
        // Save token to shared preferences
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('auth_token', response.token);

        emit(RegisterSuccess(response: response));
      } else {
        emit(RegisterError(message: response.message));
      }
    });
  }

  /// Reset to initial state
  void reset() {
    emit(const RegisterInitial());
  }
}
