import '../../domain/entities/product_entity.dart';
import 'product_image_model.dart';

class ProductModel extends ProductEntity {
  const ProductModel({
    required super.id,
    required super.title,
    required super.description,
    required super.price,
    super.priceBefore,
    required super.images,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      price: (json['price'] as num?)?.toDouble() ?? 0.0,
      priceBefore: (json['price_before'] as num?)?.toDouble(),
      images: (json['images'] as List?)
              ?.map((e) => ProductImageModel.fromJson(e))
              .toList() ??
          [],
    );
  }
}
