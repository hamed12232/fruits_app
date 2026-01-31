import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_app/features/auth/domain/use_cases/login_use_case.dart';
import 'package:fruits_app/features/auth/modules/sign_in/presentation/cubit/login_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Cubit for managing login state
class LoginCubit extends Cubit<LoginState> {
  final LoginUseCase loginUseCase;

  LoginCubit({required this.loginUseCase}) : super(const LoginInitial());

  /// Perform login with phone/email and password
  Future<void> login({
    required String phoneEmail,
    required String password,
  }) async {
    emit(const LoginLoading());

    final result = await loginUseCase(
      phoneEmail: phoneEmail,
      password: password,
    );

    result.fold((error) => emit(LoginError(message: error)), (response) async {
      if (response.success) {
        // Save token to shared preferences
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('auth_token', response.token);

        emit(LoginSuccess(response: response));
      } else {
        emit(LoginError(message: 'Login failed'));
      }
    });
  }

  /// Reset to initial state
  void reset() {
    emit(const LoginInitial());
  }
}
