/// User entity for domain layer
class UserEntity {
  final int id;
  final String name;
  final String email;
  final String mobile;

  const UserEntity({
    required this.id,
    required this.name,
    required this.email,
    required this.mobile,
  });
}
