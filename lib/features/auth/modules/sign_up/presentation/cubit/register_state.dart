import 'package:fruits_app/features/auth/data/models/register_response_model.dart';

/// Register states
sealed class RegisterState {
  const RegisterState();
}

/// Initial state
class RegisterInitial extends RegisterState {
  const RegisterInitial();
}

/// Loading state
class RegisterLoading extends RegisterState {
  const RegisterLoading();
}

/// Success state
class RegisterSuccess extends RegisterState {
  final RegisterResponseModel response;

  const RegisterSuccess({required this.response});
}

/// Error state
class RegisterError extends RegisterState {
  final String message;

  const RegisterError({required this.message});
}
