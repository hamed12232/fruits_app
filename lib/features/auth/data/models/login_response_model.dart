import 'package:fruits_app/features/auth/data/models/user_model.dart';

/// Model for login API response
class LoginResponseModel {
  final bool success;
  final String token;
  final UserModel? user;

  LoginResponseModel({required this.success, required this.token, this.user});

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      success: json['success'] as bool? ?? json['status'] as bool? ?? false,
      token: json['token'] as String? ?? '',
      user: json['user'] != null
          ? UserModel.fromJson(json['user'] as Map<String, dynamic>)
          : null,
    );
  }
}
