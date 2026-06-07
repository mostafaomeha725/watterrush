import 'package:equatable/equatable.dart';

class OrderItemEntity extends Equatable {
  final int id;
  final int productId;
  final int? bundleId;
  final String title;
  final double price;
  final String image;
  final int quantity;
  final double unitPrice;
  final double subtotal;

  const OrderItemEntity({
    required this.id,
    required this.productId,
    this.bundleId,
    required this.title,
    required this.price,
    required this.image,
    required this.quantity,
    required this.unitPrice,
    required this.subtotal,
  });

  @override
  List<Object?> get props => [
    id,
    productId,
    bundleId,
    title,
    price,
    image,
    quantity,
    unitPrice,
    subtotal,
  ];
}
