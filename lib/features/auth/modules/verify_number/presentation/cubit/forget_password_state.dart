import 'package:fruits_app/features/auth/data/models/forget_password_response_model.dart';

/// Forget Password states
sealed class ForgetPasswordState {
  const ForgetPasswordState();
}

/// Initial state
class ForgetPasswordInitial extends ForgetPasswordState {
  const ForgetPasswordInitial();
}

/// Loading state
class ForgetPasswordLoading extends ForgetPasswordState {
  const ForgetPasswordLoading();
}

/// Success state
class ForgetPasswordSuccess extends ForgetPasswordState {
  final ForgetPasswordResponseModel response;

  const ForgetPasswordSuccess({required this.response});
}

/// Error state
class ForgetPasswordError extends ForgetPasswordState {
  final String message;

  const ForgetPasswordError({required this.message});
}
