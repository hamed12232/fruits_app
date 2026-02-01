import 'package:fruits_app/features/product/domain/entities/product_entity.dart';

class ProductModel extends ProductEntity {
  const ProductModel({
    required super.id,
    required super.name,
    required super.nameEn,
    required super.details,
    required super.detailsEn,
    required super.price,
    required super.quantity,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'] as int? ?? 0,
      name: json['name'] as String? ?? '',
      nameEn: json['name_en'] as String? ?? '',
      details: json['details'] as String? ?? '',
      detailsEn: json['details_en'] as String? ?? '',
      price: json['price'] as num? ?? 0,
      quantity: json['quantity'] as int? ?? 0,
    );
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) =>
      ProductModel.fromJson(map);

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'name_en': nameEn,
      'details': details,
      'details_en': detailsEn,
      'price': price,
      'quantity': quantity,
    };
  }

  factory ProductModel.fromEntity(ProductEntity entity) {
    return ProductModel(
      id: entity.id,
      name: entity.name,
      nameEn: entity.nameEn,
      details: entity.details,
      detailsEn: entity.detailsEn,
      price: entity.price,
      quantity: entity.quantity,
    );
  }
}
