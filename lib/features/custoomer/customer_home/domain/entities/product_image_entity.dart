import 'package:equatable/equatable.dart';

class ProductImageEntity extends Equatable {
  final int id;
  final String image;
  final int sortOrder;

  const ProductImageEntity({
    required this.id,
    required this.image,
    required this.sortOrder,
  });

  @override
  List<Object?> get props => [id, image, sortOrder];
}