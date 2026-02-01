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
}
