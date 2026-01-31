import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_app/features/auth/domain/use_cases/forget_password_use_case.dart';
import 'package:fruits_app/features/auth/modules/verify_number/presentation/cubit/forget_password_state.dart';

/// Cubit for managing forget password state
class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  final ForgetPasswordUseCase forgetPasswordUseCase;

  ForgetPasswordCubit({required this.forgetPasswordUseCase})
    : super(const ForgetPasswordInitial());

  /// Perform forget password request
  Future<void> forgetPassword({required String email}) async {
    emit(const ForgetPasswordLoading());

    final result = await forgetPasswordUseCase(email: email);

    result.fold((error) => emit(ForgetPasswordError(message: error)), (
      response,
    ) {
      if (response.success) {
        emit(ForgetPasswordSuccess(response: response));
      } else {
        emit(ForgetPasswordError(message: response.message));
      }
    });
  }
}
