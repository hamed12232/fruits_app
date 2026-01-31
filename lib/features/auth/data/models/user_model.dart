/// User model for API response
class UserModel {
  final int id;
  final String name;
  final String email;
  final String mobile;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.mobile,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as int? ?? 0,
      name: json['name'] as String? ?? '',
      email: json['email'] as String? ?? '',
      mobile: json['mobile'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name, 'email': email, 'mobile': mobile};
  }
}
