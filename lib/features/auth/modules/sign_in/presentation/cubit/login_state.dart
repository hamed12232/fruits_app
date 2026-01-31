import 'package:fruits_app/features/auth/data/models/login_response_model.dart';

/// Login states
sealed class LoginState {
  const LoginState();
}

/// Initial state
class LoginInitial extends LoginState {
  const LoginInitial();
}

/// Loading state
class LoginLoading extends LoginState {
  const LoginLoading();
}

/// Success state
class LoginSuccess extends LoginState {
  final LoginResponseModel response;

  const LoginSuccess({required this.response});
}

/// Error state
class LoginError extends LoginState {
  final String message;

  const LoginError({required this.message});
}
