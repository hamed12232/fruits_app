import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable {
  final int id;
  final String name;
  final String nameEn;
  final String details;
  final String detailsEn;
  final num price;
  final int quantity;
// From "profile_photo_path" or similar in API?
  // Looking at the JSON provided by user:
  // "data": [ { "id": 423, "name": "...", "name_en": "...", "details": "...", "price": 25, "quantity": 60 } ]
  // There is no explicit image URL in the product object in the snippet,
  // but there is "profile_photo_path": "vectorstock_42790750.png" in the *user* object in a previous response.
  // Wait, the user shared a JSON for products. Let's re-examine that JSON.
  // JSON: { "data": { "data": [ { "id": 423, "name": "...", "name_en": "...", "details": "", "details_en": "", "price": 25, "quantity": 60 } ... ] } }
  // The snippet doesn't show an image field in the individual product objects.
  // However, usually products have images. I will include it as nullable for now, or maybe it's missing from the snippet but present in real data.
  // Actually, I should stick to what's in the JSON: id, name, name_en, details, details_en, price, quantity.

  const ProductEntity({
    required this.id,
    required this.name,
    required this.nameEn,
    required this.details,
    required this.detailsEn,
    required this.price,
    required this.quantity,
  });

  @override
  List<Object?> get props => [
    id,
    name,
    nameEn,
    details,
    detailsEn,
    price,
    quantity,
  ];
}
