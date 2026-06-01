import 'package:equatable/equatable.dart';
import 'package:waterrush/features/custoomer/customer_home/domain/entities/product_entity.dart';

enum ProductDetailsStatus { initial, loading, success, failure }

class ProductDetailsState extends Equatable {
  const ProductDetailsState({
    required this.status,
    required this.message,
    this.product,
  });

  factory ProductDetailsState.initial() => const ProductDetailsState(
        status: ProductDetailsStatus.initial,
        message: '',
      );

  final ProductDetailsStatus status;
  final String message;
  final ProductEntity? product;

  ProductDetailsState copyWith({
    ProductDetailsStatus? status,
    String? message,
    ProductEntity? product,
  }) {
    return ProductDetailsState(
      status: status ?? this.status,
      message: message ?? this.message,
      product: product ?? this.product,
    );
  }

  @override
  List<Object?> get props => [status, message, product];
}
