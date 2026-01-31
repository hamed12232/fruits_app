import 'package:fruits_app/features/auth/data/models/user_model.dart';

/// Model for register API response
class RegisterResponseModel {
  final bool success;
  final String message;
  final String token;
  final UserModel? user;

  RegisterResponseModel({
    required this.success,
    required this.message,
    required this.token,
    this.user,
  });

  factory RegisterResponseModel.fromJson(Map<String, dynamic> json) {
    return RegisterResponseModel(
      success: json['success'] as bool? ?? json['status'] as bool? ?? false,
      message:
          json['message'] as String? ??
          json['error_message_en'] as String? ??
          json['error_message'] as String? ??
          'Unknown Error',
      token: json['token'] as String? ?? '',
      user: json['user'] != null
          ? UserModel.fromJson(json['user'] as Map<String, dynamic>)
          : null,
    );
  }
}
