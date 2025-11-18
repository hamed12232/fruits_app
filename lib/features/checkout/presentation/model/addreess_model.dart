
class Address {
  final int id;
  String label;
  String name;
  String phone;
  String address;
  bool selected;

  Address({
    required this.id,
    required this.label,
    required this.name,
    required this.phone,
    required this.address,
    this.selected = false,
  });
}