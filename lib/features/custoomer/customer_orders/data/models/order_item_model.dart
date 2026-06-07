import 'package:waterrush/features/custoomer/customer_orders/domain/entities/order_item_entity.dart';

class OrderItemModel extends OrderItemEntity {
  const OrderItemModel({
    required super.id,
    required super.productId,
    super.bundleId,
    required super.title,
    required super.price,
    required super.image,
    required super.quantity,
    required super.unitPrice,
    required super.subtotal,
  });

  factory OrderItemModel.fromJson(Map<String, dynamic> json) {
    return OrderItemModel(
      id: json['id'] is int
          ? json['id'] as int
          : int.tryParse(json['id'].toString()) ?? 0,
      productId: json['product_id'] is int
          ? json['product_id'] as int
          : int.tryParse(json['product_id'].toString()) ?? 0,
      bundleId: json['bundle_id'] is int?
          ? json['bundle_id'] as int?
          : int.tryParse(json['bundle_id']?.toString() ?? ''),
      title: json['title'] ?? '',
      price: json['price'] is num
          ? (json['price'] as num).toDouble()
          : double.tryParse(json['price'].toString()) ?? 0.0,
      image: json['image'] ?? '',
      quantity: json['quantity'] is int
          ? json['quantity'] as int
          : int.tryParse(json['quantity'].toString()) ?? 0,
      unitPrice: json['unit_price'] is num
          ? (json['unit_price'] as num).toDouble()
          : double.tryParse(json['unit_price'].toString()) ?? 0.0,
      subtotal: json['subtotal'] is num
          ? (json['subtotal'] as num).toDouble()
          : double.tryParse(json['subtotal'].toString()) ?? 0.0,
    );
  }
}
