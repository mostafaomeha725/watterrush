import 'package:equatable/equatable.dart';
import 'product_entity.dart';

class CategoryEntity extends Equatable {
  final int id;
  final String name;
  final List<ProductEntity> products;

  const CategoryEntity({
    required this.id,
    required this.name,
    required this.products,
  });

  @override
  List<Object?> get props => [id, name, products];
}