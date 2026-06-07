import 'package:equatable/equatable.dart';
import 'product_image_entity.dart';

class ProductEntity extends Equatable {
  final int id;
  final String title;
  final String description;
  final double price;
  final double? priceBefore;
  final List<ProductImageEntity> images;

  const ProductEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    this.priceBefore,
    required this.images,
  });

  @override
  List<Object?> get props => [
    id,
    title,
    description,
    price,
    priceBefore,
    images,
  ];
}
