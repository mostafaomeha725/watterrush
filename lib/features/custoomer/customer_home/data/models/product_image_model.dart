import '../../domain/entities/product_image_entity.dart';

class ProductImageModel extends ProductImageEntity {
  const ProductImageModel({
    required super.id,
    required super.image,
    required super.sortOrder,
  });

  factory ProductImageModel.fromJson(Map<String, dynamic> json) {
    return ProductImageModel(
      id: json['id'],
      image: json['image'] ?? '',
      sortOrder: json['sort_order'] ?? 0,
    );
  }
}
