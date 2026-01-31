/// Model for forget password API response
class ForgetPasswordResponseModel {
  final bool success;
  final String message;
  final String resetCode;
  final dynamic newPassword;

  ForgetPasswordResponseModel({
    required this.success,
    required this.message,
    required this.resetCode,
    this.newPassword,
  });

  factory ForgetPasswordResponseModel.fromJson(Map<String, dynamic> json) {
    return ForgetPasswordResponseModel(
      success: json['success'] as bool? ?? json['status'] as bool? ?? true,
      message:
          json['message'] as String? ??
          json['error_message_en'] as String? ??
          json['error_message'] as String? ??
          'Success',
      resetCode: json['reset_code'] as String? ?? '',
      newPassword: json['data']['new_password'],
    );
  }
}
