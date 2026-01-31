import 'package:dio/dio.dart';

/// Model for register request body
class RegisterRequestModel {
  final String name;
  final String mobile;
  final String email;
  final String password;
  final String cPassword;
  final String? profilePhotoPath;
  final String? address;
  final String? onesignalId;

  RegisterRequestModel({
    required this.name,
    required this.mobile,
    required this.email,
    required this.password,
    required this.cPassword,
    this.profilePhotoPath,
    this.address,
    this.onesignalId,
  });

  /// Convert to FormData for multipart/form-data request
  FormData toFormData() {
    final formData = FormData.fromMap({
      'name': name,
      'mobile': mobile,
      'email': email,
      'password': password,
      'c_password': cPassword,
      if (profilePhotoPath != null) 'profile_photo_path': profilePhotoPath,
      if (address != null) 'address': address,
      if (onesignalId != null) 'onesignal_id': onesignalId,
    });
    return formData;
  }
}
