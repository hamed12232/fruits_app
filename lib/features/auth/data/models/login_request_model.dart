/// Model for login request body
class LoginRequestModel {
  final String phoneEmail;
  final String password;

  LoginRequestModel({required this.phoneEmail, required this.password});

  Map<String, dynamic> toJson() {
    return {'phone_email': phoneEmail, 'password': password};
  }
}
